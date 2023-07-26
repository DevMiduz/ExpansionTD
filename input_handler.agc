/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	input_handler.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	TYPES
	
*/

type InputData
	up as integer
	down as integer
	left as integer
	right as integer
	pointer as integer
	pointerPosX as integer
	pointerPosY as integer	
	pause as integer
	confirm as integer
	cancel as integer
endtype

type InputBindings
	up as integer[] 
	down as integer[]
	left as integer[]
	right as integer[]
	pause as integer[]
	confirm as integer[]
	cancel as integer[]
endtype

/*

	GLOBALS

*/

global InputHandler_Data as InputData
global InputHandler_InputBindings as InputBindings

/*

	FUNCTIONS
	
*/

function InputHandler_Setup()
	InputHandler_InputBindings.up = [KEY_UP, KEY_W]
	InputHandler_InputBindings.down = [KEY_DOWN, KEY_S]
	InputHandler_InputBindings.left = [KEY_LEFT, KEY_A]
	InputHandler_InputBindings.right = [KEY_RIGHT, KEY_D]
	InputHandler_InputBindings.pause = [KEY_ESCAPE]
	InputHandler_InputBindings.confirm = [KEY_ENTER]
	InputHandler_InputBindings.cancel = [KEY_ESCAPE]
endfunction

function InputHandler_InputDataUpdate()
	InputHandler_UpdateUp()
	InputHandler_UpdateDown()
	InputHandler_UpdateLeft()
	InputHandler_UpdateRight()
	InputHandler_UpdatePause()
	InputHandler_UpdateConfirm()
	InputHandler_UpdateCancel()
	
	InputHandler_UpdatePointer()
	InputHandler_UpdatePointerPosition()
	
endfunction InputHandler_Data

function InputHandler_UpdateUp()
	InputHandler_Data.up = InputHandler_UpdateKeyBinding(InputHandler_InputBindings.up)
endfunction

function InputHandler_UpdateDown()
	InputHandler_Data.down = InputHandler_UpdateKeyBinding(InputHandler_InputBindings.down)
endfunction

function InputHandler_UpdateLeft()
	InputHandler_Data.left = InputHandler_UpdateKeyBinding(InputHandler_InputBindings.left)
endfunction

function InputHandler_UpdateRight()
	InputHandler_Data.right = InputHandler_UpdateKeyBinding(InputHandler_InputBindings.right)
endfunction

function InputHandler_UpdatePause()
	InputHandler_Data.pause = InputHandler_UpdateKeyBinding(InputHandler_InputBindings.pause)
endfunction

function InputHandler_UpdateConfirm()
	InputHandler_Data.confirm = InputHandler_UpdateKeyBinding(InputHandler_InputBindings.confirm)
endfunction

function InputHandler_UpdateCancel()
	InputHandler_Data.cancel = InputHandler_UpdateKeyBinding(InputHandler_InputBindings.cancel)
endfunction

function InputHandler_UpdatePointer()
	InputHandler_Data.pointer = InputHandler_UpdatePointerState()
endfunction

function InputHandler_UpdatePointerPosition()
	InputHandler_Data.pointerPosX = GetPointerX()
	InputHandler_Data.pointerPosY = GetPointerY()
endfunction

function InputHandler_UpdateKeyBinding(inputBindings as integer[])
	keyOutput as integer
	prevKeyOutput as integer
	keyBinding as integer 
	
	for i = 0 to inputBindings.length
		keyBinding = inputBindings[i]
		
		prevKeyOutput = keyOutput
		keyOutput = InputHandler_UpdateKeyState(keyBinding)
		
		if(prevKeyOutput = CONST_INPUT_HELD) 
			keyOutput = prevKeyOutput
		endif
	next i
endfunction keyOutput

function InputHandler_UpdatePointerState()

	if(GetPointerPressed() = 1)
		exitfunction CONST_INPUT_PRESSED
	elseif(GetPointerState() = 1)
		exitfunction CONST_INPUT_HELD
	elseif(GetPointerReleased() = 1)
		exitfunction CONST_INPUT_RELEASED
	endif
	
endfunction CONST_INPUT_IDLE

function InputHandler_UpdateKeyState(inputKey as integer)

	if(GetRawKeyPressed(inputKey) = 1)
		exitfunction CONST_INPUT_PRESSED
	elseif(GetRawKeyState(inputKey) = 1)
		exitfunction CONST_INPUT_HELD
	elseif(GetRawKeyReleased(inputKey) = 1)
		exitfunction CONST_INPUT_RELEASED
	endif
	
endfunction CONST_INPUT_IDLE