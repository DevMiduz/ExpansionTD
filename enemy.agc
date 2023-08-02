/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	enemy.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	INCLUDES

*/

/*

	CONSTANTS

*/

/*

	TYPES

*/

type Enemy
	id as integer
	position as Vector2D
	nextPathPoint as Vector2D
	health as float
	speed as float
	armour as float
	shield as float
	multiplier as float 		// multiplier to adjust enemies toughness by wave by setting a level.
	currency as integer 		// money gained for killing.
	score as float 		// score gained for killing.
	typeId as integer
	sprite as integer
	level as integer
	previousMovementTimestamp as float
endtype

/*

	FUNCTIONS

*/

/*
	Find next path point
	Then Moved there.
	Movement frequence will be based upon speed.
*/

function Enemy_UpdateEnemy(grid ref as Grid, gridDataArray ref as GridData[], enemy ref as Enemy)
	
endfunction

function Enemy_MoveEnemy(grid ref as Grid, enemy ref as Enemy)
	
endfunction

function Enemy_FindNextPathPoint(grid ref as Grid, tileDataArray ref as TileData[], enemy ref as Enemy)
	/*
	
		Store the path positions as grid positions rather than world positions
		That way it would be easier to test for the next position
		May also be easier to set the next sprite direction.
	*/
	distance as integer
	distance = -1
	
	neighbourTile as Tile
	neighbourTileData as TileData
	
	// LEFT
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(enemy.position.x - 1, enemy.position.y)) <> -1)
	
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(enemy.position.x - 1, enemy.position.y))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
		
		if(neighbourTileData.distance <> -1) 
			distance = neighbourTileData.distance
			enemy.nextPathPoint.x = neighbourTile.gridPosition.x
			enemy.nextPathPoint.y = neighbourTile.gridPosition.y
		endif
			
	endif
	
	// UP
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(enemy.position.x, enemy.position.y - 1)) <> -1)
	
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(enemy.position.x, enemy.position.y - 1))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
		
		if((neighbourTileData.distance <> -1 and distance > neighbourTileData.distance) or distance = -1)
			distance = neighbourTileData.distance
			enemy.nextPathPoint.x = neighbourTile.gridPosition.x
			enemy.nextPathPoint.y = neighbourTile.gridPosition.y
		endif
			
	endif
	
	
	// RIGHT
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(enemy.position.x + 1, enemy.position.y)) <> -1)
	
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(enemy.position.x + 1, enemy.position.y))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
		
		if((neighbourTileData.distance <> -1 and distance > neighbourTileData.distance) or distance = -1)
			distance = neighbourTileData.distance
			enemy.nextPathPoint.x = neighbourTile.gridPosition.x
			enemy.nextPathPoint.y = neighbourTile.gridPosition.y
		endif
			
	endif

	// DOWN
	if(Grid_IsGridPositionWithinGrid(grid, Vector2D_CreateVector(enemy.position.x , enemy.position.y + 1)) <> -1)
	
		Grid_GetTileFromGridPosition(grid, neighbourTile, Vector2D_CreateVector(enemy.position.x, enemy.position.y + 1))
		GridPathfinding_GetTileData(tileDataArray, neighbourTileData, neighbourTile.id)
		
		if((neighbourTileData.distance <> -1 and distance > neighbourTileData.distance) or distance = -1)
			distance = neighbourTileData.distance
			enemy.nextPathPoint.x = neighbourTile.gridPosition.x
			enemy.nextPathPoint.y = neighbourTile.gridPosition.y
		endif
			
	endif
	
endfunction

function Enemy_UpdateEnemyDirection(enemy ref as Enemy)
	// Base the direction upon nextPathPoint
	newPosition as Vector2D
	newPosition.x = enemy.nextPathPoint.x - enemy.position.x
	newPosition.y = enemy.nextPathPoint.y - enemy.position.y
	
	if(enemy.position.x < enemy.nextPathPoint.x)
		//FACE RIGHT
		SetSpriteAngle(enemy.sprite, 0)
	elseif(enemy.position.x > enemy.nextPathPoint.x)
		//FACE LEFT
		SetSpriteAngle(enemy.sprite, 180)
	endif
	
	if(enemy.position.y < enemy.nextPathPoint.y)
		//FACE DOWN
		SetSpriteAngle(enemy.sprite, 90)
	
	elseif(enemy.position.y > enemy.nextPathPoint.y)
		//FACE UP
		SetSpriteAngle(enemy.sprite, 270)
	endif
endfunction

function Enemy_Create(position as Vector2D, typeId as integer, level as integer)
	enemy as Enemy
	Enemy_CreateRef(enemy, position, typeId, level)
endfunction enemy

function Enemy_CreateRef(enemy ref as Enemy, position as Vector2D, typeId as integer, level as integer)
	enemy.id = IDGenerator_GenerateNewID(GLOBAL_ID_GENERATOR)
	enemy.position = position
	enemy.level = level
	
	select typeId
		case 0:
			Enemy_CreateBasicCircle(enemy)
		endcase
	endselect
	
endfunction

function Enemy_CreateBasicCircle(enemy ref as Enemy)
	enemy.sprite = CreateSprite(ASSET_IMAGE_BASIC_CIRCLE_ENEMY_SPRITESHEET)
	enemy.typeId = 0
	
	SetSpriteAnimation(enemy.sprite, 16, 16, 7)
	PlaySprite(enemy.sprite, 0, 0, enemy.level, enemy.level)
	enemy.speed = 1
	enemy.previousMovementTimestamp = Timer()
	//Look at the next position it will move to.
	
endfunction