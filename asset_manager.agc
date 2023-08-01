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
global ASSET_IMAGE_GUI_PAUSE_DOWN_BUTTON as integer
global ASSET_IMAGE_GUI_PAUSE_UP_BUTTON as integer

global ASSET_IMAGE_TERRAIN_TILESET as integer

//	GLOBALS -- SOUNDS
global ASSET_SOUND_SELECT_SOUND_1 as integer
global ASSET_SOUND_SELECT_SOUND_2 as integer

//	GLOBALS -- MUSIC
global ASSET_MUSIC_BACKGROUND_1 as integer
global ASSET_MUSIC_BACKGROUND_2 as integer
global ASSET_MUSIC_BACKGROUND_3 as integer
global ASSET_MUSIC_BACKGROUND_4 as integer
global ASSET_MUSIC_BACKGROUND_5 as integer
global ASSET_MUSIC_BACKGROUND_6 as integer

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
	
	ASSET_IMAGE_GUI_PAUSE_DOWN_BUTTON = LoadImage("GUI/pause_button2.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_PAUSE_DOWN_BUTTON)
	
	ASSET_IMAGE_GUI_PAUSE_UP_BUTTON = LoadImage("GUI/pause_button1.png")
	assetManager.images.insert(ASSET_IMAGE_GUI_PAUSE_UP_BUTTON)
	
	ASSET_IMAGE_TERRAIN_TILESET = LoadImage("Tiles/terrain_tileset.png")
	assetManager.images.insert(ASSET_IMAGE_TERRAIN_TILESET)
endfunction

function AssetManager_LoadSounds(assetManager ref as AssetManager)
	ASSET_SOUND_SELECT_SOUND_1 = LoadSoundOGG("Sound/select_006.ogg")
	assetManager.sounds.insert(ASSET_SOUND_SELECT_SOUND_1)
	
	ASSET_SOUND_SELECT_SOUND_2 = LoadSoundOGG("Sound/click_003.ogg")
	assetManager.sounds.insert(ASSET_SOUND_SELECT_SOUND_2)
endfunction

function AssetManager_LoadMusic(assetManager ref as AssetManager)
	ASSET_MUSIC_BACKGROUND_1 = LoadMusicOGG("Music/Mishief Stroll.ogg")
	assetManager.music.insert(ASSET_MUSIC_BACKGROUND_1)
	
	ASSET_MUSIC_BACKGROUND_2 = LoadMusicOGG("Music/Alpha Dance.ogg")
	assetManager.music.insert(ASSET_MUSIC_BACKGROUND_2)
	
	ASSET_MUSIC_BACKGROUND_3 = LoadMusicOGG("Music/Italian Mom.ogg")
	assetManager.music.insert(ASSET_MUSIC_BACKGROUND_3)
	
	ASSET_MUSIC_BACKGROUND_4 = LoadMusicOGG("Music/Night at the Beach.ogg")
	assetManager.music.insert(ASSET_MUSIC_BACKGROUND_4)

	ASSET_MUSIC_BACKGROUND_5 = LoadMusicOGG("Music/Sad Town.ogg")
	assetManager.music.insert(ASSET_MUSIC_BACKGROUND_5)
	
	ASSET_MUSIC_BACKGROUND_6 = LoadMusicOGG("Music/Wacky Waiting.ogg")
	assetManager.music.insert(ASSET_MUSIC_BACKGROUND_6)
endfunction

function AssetManager_LoadFonts(assetManager ref as AssetManager)
	ASSET_FONT_BOLD_FONT = LoadFont("Fonts/LeonSans-Bold.otf")
	assetManager.fonts.insert(ASSET_FONT_BOLD_FONT)
	
	ASSET_FONT_REGULAR_FONT = LoadFont("Fonts/LeonSans-Regular.otf")
	assetManager.fonts.insert(ASSET_FONT_REGULAR_FONT)
endfunction