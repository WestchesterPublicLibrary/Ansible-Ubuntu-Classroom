/*
*
* Thanks for using this library! If you like it, please drop me a comment at bart@sbo-dewindroos.nl.
*
* File     : AdvButton.cpp
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
* This file implements the AdvButton class
*
*/

#include "AdvButton.h"
#include "ButtonManager.h"

#define DEBOUNCE_TIME	100				// debounce time [ms]

AdvButton::AdvButton(uint8_t pin,void (*OnKeyPress)(AdvButton*) , unsigned long repeatTime, unsigned long startDelay, buttonMode mode)
{
	setPin(pin);						// Save button's pin number.
	setRepeat(repeatTime);				// Save delay for repeat presses.
	setStartDelay(startDelay);			// Save delay for first repeat.
	setOnKeyPress(*OnKeyPress);			// Save function for press & release.
	setOnKeyDown(NULL);					// Set no function for press.
	setOnKeyUp(NULL);					// Set no function for release.
	debounceTime = DEBOUNCE_TIME;		// Set the button's debounce time.
	ButtonManager::instance()->addButton(this);
	if (mode == BTN_DIGITAL)			// If button is on a digital pin...
		pinMode(pin, OUTPUT);			// set pin to output mode (WHY?)
	this->mode = mode;					// Save pin's mode.
	lastChangeTime = millis();			// Save when the button was set LOW.
	lastState = LOW;					// Initialize the button's state to LOW.
}

AdvButton::AdvButton(uint8_t pin,void (*OnKeyPress)(AdvButton*) , void (*OnKeyDown)(AdvButton*),void (*OnKeyUp)(AdvButton*), buttonMode mode)
{
	setPin(pin);						// Save button's pin number.
	setRepeat(300);						// Save preset delay for repeat presses.
	setStartDelay(500);					// Save preset delay for first repeat.
	setOnKeyPress(*OnKeyPress);			// Save function for press & release.
	setOnKeyDown(*OnKeyDown);			// Save function for press.
	setOnKeyUp(*OnKeyUp);				// Save function for release.

	debounceTime = DEBOUNCE_TIME;		// Set the button's debounce time.
	ButtonManager::instance()->addButton(this);
	if (mode == BTN_DIGITAL)			// If button is on a digital pin...
		pinMode(pin, OUTPUT);			// set pin to output mode. (WHY?)
	this->mode = mode;					// Save pin's mode.
	lastChangeTime = millis();			// Save when the button was set LOW.
	lastState = LOW;					// Initialize the button's state to LOW.
}

void AdvButton::check()
{
	int currentState;					// state of button pin [HIGH or LOW]

	// Determine the current pin state.
	if (mode == BTN_DIGITAL)
		currentState = digitalRead(pin);
	else if (mode == BTN_ANALOG)
		currentState = analogRead(pin) > 200 ? HIGH : LOW;

	// If the button state has changed...
	if (lastState != currentState)
	{
		// If the button has been pressed long enough to be debounced...
		if (millis() - lastChangeTime < debounceTime)
		{
			// Do nothing else.
			return;
		}

		// If the button has not yet been debounced...

		// Save the time that the button was pressed.
		lastChangeTime = millis();

		// Save the state.
		lastState = currentState;
	}

	// If the button is being pressed...
	if (currentState == HIGH)
	{
		// Last time we checked, was the button still up?
		if (startPressTime == 0)
		{
			// Mark the start time.
			startPressTime = millis();

			// If a "button press" function exists, call it.
			if (func_keyDown != NULL)
				func_keyDown(this);

			// If a "button press & release" function exists, call it.
			if (func_keyPress != NULL)
				func_keyPress(this);
		}

		// Is repeating enabled?
		if ((repeatTime > 0 ) && (func_keyPress != NULL))
		{
			// Is the startdelay passed?
			if (millis() >= startPressTime + startDelay)
			{
				// Is it time for a keypressed call?
				if ((millis() - prevPressTime) > repeatTime)
				{
					prevPressTime = millis();
					func_keyPress(this);
				}
			}
			else
				prevPressTime = millis();
		}
	}

	// If the button is released...
	else
	{
		// Reset the timestamp for when button is pressed.
		prevPressTime = 0;

		// Was it previously pressed?
		if (startPressTime != 0)
		{
			// If a "button release" function exists, call it.
			if (func_keyUp != NULL)
				func_keyUp(this);

			// Reset the start time.
			startPressTime = 0;
		}
	}

}

unsigned long AdvButton::getPressTime()
{
	return millis() - startPressTime;
}

void AdvButton::setOnKeyPress(void (*f)(AdvButton*))
{
	func_keyPress = (*f);
}

void AdvButton::setOnKeyDown(void (*f)(AdvButton*))
{
	func_keyDown = (*f);
}

void AdvButton::setOnKeyUp(void (*f)(AdvButton*))
{
	func_keyUp = (*f);
}

void AdvButton::setRepeat(unsigned long repeatTime)
{
	this->repeatTime = repeatTime;
}

void AdvButton::setStartDelay(unsigned long startDelay)
{
	this->startDelay = startDelay;
}

void AdvButton::setPin(uint8_t pin)
{
	this->pin = pin;
}
