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
	tileDataArray as TileData[]
endtype

/*

	FUNCTIONS
	
*/

function GameContext_Init(gameContext ref as GameContext)
	gameContext.init = 1
	
	// Setup Camera
	gameContext.camera = Camera_Create(0, GetVirtualHeight() / 2, 1)
	
	// Setup Grid
	gameContext.grid = Grid_Create(16, Vector2D_CreateVector(0,0))
	
	// Expand Grid
	gameContext.gridExpander.eastOffset = 6
	gameContext.gridExpander.westOffset = 6
	gameContext.gridExpander.northOffset = 0
	gameContext.gridExpander.southOffset = 6
	GridExpander_ExpandGrid(gameContext.grid, gameContext.gridExpander)
	
	// Calculate Path Finding Distances
	GridPathfinding_InitGrid(gameContext.grid, gameContext.gridExpander, gameContext.tileDataArray)
	
	tile as Tile 
	Grid_GetTileFromWorldPosition(gameContext.grid, tile, Vector2D_CreateVector(0, 0))
	
	GridPathfinding_UpdatePathDistances(gameContext.grid, gameContext.tileDataArray, tile)
	GridPathfinding_DrawGrid(gameContext.grid, gameContext.tileDataArray)
	
endfunction

function GameContext_Update(gameContext ref as GameContext)
	
endfunction

function GameContext_Draw(gameContext ref as GameContext)
	GridPathfinding_DebugTileData(gameContext.tileDataArray)
endfunction


function GameContext_Cleanup(gameContext ref as GameContext)
	SetViewOffset(0,0)
	
	// Reset Game Context
	newGameContext as GameContext
	gameContext = newGameContext
endfunction
