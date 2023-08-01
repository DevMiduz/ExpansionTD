/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	audio_manager.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	GLOBALS

*/

global audioManager as AudioManager

/*

	TYPES
	
*/

type AudioManager
	soundEnabled as integer
	musicEnabled as integer
	musicQueueIndex as integer
	trackBeginningTimestamp as float
	trackPlayTime as float
	musicQueue as integer[]
	musicFadeVolume as integer
endtype

/*

	FUNCTIONS
	
*/

function AudioManager_Init(audioManager ref as AudioManager)
	audioManager.soundEnabled = 1
	audioManager.musicEnabled = 1
	audioManager.trackPlayTime = 120
	
	audioManager.musicQueue.insert(ASSET_MUSIC_BACKGROUND_1)
	audioManager.musicQueue.insert(ASSET_MUSIC_BACKGROUND_2)
	audioManager.musicQueue.insert(ASSET_MUSIC_BACKGROUND_3)
	audioManager.musicQueue.insert(ASSET_MUSIC_BACKGROUND_4)
	audioManager.musicQueue.insert(ASSET_MUSIC_BACKGROUND_5)
	audioManager.musicQueue.insert(ASSET_MUSIC_BACKGROUND_6)
	
	AudioManager_LoadNextTrack(audioManager)
endfunction

function AudioManager_PlaySound(audioManager ref as AudioManager, id as integer, volume as integer)
	if(audioManager.soundEnabled = 1) then PlaySound(id, volume)
endfunction

function AudioManager_PlayMusic(audioManager ref as AudioManager, id as integer)
	if(audioManager.musicEnabled = 1) then PlayMusicOGG(id, 1)
endfunction

function AudioManager_PlayMusicQueue(audioManager ref as AudioManager)
	if((audioManager.trackBeginningTimestamp + audioManager.trackPlayTime) < Timer())
		AudioManager_FadeMusicOut(audioManager)
		
		if(audioManager.musicFadeVolume = 0)
			AudioManager_LoadNextTrack(audioManager)
		endif
	elseif(audioManager.musicFadeVolume < 100)
		AudioManager_FadeMusicIn(audioManager)
	endif
	
	if(audioManager.musicEnabled = 1)
		SetMusicVolumeOGG( AudioManager_GetCurrentMusicTrack(audioManager), audioManager.musicFadeVolume)
	else
		SetMusicVolumeOGG( AudioManager_GetCurrentMusicTrack(audioManager), 0)
	endif
endfunction


function AudioManager_GetCurrentMusicTrack(audioManager ref as AudioManager)
	
endfunction audioManager.musicQueue[audioManager.musicQueueIndex]

function AudioManager_LoadNextTrack(audioManager ref as AudioManager)
	inc audioManager.musicQueueIndex
	
	if(audioManager.musicQueueIndex > audioManager.musicQueue.length) then audioManager.musicQueueIndex = 0
	
	AudioManager_PlayMusic(audioManager, AudioManager_GetCurrentMusicTrack(audioManager))
	audioManager.trackBeginningTimestamp = Timer()
endfunction

function AudioManager_FadeMusicOut(audioManager ref as AudioManager)
	if(audioManager.musicFadeVolume > 0) then dec audioManager.musicFadeVolume
endfunction

function AudioManager_FadeMusicIn(audioManager ref as AudioManager)
	if(audioManager.musicFadeVolume < 100) then inc audioManager.musicFadeVolume
endfunction