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

function Spawner_SpawnEnemy(grid ref as Grid, enemyType as integer)
	index = Random(0, grid.newTiles.length)
	
	// Generate Random Boundary Position
	position as Vector2D
	position = Grid_GetTileCenterByIndex(grid, grid.newTiles[index].gridPosition.x, grid.newTiles[index].gridPosition.y)
	
	// Create the enemy
	enemy as Enemy
	enemy = Enemy_Create(position, 0, 1)
endfunction
