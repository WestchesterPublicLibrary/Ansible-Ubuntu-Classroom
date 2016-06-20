/*
*
* Thanks for using this library! If you like it, please drop me a comment at bart@sbo-dewindroos.nl.
*
* File     : AdvButton.h
* Version  : 1.0
* Released : 24/01/2010
* Author   : Bart Meijer (bart@sbo-dewindroos.nl)
*
* This is the Advanced Button library for the Arduino platform. It will enable you to easily 
* react to user input using simple press-to-make buttons. Features include:
* - Event based implementation 
* - Recording the time a button is pressed
* - Adjustable repeat delay, start delay for the keypressed event
* - requires only a single call in the main loop
*
* This file defines the AdvButton class
*
* Usage: 
* - Include AdvButton.h and ButtonManager.h in your sketch
* - Add a call to ButtonManager::instance()->checkButtons(); in your main loop
* - Declare each button and define the events using a overload of AdvButton ( AdvButton button = AdvButton(<pin>) )
* - Declare the required event functions ( void OnKeyXXX(AdvButton* but) )
* - See the comments below for more help
*/

#if defined(ARDUINO) && ARDUINO >= 100
      #include "Arduino.h"
#else
      #include "WProgram.h"
#endif

#ifndef ADVBUTTON_H
#define ADVBUTTON_H

class AdvButton;

typedef void (*advButtonCallback_t)(AdvButton*);

enum buttonMode {BTN_DIGITAL, BTN_ANALOG};

class AdvButton
{
public:
	/*
	This is the first constructor call, use it for keypress buttons 
	pin        : pin number of the button
	OnKeyPress : Function to call when the event occurs
	repeat     : time between the event is raised while pressing the button (optional)
	startDelay : amount of time between the initial keypress event and when to start repeating (optional)
	mode       : type of button, analog or digital
	*/
	AdvButton(uint8_t pin, void (*OnKeyPress)(AdvButton*) , unsigned long repeatTime = 300, unsigned long startDelay = 500, buttonMode mode = BTN_DIGITAL);

	/*
	This is the second constructor call, use it for other types of buttons
	pin        : pin number of the button
	OnKeyPress : Function to call when the keypress event occurs (optional)
	OnKeyDown  : Function to call when the keydown event occurs (optional) 
	OnKeyUp    : Function to call when the keyup event occurs (optional) 
	mode       : type of button, analog or digital
	*/
	AdvButton(uint8_t pin, void (*OnKeyPress)(AdvButton*) = NULL, void (*OnKeyDown)(AdvButton*) = NULL, void (*OnKeyUp)(AdvButton*) = NULL, buttonMode mode = BTN_DIGITAL);

	// Checks the state of the button and triggers events accordingly
	// Will be called from the ButtonManager
	void check();

	// Sets the function to call when the keypress event occurs
	void setOnKeyPress(void (*f)(AdvButton*));

	// Sets the function to call when the keydown event occurs
	void setOnKeyDown(void (*f)(AdvButton*));

	// Sets the function to call when the keyup event occurs
	void setOnKeyUp(void (*f)(AdvButton*));

	// Sets the time (milliseconds) between each repeated keypress event
	void setRepeat(unsigned long repeatTime);

	// Sets the delay (milliseconds) before the keypress event is repeated
	void setStartDelay(unsigned long startDelay);

	// Changes the pin number
	void setPin(uint8_t pin);
	
	// Retrieves the amount of milliseconds the button was pressed
	// only valid in keyevents
	unsigned long getPressTime();

private:
	/* private variables */
	advButtonCallback_t func_keyUp;		// function called on button release
	advButtonCallback_t func_keyDown;	// function called on button press
	advButtonCallback_t func_keyPress;	// function called on button press & repeat
	uint8_t pin;						// pin the button is attached to
	buttonMode mode;					// flag for if the pin is analog or digital
	int debounceTime;					// time to wait to debounce button [ms]
	unsigned long repeatTime;			// time to wait for repeat press [ms]
	unsigned long startDelay;			// time to wait before first repeat [ms]
	unsigned long startPressTime;		// timestamp when button is first pressed
	unsigned long lastChangeTime;		// timestamp when button state last changed
	unsigned long prevPressTime;		// timestamp when button was last pressed
	int lastState;						// last state of button pin [HIGH or LOW]
};

#endif
