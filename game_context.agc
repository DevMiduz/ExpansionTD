/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	game_context.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	GLOBALS

*/
global gameContext as GameContext

/*

	TYPES
	
*/
type GameContext
	init as integer
	camera as Camera
	player as Player
	grid as Grid
	gridExpander as GridExpander
endtype

/*

	FUNCTIONS
	
*/

function GameContext_Init(gameContext ref as GameContext)
	gameContext.init = 1
	gameContext.camera = Camera_Create(0, GetVirtualHeight() / 2, 1)
endfunction

function GameContext_Cleanup(gameContext ref as GameContext)
	SetViewOffset(0,0)
	
	// Reset Game Context
	newGameContext as GameContext
	gameContext = newGameContext
endfunction
