/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	main.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	INCLUDES

*/

#include "includes.agc"

/*

	CONSTANTS

*/

/*

	FUNCTIONS
	
*/

/*

	MAIN PROGRAM

*/

InitEngine()
InitGame()

do
    Print( ScreenFPS() )
    InputHandler_InputDataUpdate()
    SceneManager_Sync(sceneManager)
    EventHandler_RunEvents(eventHandler)
    Sync()
loop
