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
	score as integer 		// score gained for killing.
	typeId as integer
	sprite as integer
	level as integer
endtype

/*

	FUNCTIONS

*/

function Enemy_FindNextPathPoint(enemy ref as Enemy)
	
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
	
	SetSpritePositionByOffset(enemy.sprite, enemy.position.x, enemy.position.y)
endfunction

//Could have levels
//Then select the sprite and power based upon the level of enemy
function Enemy_CreateBasicCircle(enemy ref as Enemy)
	enemy.sprite = CreateSprite(ASSET_IMAGE_BASIC_CIRCLE_ENEMY_SPRITESHEET)
	enemy.typeId = 0
	
	SetSpriteAnimation(enemy.sprite, 16, 16, 7)
	PlaySprite(enemy.sprite, 0, 0, enemy.level, enemy.level)
	
endfunction