/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	asset_manager.agc
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

global assetManager as AssetManager

//	GLOBALS -- IMAGES
global ASSET_IMAGE_GUI_BUTTON_LONG_UP as integer
global ASSET_IMAGE_GUI_BUTTON_LONG_DOWN as integer
global ASSET_IMAGE_GUI_SOUND_ENABLED_BUTTON as integer
global ASSET_IMAGE_GUI_SOUND_DISABLED_BUTTON as integer
global ASSET_IMAGE_GUI_MUSIC_ENABLED_BUTTON as integer
global ASSET_IMAGE_GUI_MUSIC_DISABLED_BUTTON as integer

//	GLOBALS -- SOUNDS


//	GLOBALS -- MUSIC


//	GLOBALS -- FONTS
global ASSET_FONT_BOLD_FONT as integer
global ASSET_FONT_REGULAR_FONT as integer

/*

	TYPES
	
*/

type AssetManager
	images as integer[]
	sounds as integer[]
	music as integer[]
	fonts as integer[]
endtype

/*

	FUNCTIONS
	
*/

function AssetManager_LoadAssets(assetManager ref as AssetManager)
	AssetManager_LoadImages(AssetManager)
	AssetManager_LoadSounds(AssetManager)
	AssetManager_LoadMusic(AssetManager)
	AssetManager_LoadFonts(AssetManager)
endfunction

function AssetManager_LoadImages(assetManager ref as AssetManager)
	ASSET_IMAGE_GUI_BUTTON_LONG_UP = LoadImage("GUI/long_button_up.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_BUTTON_LONG_UP)
	
	ASSET_IMAGE_GUI_BUTTON_LONG_DOWN = LoadImage("GUI/long_button_down.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_BUTTON_LONG_DOWN)
	
	ASSET_IMAGE_GUI_SOUND_ENABLED_BUTTON = LoadImage("GUI/sound_button1.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_SOUND_ENABLED_BUTTON)
	
	ASSET_IMAGE_GUI_SOUND_DISABLED_BUTTON = LoadImage("GUI/sound_button2.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_SOUND_DISABLED_BUTTON)
	
	ASSET_IMAGE_GUI_MUSIC_ENABLED_BUTTON = LoadImage("GUI/music_button1.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_MUSIC_ENABLED_BUTTON)
	
	ASSET_IMAGE_GUI_MUSIC_DISABLED_BUTTON = LoadImage("GUI/music_button2.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_MUSIC_DISABLED_BUTTON)
endfunction

function AssetManager_LoadSounds(assetManager ref as AssetManager)
	
endfunction

function AssetManager_LoadMusic(assetManager ref as AssetManager)
	
endfunction

function AssetManager_LoadFonts(assetManager ref as AssetManager)
	ASSET_FONT_BOLD_FONT = LoadFont("Fonts/LeonSans-Bold.otf")
	assetManager.fonts.insert(ASSET_FONT_BOLD_FONT)
	
	ASSET_FONT_REGULAR_FONT = LoadFont("Fonts/LeonSans-Regular.otf")
	assetManager.fonts.insert(ASSET_FONT_REGULAR_FONT)
endfunction