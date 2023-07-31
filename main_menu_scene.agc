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
	MainMenuScene_ID = IDGenerator_GenerateNewID(GLOBAL_ID_GENERATOR)
	scene.id = MainMenuScene_ID
	
	// Create Main Menu Title
	MainMenuScene_Text_Title = CreateText(CONST_GAME_TITLE)
	SetTextFont(MainMenuScene_Text_Title, ASSET_FONT_BOLD_FONT)
	SetTextAlignment(MainMenuScene_Text_Title, 1)
	SetTextPosition(MainMenuScene_Text_Title, GetVirtualWidth() / 2, 2)
	SetTextSize(MainMenuScene_Text_Title, 10)
	Scene_InsertText(scene, MainMenuScene_Text_Title)
	
	// Create Play Button Up Sprite
	MainMenuScene_Sprite_PlayGameButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(MainMenuScene_Sprite_PlayGameButtonUp, GetVirtualWidth() / 2, 24)
	SetSpriteSize(MainMenuScene_Sprite_PlayGameButtonUp, 48, 12)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_PlayGameButtonUp)
	
	// Create Play Button Down Sprite
	MainMenuScene_Sprite_PlayGameButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(MainMenuScene_Sprite_PlayGameButtonDown, GetVirtualWidth() / 2, 24)
	SetSpriteSize(MainMenuScene_Sprite_PlayGameButtonDown, 48, 12)
	SetSpriteVisible(MainMenuScene_Sprite_PlayGameButtonDown, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_PlayGameButtonDown)
	
	// Create Play Button Text
	MainMenuScene_Text_PlayGame = CreateText("Play Game")
	SetTextFont(MainMenuScene_Text_PlayGame, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(MainMenuScene_Text_PlayGame, 1)
	SetTextPosition(MainMenuScene_Text_PlayGame, GetVirtualWidth() / 2, 20)
	SetTextDepth(MainMenuScene_Text_PlayGame, 0)
	SetTextColor(MainMenuScene_Text_PlayGame, 255, 255, 255, 255)
	SetTextSize(MainMenuScene_Text_PlayGame, 8)
	Scene_InsertText(scene, MainMenuScene_Text_PlayGame)
	
	// Create Sound Enabled Button
	MainMenuScene_Sprite_SoundEnabledButton = CreateSprite(ASSET_IMAGE_GUI_SOUND_ENABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_SoundEnabledButton, GetVirtualWidth() - 8, 8)
	SetSpriteSize(MainMenuScene_Sprite_SoundEnabledButton, 14, 14)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_SoundEnabledButton)
	
	// Create Sound Disabled Button
	MainMenuScene_Sprite_SoundDisabledButton = CreateSprite(ASSET_IMAGE_GUI_SOUND_DISABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_SoundDisabledButton, GetVirtualWidth() - 8, 8)
	SetSpriteSize(MainMenuScene_Sprite_SoundDisabledButton, 14, 14)
	SetSpriteVisible(MainMenuScene_Sprite_SoundDisabledButton, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_SoundDisabledButton)
	
	// Create Sound Enabled Button
	MainMenuScene_Sprite_MusicEnabledButton = CreateSprite(ASSET_IMAGE_GUI_MUSIC_ENABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_MusicEnabledButton, GetVirtualWidth() - 24, 8)
	SetSpriteSize(MainMenuScene_Sprite_MusicEnabledButton, 14, 14)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_MusicEnabledButton)
	
	// Create Sound Disabled Button
	MainMenuScene_Sprite_MusicDisabledButton = CreateSprite(ASSET_IMAGE_GUI_MUSIC_DISABLED_BUTTON)
	SetSpritePositionByOffset(MainMenuScene_Sprite_MusicDisabledButton, GetVirtualWidth() - 24, 8)
	SetSpriteSize(MainMenuScene_Sprite_MusicDisabledButton, 14, 14)
	SetSpriteVisible(MainMenuScene_Sprite_MusicDisabledButton, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_MusicDisabledButton)
	
	// Create Help Button Up Sprite
	MainMenuScene_Sprite_HelpButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(MainMenuScene_Sprite_HelpButtonUp, GetVirtualWidth() / 2, 48)
	SetSpriteSize(MainMenuScene_Sprite_HelpButtonUp, 48, 12)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_HelpButtonUp)
	
	// Create Help Button Down Sprite
	MainMenuScene_Sprite_HelpButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(MainMenuScene_Sprite_HelpButtonDown, GetVirtualWidth() / 2, 48)
	SetSpriteSize(MainMenuScene_Sprite_HelpButtonDown, 48, 12)
	SetSpriteVisible(MainMenuScene_Sprite_HelpButtonDown, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_HelpButtonDown)
	
	// Create Help Button Text
	MainMenuScene_Text_Help = CreateText("Help")
	SetTextFont(MainMenuScene_Text_Help, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(MainMenuScene_Text_Help, 1)
	SetTextPosition(MainMenuScene_Text_Help, GetVirtualWidth() / 2, 44)
	SetTextDepth(MainMenuScene_Text_Help, 0)
	SetTextColor(MainMenuScene_Text_Help, 255, 255, 255, 255)
	SetTextSize(MainMenuScene_Text_Help, 8)
	Scene_InsertText(scene, MainMenuScene_Text_Help)
	
	// Create About Button Up Sprite
	MainMenuScene_Sprite_AboutButtonUp = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	SetSpritePositionByOffset(MainMenuScene_Sprite_AboutButtonUp, GetVirtualWidth() / 2, 72)
	SetSpriteSize(MainMenuScene_Sprite_AboutButtonUp, 48, 12)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_AboutButtonUp)
	
	// Create About Button Down Sprite
	MainMenuScene_Sprite_AboutButtonDown = CreateSprite(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	SetSpritePositionByOffset(MainMenuScene_Sprite_AboutButtonDown, GetVirtualWidth() / 2, 72)
	SetSpriteSize(MainMenuScene_Sprite_AboutButtonDown, 48, 12)
	SetSpriteVisible(MainMenuScene_Sprite_AboutButtonDown, 0)
	Scene_InsertSprite(scene, MainMenuScene_Sprite_AboutButtonDown)
	
	// Create About Button Text
	MainMenuScene_Text_About = CreateText("About")
	SetTextFont(MainMenuScene_Text_About, ASSET_FONT_REGULAR_FONT)
	SetTextAlignment(MainMenuScene_Text_About, 1)
	SetTextPosition(MainMenuScene_Text_About, GetVirtualWidth() / 2, 68)
	SetTextDepth(MainMenuScene_Text_About, 0)
	SetTextColor(MainMenuScene_Text_About, 255, 255, 255, 255)
	SetTextSize(MainMenuScene_Text_About, 8)
	Scene_InsertText(scene, MainMenuScene_Text_About)
	
endfunction scene

function MainMenuScene_Sync()
	
	// BUTTON HANDLING
	Button_EventTest(MainMenuScene_Sprite_PlayGameButtonUp, MainMenuScene_Sprite_PlayGameButtonDown)
	Button_EventTest(MainMenuScene_Sprite_HelpButtonUp, MainMenuScene_Sprite_HelpButtonDown)
	Button_EventTest(MainMenuScene_Sprite_AboutButtonUp, MainMenuScene_Sprite_AboutButtonDown)
	Button_ToggleEventTest(MainMenuScene_Sprite_SoundEnabledButton, MainMenuScene_Sprite_SoundDisabledButton)
	Button_ToggleEventTest(MainMenuScene_Sprite_MusicEnabledButton, MainMenuScene_Sprite_MusicDisabledButton)
endfunction

function MainMenuScene_Setup()
	
endfunction

function MainMenuScene_Physics()
	
endfunction

function MainMenuScene_Update()
	
endfunction

function MainMenuScene_Draw()
	
endfunction