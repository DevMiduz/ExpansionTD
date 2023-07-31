/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	scene_manager.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	TYPES
	
*/

type SceneManager
	scenes as Scene[]
endtype

/*

	FUNCTIONS
	
*/

function SceneManager_GetCurrentScene(sceneManager ref as SceneManager, scene ref as Scene)
	if(sceneManager.scenes.length = -1) then exitfunction -1
	
	scene = sceneManager.scenes[sceneManager.scenes.length]
endfunction 1

function SceneManager_ChangeScene(sceneManager ref as SceneManager, scene as Scene)
	if(sceneManager.scenes.length = -1) then exitfunction -1
	
	current_scene as Scene
	current_scene = sceneManager.scenes[sceneManager.scenes.length]
	Scene_Destroy(current_scene)
	
	sceneManager.scenes[sceneManager.scenes.length] = scene
	Scene_Show(scene)
endfunction 1

function SceneManager_Push(sceneManager ref as SceneManager, scene as Scene)
	if(sceneManager.scenes.find(scene.id) <> -1) then exitfunction
	
	if sceneManager.scenes.length > -1 
		current_scene as Scene
		current_scene = sceneManager.scenes[sceneManager.scenes.length]
		Scene_Hide(current_scene)
	endif
		
	sceneManager.scenes.insert(scene)
endfunction

function SceneManager_Pop(sceneManager ref as SceneManager, scene ref as Scene)
	if sceneManager.scenes.length = 0 then exitfunction -1
	
	scene = sceneManager.scenes[sceneManager.scenes.length]
	sceneManager.scenes.remove()
	Scene_Destroy(scene)
	
	scene = sceneManager.scenes[sceneManager.scenes.length]
	Scene_Show(scene)
endfunction 1