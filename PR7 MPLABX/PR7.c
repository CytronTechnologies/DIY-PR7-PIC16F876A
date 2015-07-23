//==========================================================================
//	Author				: Cytron Technologies
//	Project				: Stepper motor driver control
//	Project description	: Controlling stepper motor using SD02B
//	Version 			: 2.1 (The frequency is increased to cater for stepper motor MO-STEP-17PM-J3X)
//**This sample source code should be compiled with HI-TECH C Compiler for PIC10/12/16
//  MCUs operate in Lite Mode
//
//	include
//==========================================================================
#include <pic.h>            //include header file

//	configuration
//==========================================================================
__CONFIG ( 0x3F32 );        //The configuration bits “0x3F32” is used to make configure the 
                            //correct setting for this PIC, 0x refers to Hexadecimal whereas 3F32 means:
                            //• Set the oscillator as high speed (HS – 4MHz to 20MHz crystal)
                            //•	Off the Watchdog Timer
                            //•	On Power On Timer
                            //•	Off Brown Out Detect
                            //•	Disable Low Voltage Program
                            //•	Off data EEPROM Read Protect
                            //•	Off Flash Program Write Protection
                            //•	Off Code Protect


//	define
//==========================================================================
#define sw1			RB1
#define sw2			RB2
#define sw3   		RB4
#define led1		RC0
#define led2		RC1
#define led3		RC2
#define pulse		RC3
#define direction	RC4
#define en			RC5

//	function prototype
//==========================================================================
void delay(unsigned long data);
void rotate(void);

//	global variable
//==========================================================================
unsigned char on=0, ccw=0, run=0;

//	main function
//==========================================================================
void main(void)
{

	unsigned char turn=0;
	
	TRISA=0b11111111;						//set PORTA as input
	TRISB=0b11111111;						//set PORTB as input
	TRISC=0B00000000;						//set PORTD as output					
						
	PORTC=0;								//clear PORTC
	ADCON1=0b00000000;						//set PORTA as analog input, left justified
	ADCON0=0b01000001;						//configure AN0 as anolog channel
	

	led1 = 0;
	led2 = 0;
	led3 = 0;


	while(1)
	{
		if(!sw1)
		{
    		while(sw1==0)continue;			//wait switch 1 to release
			delay(6250);					//wait 50ms to prevent bouncing error at switch
			on^=1;                          //interchange between on and off for each press (on = on Ex-OR with 1)
			led1^=1;                        //interchange between on and off for each press (led1 = led1 Ex-OR with 1)
		}
		if(!sw2)
		{
			while(sw2==0)continue;			//wait switch 2 to release
			delay(6250);					//wait 50ms to prevent bouncing error at switch
			ccw^=1;                          //interchange between cw and ccw for each press (ccw = on Ex-OR with 1)
			led2^=1;                        //interchange between on and off for each press (led2 = led2 Ex-OR with 1)
		}
		if(!sw3)
		{
			while(sw3==0)continue;			//wait switch 3 to release
			delay(6250);					//wait 50ms to prevent bouncing error at switch
			run^=1;                         //interchange between run and stop for each press (ccw = on Ex-OR with 1)
			led3^=1;                        //interchange between on and off for each press (led3 = led3 Ex-OR with 1)
		}

		while(sw1&&sw2&&sw3)                     //loopinng if no button is pressed
		{
			if(on)                               //on = 1        
			{
				en=1;						  	//set enable
			
				if(ccw)                         //ccw = 1
				{
					direction=1;				//set direction pin on motor driver(CCW)
					if(run)						//run = 1
					{
						rotate();				//motor start rotating
					}
					else
					{
						pulse=0;                //run = 0
					}
				}
				else                            //ccw = 0                  
				{
					direction=0;				//clear direction pin on motor driver(CW)
					if(run)						//run = 1
					{
						rotate();				//motor start rotating
					}
					else                        //run = 0
					{
						pulse=0;
					}
				}	
			}
			else                               //on = 0
			{
				led1=0;			           	//LED1 off
				led2=0;						//LED2 off
				led3=0;						//LED3 off
				en=0;
				ccw=0;
				run=0;
			}
		}
	}
}

//=========================FUNCTIONS======================================
//========================================================================	
void delay(unsigned long data)         
{
	for( ;data>0;data-=1);
}


void rotate(void)
{
	unsigned char i=0;						

	GO=1;								//set ADGO to activate ADC
	while(GO==1)continue;				//wait process of ADC complete

	//---------------------------------------------------------
	// IF the max speed for motor driver = 20kHz
	// and T = 1/f. Tmax = 1/10k = 50us
	//
	// From simulation, "delay(1);" need 40 instruction cycles
	// Period for 1 instruction cycle = 1/(20W/4) = 200ns
	// Period for 40 instruction cycles = 200n * 40 = 8us
	// So, period for "delay(1);" also = 8us
	//
	// Now if we want to generate a delay of 20us
	// the value that we need to put for "delay(x);" is:
	//
	//		x = 20us/8us*1 = 6.25 = 6
	//
	//----------------------------------------------------------  
	
	if(ADRESH==0)                           // stop
	{
		pulse=0;
	}

	else if((255-ADRESH)<=6)		        // maximum speed ( control by potential meter )	    	
	{
		i = 6;								//read resultant ADC value from ADRESH
		pulse=1;							//set pulse pin on motor driver
		delay(i);							//delay time depend to the ADC value
		pulse=0;							//clear pulse pin on motor driver
		delay(i);
	}
	else
	{
		i = 255-ADRESH;                     //the higher the value of ADRESH, the faster the steps change.
		pulse=1;							//set pulse pin on motor driver
		delay(i);							//delay time depend to the ADC value
		pulse=0;							//clear pulse pin on motor driver
		delay(i);
	}
}


