/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	main_menu_scene.agc
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

global MainMenuScene_ID

global MainMenuScene_Sprite_PlayGameButtonUp
global MainMenuScene_Sprite_PlayGameButtonDown

global MainMenuScene_Sprite_HelpButtonUp
global MainMenuScene_Sprite_HelpButtonDown

global MainMenuScene_Sprite_AboutButtonUp
global MainMenuScene_Sprite_AboutButtonDown

global MainMenuScene_Sprite_SoundEnabledButton
global MainMenuScene_Sprite_SoundDisabledButton

global MainMenuScene_Sprite_MusicEnabledButton
global MainMenuScene_Sprite_MusicDisabledButton

/*

	FUNCTIONS
	
*/
function MainMenuScene_CreateSceneObject()
	scene as scene
	
	if(MainMenuScene_ID <= 0) then MainMenuScene_ID = IDGenerator_GenerateNewID(GLOBAL_ID_GENERATOR)
	
	scene.id = MainMenuScene_ID
	
	// Create Main Menu Title
	MainMenuScene_Text_Title = CreateText(CONST_GAME_TITLE)
	SetTextFont(MainMenuScene_Text_Title, ASSET_FONT_BOLD_FONT)
	SetTextAlignment(MainMenuScene_Text_Title, 1)
	SetTextPosition(MainMenuScene_Text_Title, GetVirtualWidth() / 2, 2)
	SetTextSize(MainMenuScene_Text_Title, 18)
	Scene_InsertText(scene, MainMenuScene_Text_Title)
	
	// Create Play Button Up Sprite
	MainMenuScene_Sprite_PlayGameButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(MainMenuScene_Sprite_PlayGameButtonUp, GetVirtualWidth() / 2, 48)
	SetSpriteSize(MainMenuScene_Sprite_PlayGameButtonUp, 96, 24)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_PlayGameButtonUp)
	
	// Create Play Button Down Sprite
	MainMenuScene_Sprite_PlayGameButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(MainMenuScene_Sprite_PlayGameButtonDown, GetVirtualWidth() / 2, 48)
	SetSpriteSize(MainMenuScene_Sprite_PlayGameButtonDown, 96, 24)
	SetSpriteVisible(MainMenuScene_Sprite_PlayGameButtonDown, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_PlayGameButtonDown)
	
	// Create Play Button Text
	MainMenuScene_Text_PlayGame = CreateText("Play Game")
	SetTextFont(MainMenuScene_Text_PlayGame, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(MainMenuScene_Text_PlayGame, 1)
	SetTextPosition(MainMenuScene_Text_PlayGame, GetVirtualWidth() / 2, 40)
	SetTextDepth(MainMenuScene_Text_PlayGame, 0)
	SetTextColor(MainMenuScene_Text_PlayGame, 255, 255, 255, 255)
	SetTextSize(MainMenuScene_Text_PlayGame, 14)
	Scene_InsertText(scene, MainMenuScene_Text_PlayGame)
	
	// Create Sound Enabled Button
	MainMenuScene_Sprite_SoundEnabledButton = CreateSprite(ASSET_IMAGE_GUI_SOUND_ENABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_SoundEnabledButton, GetVirtualWidth() - 16, 16)
	SetSpriteSize(MainMenuScene_Sprite_SoundEnabledButton, 22, 22)
	SetSpriteVisible(MainMenuScene_Sprite_SoundEnabledButton, AudioManager.soundEnabled)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_SoundEnabledButton)
	
	// Create Sound Disabled Button
	MainMenuScene_Sprite_SoundDisabledButton = CreateSprite(ASSET_IMAGE_GUI_SOUND_DISABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_SoundDisabledButton, GetVirtualWidth() - 16, 16)
	SetSpriteSize(MainMenuScene_Sprite_SoundDisabledButton, 22, 22)
	
	if(AudioManager.soundEnabled = 1)
		SetSpriteVisible(MainMenuScene_Sprite_SoundDisabledButton, 0)
		SetSpriteVisible(MainMenuScene_Sprite_SoundEnabledButton, 1)
	else
		SetSpriteVisible(MainMenuScene_Sprite_SoundDisabledButton, 1)
		SetSpriteVisible(MainMenuScene_Sprite_SoundEnabledButton, 0)
	endif
	
	Scene_InsertSprite(scene, MainMenuScene_Sprite_SoundDisabledButton)
	
	// Create Music Enabled Button
	MainMenuScene_Sprite_MusicEnabledButton = CreateSprite(ASSET_IMAGE_GUI_MUSIC_ENABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_MusicEnabledButton, GetVirtualWidth() - 42, 16)
	SetSpriteSize(MainMenuScene_Sprite_MusicEnabledButton, 22, 22)
	SetSpriteVisible(MainMenuScene_Sprite_MusicEnabledButton, AudioManager.musicEnabled)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_MusicEnabledButton)
	
	// Create Music Disabled Button
	MainMenuScene_Sprite_MusicDisabledButton = CreateSprite(ASSET_IMAGE_GUI_MUSIC_DISABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_MusicDisabledButton, GetVirtualWidth() - 42, 16)
	SetSpriteSize(MainMenuScene_Sprite_MusicDisabledButton, 22, 22)

	if(AudioManager.musicEnabled = 1)
		SetSpriteVisible(MainMenuScene_Sprite_MusicDisabledButton, 0)
		SetSpriteVisible(MainMenuScene_Sprite_MusicEnabledButton, 1)
	else
		SetSpriteVisible(MainMenuScene_Sprite_MusicDisabledButton, 1)
		SetSpriteVisible(MainMenuScene_Sprite_MusicEnabledButton, 0)
	endif
	
	Scene_InsertSprite(scene, MainMenuScene_Sprite_MusicDisabledButton)
	
	// Create Help Button Up Sprite
	MainMenuScene_Sprite_HelpButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(MainMenuScene_Sprite_HelpButtonUp, GetVirtualWidth() / 2, 96)
	SetSpriteSize(MainMenuScene_Sprite_HelpButtonUp, 96, 24)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_HelpButtonUp)
	
	// Create Help Button Down Sprite
	MainMenuScene_Sprite_HelpButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(MainMenuScene_Sprite_HelpButtonDown, GetVirtualWidth() / 2, 96)
	SetSpriteSize(MainMenuScene_Sprite_HelpButtonDown, 96, 24)
	SetSpriteVisible(MainMenuScene_Sprite_HelpButtonDown, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_HelpButtonDown)
	
	// Create Help Button Text
	MainMenuScene_Text_Help = CreateText("Help")
	SetTextFont(MainMenuScene_Text_Help, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(MainMenuScene_Text_Help, 1)
	SetTextPosition(MainMenuScene_Text_Help, GetVirtualWidth() / 2, 88)
	SetTextDepth(MainMenuScene_Text_Help, 0)
	SetTextColor(MainMenuScene_Text_Help, 255, 255, 255, 255)
	SetTextSize(MainMenuScene_Text_Help, 14)
	Scene_InsertText(scene, MainMenuScene_Text_Help)
	
	// Create About Button Up Sprite
	MainMenuScene_Sprite_AboutButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(MainMenuScene_Sprite_AboutButtonUp, GetVirtualWidth() / 2, 144)
	SetSpriteSize(MainMenuScene_Sprite_AboutButtonUp, 96, 24)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_AboutButtonUp)
	
	// Create About Button Down Sprite
	MainMenuScene_Sprite_AboutButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(MainMenuScene_Sprite_AboutButtonDown, GetVirtualWidth() / 2, 144)
	SetSpriteSize(MainMenuScene_Sprite_AboutButtonDown, 96, 24)
	SetSpriteVisible(MainMenuScene_Sprite_AboutButtonDown, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_AboutButtonDown)
	
	// Create About Button Text
	MainMenuScene_Text_About = CreateText("About")
	SetTextFont(MainMenuScene_Text_About, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(MainMenuScene_Text_About, 1)
	SetTextPosition(MainMenuScene_Text_About, GetVirtualWidth() / 2, 136)
	SetTextDepth(MainMenuScene_Text_About, 0)
	SetTextColor(MainMenuScene_Text_About, 255, 255, 255, 255)
	SetTextSize(MainMenuScene_Text_About, 14)
	Scene_InsertText(scene, MainMenuScene_Text_About)
	
	SetViewOffset(0,0)
	
endfunction scene

function MainMenuScene_Sync()
	
	// BUTTON HANDLING
	select(Button_EventTest(MainMenuScene_Sprite_PlayGameButtonUp, MainMenuScene_Sprite_PlayGameButtonDown))
		case 1:
			SceneManager_StoreNextScene(sceneManager, PlayScene_CreateSceneObject())
			EventHandler_PushEvent(eventHandler, CONST_NEXT_SCENE_EVENT_ID)
		endcase
	endselect
	
	Button_EventTest(MainMenuScene_Sprite_HelpButtonUp, MainMenuScene_Sprite_HelpButtonDown)
	Button_EventTest(MainMenuScene_Sprite_AboutButtonUp, MainMenuScene_Sprite_AboutButtonDown)
	
	// Enable/Disable Sound.
	select(Button_ToggleEventTest(MainMenuScene_Sprite_SoundEnabledButton, MainMenuScene_Sprite_SoundDisabledButton))
		case 0: 
			AudioManager.soundEnabled = 0 
		endcase
		case 1: 
			AudioManager.soundEnabled = 1 
		endcase
	endselect
	 
	//Enabled/Disable Music
	select(Button_ToggleEventTest(MainMenuScene_Sprite_MusicEnabledButton, MainMenuScene_Sprite_MusicDisabledButton))
		case 0: 
			AudioManager.musicEnabled = 0 
		endcase
		case 1: 
			AudioManager.musicEnabled = 1 
		endcase
	endselect 
	 
endfunction