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

	GLOBALS
	
*/

global SceneManager_SceneStack as Scene[]

/*

	FUNCTIONS
	
*/

function SceneManager_SyncScene()
	if SceneManager_SceneStack.length = -1 then exitfunction
	
	scene as Scene
	scene = SceneManager_SceneStack[SceneManager_SceneStack.length]
	
	select scene.id
		/*
		case CONST_TEST_SCENE
			test_scene_sync()
		endcase
		case CONST_TEST_SCENE_2
			test_scene_2_sync()
		endcase
		*/
	endselect
	
endfunction

function SceneManager_PushScene(scene as Scene)
	
	if(SceneManager_SceneStack.find(scene.id) <> -1) then exitfunction
	
	if SceneManager_SceneStack.length > -1 
		current_scene as Scene
		current_scene = SceneManager_SceneStack[SceneManager_SceneStack.length]
		Scene_HideScene(current_scene)
		SceneManager_SceneStack[SceneManager_SceneStack.length] = current_scene
	endif
		
	SceneManager_SceneStack.insert(scene)
	
endfunction

function SceneManager_PopScene()
	
	if SceneManager_SceneStack.length = 0 then exitfunction
	
	scene as Scene
	scene = SceneManager_SceneStack[SceneManager_SceneStack.length]
	SceneManager_SceneStack.remove()
	Scene_DestroyScene(scene)
	
	select scene.id
		/*
		case CONST_TEST_SCENE
			test_scene_cleanup()
		endcase
		case CONST_TEST_SCENE_2
			test_scene_2_cleanup()
		endcase
		*/
	endselect
	
	scene = SceneManager_SceneStack[SceneManager_SceneStack.length]
	Scene_RestoreScene(scene)
	SceneManager_SceneStack[SceneManager_SceneStack.length] = scene
endfunction