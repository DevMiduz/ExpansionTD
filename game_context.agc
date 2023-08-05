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
	enemies as Enemy[]
endtype

/*

	FUNCTIONS
	
*/

function GameContext_Init(gameContext ref as GameContext)
	gameContext.init = 1
	
	// Setup Camera
	gameContext.camera = Camera_Create(8, GetVirtualHeight() / 2, 1)
	
	// Setup Grid
	gameContext.grid = Grid_Create(16, Vector2D_CreateVector(0,0))
	
	gameContext.grid.newTiles.insert(gameContext.grid.rows[0].tiles[0])	
	
	// Expand Grid
	gameContext.gridExpander.eastOffset = 3
	gameContext.gridExpander.westOffset = 3
	gameContext.gridExpander.northOffset = 0
	gameContext.gridExpander.southOffset = 3
	GridExpander_ExpandGrid(gameContext.grid, gameContext.gridExpander)
	
	// Calculate Path Finding Distances
	
	tile as Tile 
	tileData as TileData
	
	GridPathfinding_InitGrid(gameContext.grid, gameContext.gridExpander, gameContext.tileDataArray)
	gameContext.grid.previousTiles = gameContext.grid.newTiles
	gameContext.grid.newTiles.length = -1
	
	repeat
		// Init Grid
		GridPathfinding_InitGrid(gameContext.grid, gameContext.gridExpander, gameContext.tileDataArray)
		Grid_GetTileFromGridPosition(gameContext.grid, tile, Vector2D_CreateVector(0,0))
		
		// Calculate Path Finding Distances
		GridPathfinding_ResetTileDataDistances(gameContext.tileDataArray)
		GridPathfinding_UpdatePathDistances(gameContext.grid, gameContext.tileDataArray, tile)
	
		Grid_GetTileFromGridPosition(gameContext.grid, tile, Grid_GetBottomRightPosition(gameContext.grid))
		GridPathfinding_GetTileData(gameContext.tileDataArray, tileData, tile.id)
		// Until valid pathable grid is build.
	until tileData.distance <> -1
	
	GameContext_NextCycle(gameContext)

endfunction

function GameContext_Update(gameContext ref as GameContext)
	// Update Camera
	Camera_Update(GameContext.camera)
	
	
	tile as Tile
	tileData as TileData
	
	if(InputHandler_Data.confirm = CONST_INPUT_PRESSED)
		GameContext_NextCycle(gameContext)
	endif
	
		    
	 if(GetPointerPressed())
	 		/*
			GridPathfinding_ResetTileDataDistances(gameContext.tileDataArray)
			
			if(Grid_GetTileFromWorldPosition(gameContext.grid, tile, Vector2D_CreateVector(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))) <> -1)
				GridPathfinding_UpdatePathDistances(gameContext.grid, gameContext.tileDataArray, tile)
				GridPathfinding_DebugTileData(gameContext.tileDataArray)
			endif
			*/
			
			gameContext.enemies.insert(Spawner_SpawnEnemy(gameContext.grid, gameContext.tileDataArray, 0))
			gameContext.enemies.sort()
    	endif
    		
    		
    	//GridPathfinding_DrawGrid(gameContext.grid, gameContext.tileDataArray)
    	GameContext_UpdateEnemies(gameContext)
endfunction

function GameContext_UpdateEnemies(gameContext ref as GameContext)
	for i = 0 to gameContext.enemies.length
		Enemy_UpdateEnemy(gameContext.grid, gameContext.tileDataArray, gameContext.enemies[i])
	next i
endfunction

function GameContext_NextCycle(gameContext ref as GameContext)
	tile as Tile
	tileData as TileData
	
	gameContext.grid.previousTiles = gameContext.grid.newTiles
	gameContext.grid.newTiles.length = -1
	
	inc gameContext.gridExpander.eastOffset
	inc gameContext.gridExpander.westOffset
	inc gameContext.gridExpander.southOffset
			
	GridExpander_ExpandGrid(gameContext.grid, gameContext.gridExpander)
			
	repeat
		GridPathfinding_InitGrid(gameContext.grid, gameContext.gridExpander, gameContext.tileDataArray)
		Grid_GetTileFromGridPosition(gameContext.grid, tile, Vector2D_CreateVector(0,0))
		GridPathfinding_ResetTileDataDistances(gameContext.tileDataArray)
		GridPathfinding_UpdatePathDistances(gameContext.grid, gameContext.tileDataArray, tile)
	
		Grid_GetTileFromGridPosition(gameContext.grid, tile, Grid_GetBottomRightPosition(gameContext.grid))
		GridPathfinding_GetTileData(gameContext.tileDataArray, tileData, tile.id)
	until tileData.distance <> -1
endfunction

function GameContext_Draw(gameContext ref as GameContext)
	
endfunction


function GameContext_Cleanup(gameContext ref as GameContext)
	SetViewOffset(0,0)
	
	// Reset Game Context
	newGameContext as GameContext
	gameContext = newGameContext
endfunction
