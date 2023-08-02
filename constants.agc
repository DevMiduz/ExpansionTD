/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	constants.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	INCLUDES
	
*/

#insert "key_constants.agc"

/*

	CONSTANTS
	
*/

// Engine Constants
#constant CONST_GAME_TITLE = "Expansion TD"
#constant CONST_ERROR_MODE = 2
#constant CONST_RESIZE_ALLOWED = 1
#constant CONST_WINDOW_WIDTH = 1920
#constant CONST_WINDOW_HEIGHT= 1080
#constant CONST_VIRTUAL_WIDTH = 320
#constant CONST_VIRTUAL_HEIGHT = 180
#constant CONST_SYNC_RATE = 60

// DEPTH CONSTANTS
#constant CONST_DEPTH_ALL_FRONT = 0
#constant CONST_DEPTH_GUI_FRONT = 1000
#constant CONST_DEPTH_GUI_MIDDLE = 1500
#constant CONST_DEPTH_GUI_BACK = 2000

#constant CONST_DEPTH_GAME_FRONT = 2500
#constant CONST_DEPTH_GAME_MIDDLE_FRONT = 3000
#constant CONST_DEPTH_GAME_MIDDLE = 3500
#constant CONST_DEPTH_GAME_MIDDLE_BACK = 4000
#constant CONST_DEPTH_GAME_BACK = 4500

// Input Handler Constants
#constant CONST_INPUT_IDLE = 0
#constant CONST_INPUT_PRESSED = 1
#constant CONST_INPUT_HELD = 2
#constant CONST_INPUT_RELEASED = 3

// Scene Constants
#constant CONST_SCENE_SPRITE_TYPE = 0
#constant CONST_SCENE_TEXT_TYPE = 1
#constant CONST_SCENE_BUTTON_TYPE = 2
#constant CONST_SCENE_EDIT_BOX_TYPE = 3
#constant CONST_SCENE_PARTICLE_TYPE = 4

// Map Terrain Types
#constant CONST_MAP_TERRAIN_TYPE_OPEN = 0
#constant CONST_MAP_TERRAIN_TYPE_BUILDABLE = 1	// But not pathable
#constant CONST_MAP_TERRAIN_TYPE_IMPASSIBLE = 2
#constant CONST_MAP_TERRAIN_TYPE_OCCUPIED = 3		// No sprite -> used for tiles which are occupied
#constant CONST_MAP_TERRAIN_TYPE_PROTECTED = 4
#constant CONST_MAP_TERRAIN_TYPE_UNBUILDABLE = 5

// Map Terrain Types Chances
#constant CONST_MAP_TERRAIN_TYPE_BUILDABLE_CHANCE = 2	// Higher is worse.
#constant CONST_MAP_TERRAIN_TYPE_IMPASSIBLE_CHANCE = 2	// Higher is worse.

// Event ID Constants
#constant CONST_GAME_STARTED_EVENT_ID = 0
#constant CONST_GAME_PAUSED_EVENT_ID = 1
#constant CONST_GAME_RESUMED_EVENT_ID = 2
#constant CONST_GAME_STOPPED_EVENT_ID = 3
#constant CONST_GAME_RESTARTED_EVENT_ID = 4
#constant CONST_GAME_OVER_EVENT_ID = 5

#constant CONST_TURN_STARTED_EVENT_ID = 6
#constant CONST_TURN_FINISHED_EVENT_ID = 7

#constant CONST_CYCLE_STARTED_EVENT_ID = 8
#constant CONST_CYCLE_FINISHED_EVENT_ID = 9

#constant CONST_LIFE_LOST_EVENT_ID = 10
#constant CONST_ENEMY_KILLED_EVENT_ID = 11

#constant CONST_NEXT_SCENE_EVENT_ID = 12
#constant CONST_POP_SCENE_EVENT_ID = 13