/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	helpers.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	TYPES
	
*/

/*

	FUNCTIONS
	
*/

/*
	EXAMPLE:
	For i = 0.0 To 1.0 Step 0.1
		
	    x_arr[count1] = Lerp(p1, p2, i)
	    y_arr[count1] = Lerp(p1, p2, i)
	     
	    Inc count1
	Next i#
*/

/*
//https://forum.thegamecreators.com/thread/193427

//This will calculate how many points you need to make a line.
pointsneeded = sqrt( (posx1#-posx2#)^2 + (posy1#-posy2#)^2 )

//This will draw a line using one sprite.
posx1# = 20.0
posy1# = 20.0
posx2# = 80.0
posy2# = 80.0
 
global pensize = 2
global maxlines = 1
dim spritelines[ maxlines ]
spritelines[1] = createSprite ( 0 )
setSpriteSize ( spritelines[1] , pensize, pensize )
SetSpriteColor ( spritelines[1] , 255 , 255 , 255 , 255 )
SetSpritePosition( spritelines[1] , 1000 , 1000 )
setSpriteAngle ( spritelines[1] , 0 )
 
do
   // do line
   SetSpriteColor ( spritelines[1] , 128 , 128 ,128 , 255 )
   SetSpritePosition( spritelines[1] , posx1# , posy1# )
   dx = posx1#-posx2#
   dy = posy1#-posy2#
   di = sqrt( (dx)^2 + (dy)^2 ) // calc dist
   setSpriteSize ( spritelines[1] , pensize, di )
   SetSpriteOffset( spritelines[1] , 1 , 1 )
   sngAngle = aTanFull( dx , dy )
   setSpriteAngle ( spritelines[1] , sngAngle )
 Sync(  )
loop
*/

function Lerp(src as float, dest as float, decimal as float)
	result as float
    result = src * ( 1 - decimal ) + dest * decimal
EndFunction result

function Array_Integer_FindAndRemove(array ref as integer[], id as integer)
	if(array.length = -1) then exitfunction -1
	
	//remove if any performance hit is found.
	array.sort()
	index = array.find(id)
	
	if(index <> -1) then array.remove(index)
	
endfunction index

function Button_EventTest(upSprite as integer, downSprite as integer)
	if(GetSpriteHitTest(upSprite, InputHandler_Data.pointerPosX, InputHandler_Data.pointerPosY) = 1)
		if(InputHandler_Data.pointer = CONST_INPUT_PRESSED)
			SetSpriteVisible(downSprite, 1)
			SetSpriteVisible(upSprite, 0)
			AudioManager_PlaySound(audioManager, ASSET_SOUND_SELECT_SOUND_2, 100)
			exitfunction 0
		elseif(InputHandler_Data.pointer = CONST_INPUT_RELEASED)
			SetSpriteVisible(downSprite, 0)
			SetSpriteVisible(upSprite, 1)
			exitfunction 1
		endif
	elseif(GetSpriteVisible(downSprite) = 1)
			SetSpriteVisible(downSprite, 0)
			SetSpriteVisible(upSprite, 1)
			exitfunction 0
	endif
endfunction -1

function Button_ToggleEventTest(enabledSprite as integer, disabledSprite as integer)
	if(GetSpriteHitTest(enabledSprite, InputHandler_Data.pointerPosX, InputHandler_Data.pointerPosY) = 1 and InputHandler_Data.pointer = CONST_INPUT_PRESSED)
		if(GetSpriteVisible(enabledSprite) = 1)
			SetSpriteActive(enabledSprite, 0)
			SetSpriteVisible(enabledSprite, 0)
			SetSpriteActive(disabledSprite, 1)
			SetSpriteVisible(disabledSprite, 1)
			AudioManager_PlaySound(audioManager, ASSET_SOUND_SELECT_SOUND_2, 100)
			exitfunction 0
		else
			SetSpriteActive(enabledSprite, 1)
			SetSpriteVisible(enabledSprite, 1)
			SetSpriteActive(disabledSprite, 0)
			SetSpriteVisible(disabledSprite, 0)
			AudioManager_PlaySound(audioManager, ASSET_SOUND_SELECT_SOUND_2, 100)
			exitfunction 1
		endif
	endif
endfunction -1