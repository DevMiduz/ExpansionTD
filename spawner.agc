/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	spawner.agc
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

/*

	FUNCTIONS

*/

/*
	TODO CHECK NO ENEMIES ON GREY SQUARES WHEN EXPANDING.
	WONT NEED TO IF WE ONLY END A TURN WHEN ALL HAVE DIED
*/

function Spawner_SpawnEnemy(grid ref as Grid, tileDataArray ref as tileData[], enemyType as integer)
	index = Random(0, grid.newTiles.length)
	
	// Generate Random Boundary Position
	position as Vector2D
	position.x = grid.newTiles[index].gridPosition.x
	position.y = grid.newTiles[index].gridPosition.y
	
	// Create the enemy
	enemy as Enemy
	enemy = Enemy_Create(position, 0, 1)
	
	worldPosition as Vector2D
	worldPosition = Grid_GetTileCenterByIndex(grid, enemy.position.x, enemy.position.y)
	SetSpritePositionByOffset(enemy.sprite, worldPosition.x, worldPosition.y)
	
	//Find Next Position
	Enemy_FindNextPathPoint(grid, tileDataArray, enemy)
	Enemy_UpdateEnemyDirection(enemy)
	enemy.previousMovementTimestamp = Timer()
	
endfunction enemy
