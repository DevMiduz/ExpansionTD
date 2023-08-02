/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	grid_pathfinding.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	INCLUDES

*/

#include "grid.agc"
#include "camera.agc"

/*

	CONSTANTS

*/

/*
#constant TILE_OPEN = 0
#constant TILE_CLOSED = 1
#constant TILE_IMPASSIBLE = 2
*/


/*

	TYPES
	
*/

/*

	FUNCTIONS
	
*/

/*

	-- PATHFINDING FUNCTIONS

*/

function GridPathfinding_UpdatePathDistances(grid ref as Grid, tileDataArray ref as TileData[], startTile ref as Tile)
	// maxTicks can be used to limit the distance that is checked.
	// but may impact lower powered devices AI functioning correctly.
	maxTicks as integer = 200
	ticks as integer
	
	visited as integer[]
	toVisit as Tile[]
	currentTile as Tile
	currentTileData as TileData
	
	GridPathfinding_GetTileData(tileDataArray, currentTileData, startTile.id)
	
	if(GridPathfinding_IsTilePathable(currentTileData) <> 1) 
		exitfunction
	endif
	
	currentTileData.distance = 0
	GridPathfinding_InsertOrUpdateTileData(tileDataArray, currentTileData)
	
	toVisit.insert(startTile)
	
	distance as integer
	
	while(toVisit.length > -1 and ticks <= maxTicks)
		currentTile = toVisit[0]
		GridPathfinding_GetTileData(tileDataArray, currentTileData, currentTile.id)
		toVisit.remove(0)
		
		if(GridPathfinding_HasTileBeenVisited(currentTile.id, grid, visited) = -1)
			visited.insert(currentTile.id)
			visited.sort()
			GridPathfinding_FindTileNeighbours(grid, tileDataArray, currentTile, currentTileData, toVisit, visited)
			inc ticks
		endif
	endwhile
	
endfunction

function GridPathfinding_FindTileNeighbours(grid ref as Grid, tileDataArray ref as TileData[], tile ref as Tile, tileData ref as TileData, toVisit ref as Tile[], visited ref as integer[])
	neighbourTile as Tile
	neighbourTileData as TileData
	
	if(Grid_IsGridPositionWithinGrid(grid, tile.gridPosition) = -1) then exitfunction
	
	// LEFT
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(tile.gridPosition.x - 1, tile.gridPosition.y)) <> -1)
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(tile.gridPosition.x - 1, tile.gridPosition.y))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
	
		if(GridPathfinding_HasTileBeenVisited(neighbourTile.id, grid, visited) = -1 and GridPathfinding_IsTilePathable(neighbourTileData) = 1)
			neighbourTileData.distance = tileData.distance + 1
			GridPathfinding_InsertOrUpdateTileData(tileDataArray, neighbourTileData)
			toVisit.insert(neighbourTile)
		endif
	endif
	
	// UP
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(tile.gridPosition.x, tile.gridPosition.y - 1)) <> -1)
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(tile.gridPosition.x, tile.gridPosition.y - 1))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
	
		if(GridPathfinding_HasTileBeenVisited(neighbourTile.id, grid, visited) = -1 and GridPathfinding_IsTilePathable(neighbourTileData) = 1)
			neighbourTileData.distance = tileData.distance + 1
			GridPathfinding_InsertOrUpdateTileData(tileDataArray, neighbourTileData)
			toVisit.insert(neighbourTile)
		endif
	endif
	
	// RIGHT
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(tile.gridPosition.x + 1, tile.gridPosition.y)) <> -1)
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(tile.gridPosition.x + 1, tile.gridPosition.y))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
	
		if(GridPathfinding_HasTileBeenVisited(neighbourTile.id, grid, visited) = -1 and GridPathfinding_IsTilePathable(neighbourTileData) = 1)
			neighbourTileData.distance = tileData.distance + 1
			GridPathfinding_InsertOrUpdateTileData(tileDataArray, neighbourTileData)
			toVisit.insert(neighbourTile)
		endif
	endif

	// DOWN
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(tile.gridPosition.x, tile.gridPosition.y + 1)) <> -1)
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(tile.gridPosition.x, tile.gridPosition.y + 1))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
	
		if(GridPathfinding_HasTileBeenVisited(neighbourTile.id, grid, visited) = -1 and GridPathfinding_IsTilePathable(neighbourTileData) = 1)
			neighbourTileData.distance = tileData.distance + 1 
			GridPathfinding_InsertOrUpdateTileData(tileDataArray, neighbourTileData)
			toVisit.insert(neighbourTile)
		endif
	endif

endfunction

/*

	-- TILEDATA FUNCTIONS

*/

function GridPathfinding_InitTileData(grid ref as Grid, tileDataArray ref as TileData[])
	tileData as TileData
	position as Vector2D
	tlPosition as Vector2D
	brPosition as Vector2D
	tile as Tile
	row as Row
	scene as Scene
	
	tlPosition = Grid_GetTopLeftPosition(grid)
	brPosition = Grid_GetBottomRightPosition(grid)
	
	SceneManager_GetCurrentScene(sceneManager, scene)
	
	for i = 0 to grid.previousTiles.length
		
		tile = grid.previousTiles[i]
		
		if(GridPathfinding_GetTileData(tileDataArray, tileData, tile.id) <> -1)
			if(tile.gridPosition.x = 0 and tile.gridPosition.y = 0)
				tileData.status = CONST_MAP_TERRAIN_TYPE_PROTECTED
			else
				tileData.status = Map_GetRandomTileType()
			endif
			
			Map_SetTileTerrainSpriteFrame(tileData.sprite, tileData.status)
					
			position = Grid_GetTileWorldPosition(grid, tile.gridPosition.x, tile.gridPosition.y)
					
			SetSpriteDepth(tileData.sprite, CONST_DEPTH_GAME_MIDDLE)
			SetSpritePosition(tileData.sprite, position.x, position.y)
			GridPathfinding_InsertOrUpdateTileData(tileDataArray, tileData)
		endif
	next i
	
	for i = 0 to grid.newTiles.length
		tile = grid.newTiles[i]
			
		if(tile.gridPosition.x = 0 and tile.gridPosition.y = 0)
			tileData = TileData_Create(tile.id, CONST_MAP_TERRAIN_TYPE_PROTECTED, -1)
		elseif(tile.gridPosition.x = tlPosition.x or tile.gridPosition.x = brPosition.x or tile.gridPosition.y = brPosition.y)
			tileData = TileData_Create(tile.id, CONST_MAP_TERRAIN_TYPE_UNBUILDABLE, -1)
		else
			tileData = TileData_Create(tile.id, Map_GetRandomTileType(), -1)
		endif
				
				
		tileData.sprite = Map_CreateTileTerrainSprite(tileData.status)
		Scene_InsertSprite(scene, tileData.sprite)
				
		position = Grid_GetTileWorldPosition(grid, tile.gridPosition.x, tile.gridPosition.y)
				
		SetSpriteDepth(tileData.sprite, CONST_DEPTH_GAME_MIDDLE)
		SetSpritePosition(tileData.sprite, position.x, position.y)
		GridPathfinding_InsertOrUpdateTileData(tileDataArray, tileData)
		
	next i
	
	SceneManager_UpdateCurrentScene(sceneManager, scene)
	
endfunction

function GridPathfinding_GetTileData(tileDataArray ref as TileData[], tileData ref as TileData, id as integer)
	tileDataArray.sort()
	index = tileDataArray.find(id)
	
	if(index <> -1)
		tileData = tileDataArray[index]
	endif
	
endfunction index

function GridPathfinding_InsertOrUpdateTileData(tileDataArray ref as TileData[], tileData as TileData)
	
	oldTileData as TileData
	index = GridPathfinding_GetTileData(tileDataArray, oldTileData, TileData.tileId)
	
	if(index <> -1)
		tileDataArray[index] = tileData
	else
		tileDataArray.insert(tileData)
		tileDataArray.sort()
	endif
	
endfunction

function GridPathfinding_FindTileDataFromWorldPosition(grid ref as Grid, tileDataArray ref as TileData[], tileData ref as TileData, worldPos as Vector2D)
	tile as Tile
	
	tileData.tileId = -1
	
	if(Grid_GetTileFromWorldPosition(grid, tile, worldPos) = -1) then exitfunction -1
	if(GridPathfinding_GetTileData(tileDataArray, tileData, tile.id) = -1) then exitfunction -1
endfunction 1

function GridPathfinding_FindTileDataFromGridPosition(grid ref as Grid, tileDataArray ref as TileData[], gridPos as Vector2D)
	tileData as TileData
	tile as Tile
	
	tileData.tileId = -1
	
	if(Grid_GetTileFromGridPosition(grid, tile, gridPos) = -1) then exitfunction -1
	if(GridPathfinding_GetTileData(tileDataArray, tileData, tile.id) = -1) then exitfunction -1
endfunction 1

function GridPathfinding_ResetTileDataDistances(tileDataArray ref as TileData[])
	for i = 0 to tileDataArray.length
		tileDataArray[i].distance = -1
	next i
endfunction

function GridPathfinding_IsTilePathable(tileData ref as TileData)
	result = -1
	
	select tileData.status
		case CONST_MAP_TERRAIN_TYPE_OPEN:
			result = 1
		endcase
		
		case CONST_MAP_TERRAIN_TYPE_UNBUILDABLE:
			result = 1
		endcase
		
		case CONST_MAP_TERRAIN_TYPE_PROTECTED:
			result = 1
		endcase
	endselect

endfunction result

function GridPathfinding_IsTileOpen(tileData ref as TileData)
	if(tileData.status = CONST_MAP_TERRAIN_TYPE_OPEN) 
		exitfunction 1
	endif
endfunction -1

function GridPathfinding_IsTileOccupied(tileData ref as TileData)
	if(tileData.status = CONST_MAP_TERRAIN_TYPE_OCCUPIED) 
		exitfunction 1
	endif
endfunction -1

function GridPathfinding_IsTileUnbuildable(tileData ref as TileData)
	if(tileData.status = CONST_MAP_TERRAIN_TYPE_UNBUILDABLE) 
		exitfunction 1
	endif
endfunction -1

function GridPathfinding_IsTileBuildable(tileData ref as TileData)
	if(tileData.status = CONST_MAP_TERRAIN_TYPE_BUILDABLE) 
		exitfunction 1
	endif
endfunction -1

function GridPathfinding_IsTileImpassible(tileData ref as TileData)
	if(tileData.status = CONST_MAP_TERRAIN_TYPE_IMPASSIBLE) 
		exitfunction 1
	endif
endfunction -1

function GridPathfinding_IsTileProtected(tileData ref as TileData)
	if(tileData.status = CONST_MAP_TERRAIN_TYPE_PROTECTED) 
		exitfunction 1
	endif
endfunction -1

function GridPathfinding_HasTileBeenVisited(tileId as integer, grid ref as Grid, visited ref as integer[])	
	if(visited.find(tileId) <> -1) then exitfunction 1
endfunction -1

function GridPathfinding_DebugTileData(tileDataArray ref as TileData[])
	tileData as TileData
	output as String
	
	for i = 0 to tileDataArray.length
		tileData = tileDataArray[i]
		output = "tileData: " + tileData.toJson()
		Log(output)
	next i
endfunction

/*

	TEST_FUNCTIONS
	
*/

function GridPathfinding_RandomiseTileData(tileDataArray ref as TileData[])
	for i = 0 to tileDataArray.length
		tileDataArray[i].status = Random(0, 2)
	next i
endfunction

function GridPathfinding_DrawGrid(grid ref as Grid, tileDataArray ref as TileData[])
	tile as Tile
	tileData as TileData
	position as Vector2D
	
	for rowIndex = 0 to grid.rows.length
		for colIndex = 0 to grid.rows[rowIndex].tiles.length
			tile = Grid_GetTileFromGridIndex(grid, Vector2D_CreateVector(colIndex, rowIndex))
			GridPathfinding_GetTileData(tileDataArray, tileData, tile.id)
			
			position = Grid_GetTileWorldPosition(grid, tile.gridPosition.x, tile.gridPosition.y)
			
			if(GetTextExists(tileData.distanceText) = 0)
				tileData.distanceText = CreateText(str(tileData.distance))
			endif
			
			
			SetTextSize(tileData.distanceText, 12)
			SetTextString(tileData.distanceText, str(tileData.distance))
			SetTextPosition(tileData.distanceText, position.x, position.y)
			SetTextDepth(tileData.distanceText, CONST_DEPTH_GUI_MIDDLE)
			GridPathfinding_InsertOrUpdateTileData(tileDataArray, tileData)
			
			
		next colIndex
	next rowIndex
endfunction

function GridPathfinding_InitGrid(grid ref as Grid, GridExpander ref as GridExpander, tileDataArray ref as TileData[])
	GridExpander_ExpandGrid(grid, gridExpander)
	GridPathfinding_InitTileData(grid, tileDataArray)
	GridPathfinding_DebugTileData(tileDataArray)
	
endfunction

global blocksImage as integer
blocksImage = LoadImage("pathfinding_blocks.png")
global camera as Camera
camera = Camera_Create(0, 0, 1)

function GridPathfinding_TestUtility()	
	grid = Grid_Create(8, Vector2D_CreateVector(-8, -8))
	
	gridExpander.eastOffset = 8
	gridExpander.westOffset = 0
	gridExpander.northOffset = 0
	gridExpander.southOffset = 8
	
	grid as Grid
	gridExpander as GridExpander
	tileDataArray as TileData[]
	
	GridPathfinding_InitGrid(grid, GridExpander, tileDataArray)
	
	do
	    Print( ScreenFPS() )
	    
	    GridPathfinding_DrawGrid(grid, tileDataArray)
	    
	    	if(GetRawKeyState(37) = 1)
	    		Camera_Move(camera, -1, 0)
	    endif
	    
	    if(GetRawKeyState(38) = 1)
	    		Camera_Move(camera, 0, -1)
	    endif
	    
	    if(GetRawKeyState(39) = 1)
	    		Camera_Move(camera, 1, 0)
	    endif
	    
	    if(GetRawKeyState(40) = 1)
	    		Camera_Move(camera, 0, 1)
	    endif
	    
	    if(GetRawKeyPressed(32))
	    		inc gridExpander.eastOffset
	    		inc gridExpander.westOffset
	    		inc gridExpander.northOffset
	    		inc gridExpander.southOffset
	    		GridExpander_ExpandGrid(grid, gridExpander)
	    		
	    		
	    		GridPathfinding_InitTileData(grid, tileDataArray)
	    		
	    endif
     
	    if(GetRawKeyPressed(13))
	    		GridPathfinding_RandomiseTileData(tileDataArray)
	   	endif
	    
	    
	    if(GetPointerPressed())
			GridPathfinding_ResetTileDataDistances(tileDataArray)
			
			tile as Tile
			if(Grid_GetTileFromWorldPosition(grid, tile, Vector2D_CreateVector(ScreenToWorldX(GetPointerX()), ScreenToWorldY(GetPointerY()))) <> -1)
				GridPathfinding_UpdatePathDistances(grid, tileDataArray, tile)
				GridPathfinding_DebugTileData(tileDataArray)
			endif
    		endif
    		
	    
	    Sync()
	loop
	
endfunction