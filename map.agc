/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	map.agc
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

function Map_GetRandomTileType()
	// Buildable Tile Chance.
	if(Random(0, CONST_MAP_TERRAIN_TYPE_BUILDABLE_CHANCE) = 0)
		exitfunction CONST_MAP_TERRAIN_TYPE_BUILDABLE
	endif
	
	// Impassible Tile Chance.
	if(Random(0, CONST_MAP_TERRAIN_TYPE_IMPASSIBLE_CHANCE) = 0)
		exitfunction CONST_MAP_TERRAIN_TYPE_IMPASSIBLE
	endif
	
	// Otherwise Open Tile.
endfunction CONST_MAP_TERRAIN_TYPE_OPEN

function Map_CreateTileTerrainSprite(terrainType as integer)
	terrainSprite as integer
	terrainSprite = CreateSprite(ASSET_IMAGE_TERRAIN_TILESET)
	SetSpriteAnimation(terrainSprite, 16, 16, 3)
	
	select(terrainType)
		case CONST_MAP_TERRAIN_TYPE_OPEN:
			PlaySprite(terrainSprite, 0, 0, 0, 0)
		endcase
		
		case CONST_MAP_TERRAIN_TYPE_BUILDABLE:
			PlaySprite(terrainSprite, 0, 0, 2, 0)
		endcase
		
		case CONST_MAP_TERRAIN_TYPE_IMPASSIBLE:
			PlaySprite(terrainSprite, 0, 0, 1, 0)
		endcase
	endselect
	
endfunction terrainSprite