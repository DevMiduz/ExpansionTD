/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	pause_scene.agc
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

global PauseScene_ID

global PauseScene_Sprite_ResumeButtonUp
global PauseScene_Sprite_ResumeButtonDown

global PauseScene_Sprite_RestartButtonUp
global PauseScene_Sprite_RestartButtonDown

global PauseScene_Sprite_ExitButtonUp
global PauseScene_Sprite_ExitButtonDown

global PauseScene_Sprite_SoundEnabledButton
global PauseScene_Sprite_SoundDisabledButton

global PauseScene_Sprite_MusicEnabledButton
global PauseScene_Sprite_MusicDisabledButton

/*

	FUNCTIONS
	
*/
function PauseScene_CreateSceneObject()
	scene as scene
	
	if(PauseScene_ID <= 0) then PauseScene_ID = IDGenerator_GenerateNewID(GLOBAL_ID_GENERATOR)
	
	scene.id = PauseScene_ID

	// Create Main Menu Title
	PauseScene_Text_Title = CreateText("Paused")
	SetTextFont(PauseScene_Text_Title, ASSET_FONT_BOLD_FONT)
	SetTextAlignment(PauseScene_Text_Title, 1)
	SetTextPosition(PauseScene_Text_Title, GetVirtualWidth() / 2, 2)
	SetTextSize(PauseScene_Text_Title, 10)
	Scene_InsertText(scene, PauseScene_Text_Title)
	
	// Create Resume Button Up Sprite
	PauseScene_Sprite_ResumeButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(PauseScene_Sprite_ResumeButtonUp, GetVirtualWidth() / 2, 24)
	SetSpriteSize(PauseScene_Sprite_ResumeButtonUp, 48, 12)
	Scene_InsertSprite(scene, PauseScene_Sprite_ResumeButtonUp)
	
	// Create Resume Button Down Sprite
	PauseScene_Sprite_ResumeButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(PauseScene_Sprite_ResumeButtonDown, GetVirtualWidth() / 2, 24)
	SetSpriteSize(PauseScene_Sprite_ResumeButtonDown, 48, 12)
	SetSpriteVisible(PauseScene_Sprite_ResumeButtonDown, 0)
	Scene_InsertSprite(scene, PauseScene_Sprite_ResumeButtonDown)
	
	// Create Play Button Text
	PauseScene_Text_Resume= CreateText("Resume")
	SetTextFont(PauseScene_Text_Resume, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(PauseScene_Text_Resume, 1)
	SetTextPosition(PauseScene_Text_Resume, GetVirtualWidth() / 2, 20)
	SetTextDepth(PauseScene_Text_Resume, 0)
	SetTextColor(PauseScene_Text_Resume, 255, 255, 255, 255)
	SetTextSize(PauseScene_Text_Resume, 8)
	Scene_InsertText(scene, PauseScene_Text_Resume)
	
	// Create Restart Button Up Sprite
	PauseScene_Sprite_RestartButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(PauseScene_Sprite_RestartButtonUp, GetVirtualWidth() / 2, 48)
	SetSpriteSize(PauseScene_Sprite_RestartButtonUp, 48, 12)
	Scene_InsertSprite(scene, PauseScene_Sprite_RestartButtonUp)
	
	// Create Restart Button Down Sprite
	PauseScene_Sprite_RestartButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(PauseScene_Sprite_RestartButtonDown, GetVirtualWidth() / 2, 48)
	SetSpriteSize(PauseScene_Sprite_RestartButtonDown, 48, 12)
	SetSpriteVisible(PauseScene_Sprite_RestartButtonDown, 0)
	Scene_InsertSprite(scene, PauseScene_Sprite_RestartButtonDown)
	
	// Create Restart Button Text
	PauseScene_Text_Restart = CreateText("Restart")
	SetTextFont(PauseScene_Text_Restart, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(PauseScene_Text_Restart, 1)
	SetTextPosition(PauseScene_Text_Restart, GetVirtualWidth() / 2, 44)
	SetTextDepth(PauseScene_Text_Restart, 0)
	SetTextColor(PauseScene_Text_Restart, 255, 255, 255, 255)
	SetTextSize(PauseScene_Text_Restart, 8)
	Scene_InsertText(scene, PauseScene_Text_Restart)
	
	// Create Exit Button Up Sprite
	PauseScene_Sprite_ExitButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(PauseScene_Sprite_ExitButtonUp, GetVirtualWidth() / 2, 72)
	SetSpriteSize(PauseScene_Sprite_ExitButtonUp, 48, 12)
	Scene_InsertSprite(scene, PauseScene_Sprite_ExitButtonUp)
	
	// Create Exit Button Down Sprite
	PauseScene_Sprite_ExitButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(PauseScene_Sprite_ExitButtonDown, GetVirtualWidth() / 2, 72)
	SetSpriteSize(PauseScene_Sprite_ExitButtonDown, 48, 12)
	SetSpriteVisible(PauseScene_Sprite_ExitButtonDown, 0)
	Scene_InsertSprite(scene, PauseScene_Sprite_ExitButtonDown)
	
	// Create About Button Text
	PauseScene_Text_Exit = CreateText("Exit")
	SetTextFont(PauseScene_Text_Exit, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(PauseScene_Text_Exit, 1)
	SetTextPosition(PauseScene_Text_Exit, GetVirtualWidth() / 2, 68)
	SetTextDepth(PauseScene_Text_Exit, 0)
	SetTextColor(PauseScene_Text_Exit, 255, 255, 255, 255)
	SetTextSize(PauseScene_Text_Exit, 8)
	Scene_InsertText(scene, PauseScene_Text_Exit)
	
	// Create Sound Enabled Button
	PauseScene_Sprite_SoundEnabledButton = CreateSprite(ASSET_IMAGE_GUI_SOUND_ENABLED_BUTTON)
	SetSpritePositionByOffset(PauseScene_Sprite_SoundEnabledButton, GetVirtualWidth() - 8, 8)
	SetSpriteSize(PauseScene_Sprite_SoundEnabledButton, 14, 14)
	Scene_InsertSprite(scene, PauseScene_Sprite_SoundEnabledButton)
	
	// Create Sound Disabled Button
	PauseScene_Sprite_SoundDisabledButton = CreateSprite(ASSET_IMAGE_GUI_SOUND_DISABLED_BUTTON)
	SetSpritePositionByOffset(PauseScene_Sprite_SoundDisabledButton, GetVirtualWidth() - 8, 8)
	SetSpriteSize(PauseScene_Sprite_SoundDisabledButton, 14, 14)
	Scene_InsertSprite(scene, PauseScene_Sprite_SoundDisabledButton)
	
	if(AudioManager.soundEnabled = 1)
		SetSpriteVisible(PauseScene_Sprite_SoundDisabledButton, 0)
		SetSpriteVisible(PauseScene_Sprite_SoundEnabledButton, 1)
	else
		SetSpriteVisible(PauseScene_Sprite_SoundDisabledButton, 1)
		SetSpriteVisible(PauseScene_Sprite_SoundEnabledButton, 0)
	endif
	
	
	// Create Music Enabled Button
	PauseScene_Sprite_MusicEnabledButton = CreateSprite(ASSET_IMAGE_GUI_MUSIC_ENABLED_BUTTON)
	SetSpritePositionByOffset(PauseScene_Sprite_MusicEnabledButton, GetVirtualWidth() - 24, 8)
	SetSpriteSize(PauseScene_Sprite_MusicEnabledButton, 14, 14)
	Scene_InsertSprite(scene, PauseScene_Sprite_MusicEnabledButton)
	
	// Create Music Disabled Button
	PauseScene_Sprite_MusicDisabledButton = CreateSprite(ASSET_IMAGE_GUI_MUSIC_DISABLED_BUTTON)
	SetSpritePositionByOffset(PauseScene_Sprite_MusicDisabledButton, GetVirtualWidth() - 24, 8)
	SetSpriteSize(PauseScene_Sprite_MusicDisabledButton, 14, 14)
	
	if(AudioManager.musicEnabled = 1)
		SetSpriteVisible(PauseScene_Sprite_MusicDisabledButton, 0)
		SetSpriteVisible(PauseScene_Sprite_MusicEnabledButton, 1)
	else
		SetSpriteVisible(PauseScene_Sprite_MusicDisabledButton, 1)
		SetSpriteVisible(PauseScene_Sprite_MusicEnabledButton, 0)
	endif
	
	
	Scene_InsertSprite(scene, PauseScene_Sprite_MusicDisabledButton)
	
	SetViewOffset(0,0)
	
endfunction scene

function PauseScene_Sync()
	
	// BUTTON HANDLING
	select(Button_EventTest(PauseScene_Sprite_ResumeButtonUp, PauseScene_Sprite_ResumeButtonDown))
		case 1:
			EventHandler_PushEvent(eventHandler, CONST_POP_SCENE_EVENT_ID)
		endcase
	endselect
	
	select(Button_EventTest(PauseScene_Sprite_RestartButtonUp, PauseScene_Sprite_RestartButtonDown))
		case 1:
			GameContext_Cleanup(gameContext)
			GameContext_Init(gameContext)
			
			EventHandler_PushEvent(eventHandler, CONST_POP_SCENE_EVENT_ID)
			SceneManager_StoreNextScene(sceneManager, PlayScene_CreateSceneObject())
			EventHandler_PushEvent(eventHandler, CONST_NEXT_SCENE_EVENT_ID)
		endcase
	endselect
	
	
	select(Button_EventTest(PauseScene_Sprite_ExitButtonUp, PauseScene_Sprite_ExitButtonDown))
		case 1:
			GameContext_Cleanup(gameContext)
			GameContext_Init(gameContext)
			
			EventHandler_PushEvent(eventHandler, CONST_POP_SCENE_EVENT_ID)
			SceneManager_StoreNextScene(sceneManager,	MainMenuScene_CreateSceneObject())
			EventHandler_PushEvent(eventHandler, CONST_NEXT_SCENE_EVENT_ID)
		endcase
	endselect
	
	// Enable/Disable Sound.
	select(Button_ToggleEventTest(PauseScene_Sprite_SoundEnabledButton, PauseScene_Sprite_SoundDisabledButton))
		case 0: 
			AudioManager.soundEnabled = 0 
		endcase
		case 1: 
			AudioManager.soundEnabled = 1 
		endcase
	endselect
	 
	//Enabled/Disable Music
	select(Button_ToggleEventTest(PauseScene_Sprite_MusicEnabledButton, PauseScene_Sprite_MusicDisabledButton))
		case 0: 
			AudioManager.musicEnabled = 0 
		endcase
		case 1: 
			AudioManager.musicEnabled = 1 
		endcase
	endselect 
	 
endfunction