//==========================================================================
//	Author				: Cytron Technologies
//	Project				: Stepper motor driver control
//	Project description            : Controlling stepper motor using SD02B
//                                       The PIC used in this project is PIC16F876A.
//                                       This sample source code should be compiled with HI-TECH C Compiler
//	Version 			: 2.1 (The frequency is increased to cater for stepper motor MO-STEP-17PM-J3X)
//                      
//==========================================================================
#if defined(__XC8)
   #include <xc.h>
   #pragma config CONFIG = 0x3F32
#else
#include <htc.h>			//include the PIC microchip header file

//===========================================================================
// 	configuration
//============================================================================
__CONFIG (0x3F32);
//FOSC = HS        // Oscillator Selection bits (HS oscillator)
//WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
//PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)
//BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
//LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
//CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
//WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
//CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)



#endif
//==========================================================================
#define SW1			RB1
#define SW2			RB2
#define SW3   		RB4
#define LED1		RC0
#define LED2		RC1
#define LED3		RC2
#define PULSE		RC3
#define DIRECTION	RC4
#define EN			RC5

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
	
	TRISA=0b11111111;		//set PORTA as input
	TRISB=0b11111111;		//set PORTB as input
	TRISC=0B00000000;		//set PORTD as output					
						
	PORTC=0;				//clear PORTC
	ADCON1=0b00000000;		//set PORTA as analog input, left justified
	ADCON0=0b01000001;		//configure AN0 as anolog channel
	

	LED1 = 0;
	LED2 = 0;
	LED3 = 0;


	while(1)
	{
		if(!SW1)
		{
    		while(SW1==0)continue;		//wait switch 1 to release
			delay(6250);				//wait 50ms to prevent bouncing error at switch
			on^=1;                  	//interchange between on and off for each press (on = on Ex-OR with 1)
			LED1^=1;                	//interchange between on and off for each press (led1 = led1 Ex-OR with 1)
		}
		if(!SW2)
		{
			while(SW2==0)continue;      //wait switch 2 to release
			delay(6250);                //wait 50ms to prevent bouncing error at switch
			ccw^=1;                     //interchange between cw and ccw for each press (ccw = on Ex-OR with 1)
			LED2^=1;                    //interchange between on and off for each press (led2 = led2 Ex-OR with 1)
		}
		if(!SW3)
		{
			while(SW3==0)continue;	//wait switch 3 to release
			delay(6250);			//wait 50ms to prevent bouncing error at switch
			run^=1;                 //interchange between run and stop for each press (ccw = on Ex-OR with 1)
			LED3^=1;                //interchange between on and off for each press (led3 = led3 Ex-OR with 1)
		}

		while(SW1&&SW2&&SW3)             //loopinng if no button is pressed
		{
			if(on)                       //on = 1
			{
				EN=1;                    //set enable
			
				if(ccw)                  //ccw = 1
				{
					DIRECTION=1;         //set direction pin on motor driver(CCW)
					if(run)              //run = 1
					{
						rotate();        //motor start rotating
					}
					else
					{
						PULSE=0;         //run = 0
					}
				}
				else                     //ccw = 0                  
				{
					DIRECTION=0;         //clear direction pin on motor driver(CW)
					if(run)              //run = 1
					{
						rotate();        //motor start rotating
					}
					else                  //run = 0
					{
						PULSE=0;
					}
				}	
			}
			else                           //on = 0
			{
				LED1=0;       //LED1 off
				LED2=0;       //LED2 off
				LED3=0;       //LED3 off
				EN=0;
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

	GO=1;						//set ADGO to activate ADC
	while(GO==1)continue;		//wait process of ADC complete

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
	
	if(ADRESH==0)                       // stop
	{
		PULSE=0;
	}

	else if((255-ADRESH)<=6)    // maximum speed ( control by potential meter )
	{
		i = 6;                  //read resultant ADC value from ADRESH
		PULSE=1;		     	//set pulse pin on motor driver
		delay(i);		     	//delay time depend to the ADC value
		PULSE=0;		     	//clear pulse pin on motor driver
		delay(i);
	}
	else
	{
		i = 255-ADRESH;              //the higher the value of ADRESH, the faster the steps change.
		PULSE=1;                     //set pulse pin on motor driver
		delay(i);                    //delay time depend to the ADC value
		PULSE=0;                     //clear pulse pin on motor driver
		delay(i);
	}
}


