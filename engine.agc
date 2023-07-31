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
	
	SetErrorMode(2)
	
	// set window properties
	SetWindowTitle( "ExpandingGrid" )
	SetWindowSize( 1920, 1080, 0 )
	SetWindowAllowResize( 1 ) // allow the user to resize the window
	
	// set display properties
	SetVirtualResolution( 160, 88 ) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	SetSyncRate( 60, 0 ) // 30fps instead of 60 to save battery
	SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
	UseNewDefaultFonts( 1 )
	SetAntialiasMode(0)
	SetDefaultMagFilter( 0 ) 
	SetDefaultMagFilter( 0 ) 
endfunction