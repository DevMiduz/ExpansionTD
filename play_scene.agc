/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	play_scene.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	INCLUDES

*/

/*

	GLOBALS

*/

global PlayScene_ID

global PlayScene_Sprite_PauseButtonUp
global PlayScene_Sprite_PauseButtonDown

/*

	FUNCTIONS
	
*/
function PlayScene_CreateSceneObject()
	scene as scene
	
	if(PlayScene_ID <= 0) then PlayScene_ID = IDGenerator_GenerateNewID(GLOBAL_ID_GENERATOR)
	
	scene.id = PlayScene_ID
	
	// Create Pause Button Up Sprite
	PlayScene_Sprite_PauseButtonUp = CreateSprite(ASSET_IMAGE_GUI_PAUSE_UP_BUTTON)
	SetSpritePositionByOffset(PlayScene_Sprite_PauseButtonUp, GetVirtualWidth() - 8, 8)
	SetSpriteSize(PlayScene_Sprite_PauseButtonUp, 14, 14)
	Scene_InsertSprite(scene, PlayScene_Sprite_PauseButtonUp)
	
	// Create Pause Button Down Sprite
	PlayScene_Sprite_PauseButtonDown = CreateSprite(ASSET_IMAGE_GUI_PAUSE_DOWN_BUTTON)
	SetSpritePositionByOffset(PlayScene_Sprite_PauseButtonDown, GetVirtualWidth() - 8, 8)
	SetSpriteSize(PlayScene_Sprite_PauseButtonDown, 14, 14)
	SetSpriteVisible(PlayScene_Sprite_PauseButtonDown, 0)
	Scene_InsertSprite(scene, PlayScene_Sprite_PauseButtonDown)
	
endfunction scene

function PlayScene_Sync()
	
	// BUTTON HANDLING
	select(Button_EventTest(PlayScene_Sprite_PauseButtonUp, PlayScene_Sprite_PauseButtonDown))
		case 1:
			SceneManager_Push(sceneManager, PauseScene_CreateSceneObject())
		endcase
	endselect
	 
endfunction