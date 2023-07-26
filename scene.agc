/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	scene.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	TYPES
	
*/

type Scene
	id as integer
	
	sprites as integer[]
	texts as integer[]
	buttons as integer[]
	editBoxes as integer[]
	particles as integer[]
	
	sceneItems as SceneItem[]
endtype

type SceneItem
	id as integer
	active as integer
	visible as integer
	sceneItemType as integer
endtype

/*

	FUNCTIONS
	
*/

function Scene_StoreScene(scene ref as Scene)
	scene.sceneItems.length = -1
	
	Scene_CreateSpriteSceneArray(scene.sprites, scene.sceneItems)
	Scene_CreateTextSceneArray(scene.texts, scene.sceneItems)
	Scene_CreateButtonSceneArray(scene.buttons, scene.sceneItems)
	Scene_CreateEditBoxSceneArray(scene.editBoxes, scene.sceneItems)
	Scene_CreateParticleSceneArray(scene.particles, scene.sceneItems)
endfunction

function Scene_DestroyScene(scene ref as Scene)
	
	Scene_StoreScene(scene)
	
	sceneItem as SceneItem
	
	for i = 0 to scene.sceneItems.length
		sceneItem = scene.sceneItems[i]
		
		select(sceneItem.sceneItemType)
			case CONST_SCENE_SPRITE_TYPE:
				if GetSpriteExists(sceneItem.id) then DeleteSprite(sceneItem.id)
			endcase
			case CONST_SCENE_TEXT_TYPE:
				if GetTextExists(sceneItem.id) then DeleteText(sceneItem.id)
			endcase
			case CONST_SCENE_BUTTON_TYPE:
				//May not be suitable for all games.
				//But logic can be used afterwards to disable a button if required.
				if GetVirtualButtonExists(sceneItem.id) then DeleteVirtualButton(sceneItem.id)
			endcase
			case CONST_SCENE_EDIT_BOX_TYPE:
				if GetEditBoxExists(sceneItem.id) then DeleteEditBox(sceneItem.id)
			endcase
			case CONST_SCENE_PARTICLE_TYPE:
				if GetParticlesExists(sceneItem.id) then DeleteParticles(sceneItem.id)
			endcase
		endselect
	next i
endfunction

function Scene_HideScene(scene ref as Scene)
	
	Scene_StoreScene(scene)
	
	sceneItem as SceneItem
	
	for i = 0 to scene.sceneItems.length
		sceneItem = scene.sceneItems[i]
		
		select(sceneItem.sceneItemType)
			case CONST_SCENE_SPRITE_TYPE:
				if GetSpriteExists(sceneItem.id)
					SetSpriteVisible(sceneItem.id, 0)
					SetSpriteActive(sceneItem.id, 0)
				endif
			endcase
			case CONST_SCENE_TEXT_TYPE:
				if GetTextExists(sceneItem.id)
					SetTextVisible(sceneItem.id, 0)
				endif
			endcase
			case CONST_SCENE_BUTTON_TYPE:
				if GetVirtualButtonExists(sceneItem.id)
					//May not be suitable for all games.
					//But logic can be used afterwards to disable a button if required.
					SetVirtualButtonActive(sceneItem.id, 0)
					SetVirtualButtonVisible(sceneItem.id, 0)
				endif
			endcase
			case CONST_SCENE_EDIT_BOX_TYPE:
				if GetEditBoxExists(sceneItem.id)
					SetEditBoxActive(sceneItem.id, 0)
					SetEditBoxVisible(sceneItem.id, 0)
				endif
			endcase
			case CONST_SCENE_PARTICLE_TYPE:
				if GetParticlesExists(sceneItem.id)
					SetParticlesActive(sceneItem.id, 0)
					SetParticlesVisible(sceneItem.id, 0)
				endif
			endcase
		endselect
	next i
endfunction

function Scene_RestoreScene(scene ref as Scene)
	
	sceneItem as SceneItem
	
	for i = 0 to scene.sceneItems.length
		sceneItem = scene.sceneItems[i]
		
		select(sceneItem.sceneItemType)
			case CONST_SCENE_SPRITE_TYPE:
				if GetSpriteExists(sceneItem.id)
					SetSpriteVisible(sceneItem.id, sceneItem.visible)
					SetSpriteActive(sceneItem.id, sceneItem.active)
				endif
			endcase
			case CONST_SCENE_TEXT_TYPE:
				if GetTextExists(sceneItem.id)
					SetTextVisible(sceneItem.id, sceneItem.visible)
				endif
			endcase
			case CONST_SCENE_BUTTON_TYPE:
				//May not be suitable for all games.
				//But logic can be used afterwards to disable a button if required.
				if GetVirtualButtonExists(sceneItem.id)
					SetVirtualButtonActive(sceneItem.id, 1)
					SetVirtualButtonVisible(sceneItem.id, 1)
				endif
			endcase
			case CONST_SCENE_EDIT_BOX_TYPE:
				if GetEditBoxExists(sceneItem.id)
					SetEditBoxActive(sceneItem.id, sceneItem.active)
					SetEditBoxVisible(sceneItem.id, sceneItem.visible)
				endif
			endcase
			case CONST_SCENE_PARTICLE_TYPE:
				if GetParticlesExists(sceneItem.id)
					SetParticlesActive(sceneItem.id, sceneItem.active)
					SetParticlesVisible(sceneItem.id, sceneItem.visible)
				endif
			endcase
		endselect
	next i
endfunction

//Convert Arrays into Scene Item Arrays
function Scene_CreateSpriteSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetSpriteExists(input[i]) then continue
		
		sceneItem = Scene_CreateSpriteSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function Scene_CreateTextSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetTextExists(input[i]) then continue
			
		sceneItem = Scene_CreateTextSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function Scene_CreateEditBoxSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetEditBoxExists(input[i]) then continue
		
		sceneItem = Scene_CreateEditBoxSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function Scene_CreateParticleSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetParticlesExists(input[i]) then continue
		
		sceneItem = Scene_CreateParticleSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function Scene_CreateButtonSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetVirtualButtonExists(input[i]) then continue
		
		sceneItem = Scene_CreateButtonSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

// Create Single Scene Items
function Scene_CreateSpriteSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active =  GetSpriteActive(item)
	sceneItem.visible =  GetSpriteVisible(item)
	sceneItem.sceneItemType = CONST_SCENE_SPRITE_TYPE
endfunction sceneItem

function Scene_CreateTextSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active = 1
	sceneItem.visible =  GetTextVisible(item)
	sceneItem.sceneItemType = CONST_SCENE_TEXT_TYPE
endfunction sceneItem

function Scene_CreateEditBoxSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active = GetEditBoxActive(item)
	sceneItem.visible =  GetEditBoxVisible(item)
	sceneItem.sceneItemType = CONST_SCENE_EDIT_BOX_TYPE
endfunction sceneItem

function Scene_CreateParticleSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active =  GetParticlesActive(item)
	sceneItem.visible =  GetParticlesVisible(item)
	sceneItem.sceneItemType = CONST_SCENE_PARTICLE_TYPE
endfunction sceneItem

function Scene_CreateButtonSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active = 1
	sceneItem.visible = 1
	sceneItem.sceneItemType = CONST_SCENE_BUTTON_TYPE
endfunction sceneItem