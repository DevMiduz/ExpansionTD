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