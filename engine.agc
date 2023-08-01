/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	engine.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

function InitEngine()
	
	// show all errors
	
	SetErrorMode(CONST_ERROR_MODE)
	
	// set window properties
	SetWindowTitle(CONST_GAME_TITLE)
	SetWindowSize( CONST_WINDOW_WIDTH, CONST_WINDOW_HEIGHT, 0 )
	SetWindowAllowResize( CONST_RESIZE_ALLOWED ) // allow the user to resize the window
	
	// set display properties
	SetVirtualResolution( CONST_VIRTUAL_WIDTH, CONST_VIRTUAL_HEIGHT ) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	SetSyncRate( CONST_SYNC_RATE, 0 ) // 30fps instead of 60 to save battery
	SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
	UseNewDefaultFonts( 1 )
	SetAntialiasMode(0)
	SetDefaultMagFilter( 0 ) 
	SetDefaultMagFilter( 0 ) 
endfunction