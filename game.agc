/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	game.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	FUNCTIONS
	
*/

function initGame()
	AssetManager_LoadAssets(assetManager)
	InputHandler_InputDataUpdate()
	AudioManager_Init(audioManager)
	
	SceneManager_Push(sceneManager, MainMenuScene_CreateSceneObject())
endfunction