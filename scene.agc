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
endtype

/*

	FUNCTIONS
	
*/
function Scene_InsertSprite(scene ref as Scene, item as integer)
	scene.sprites.insert(item)
endfunction

function Scene_InsertText(scene ref as Scene, item as integer)
	scene.texts.insert(item)
endfunction

function Scene_InsertButton(scene ref as Scene, item as integer)
	scene.buttons.insert(item)
endfunction

function Scene_InsertEditBox(scene ref as Scene, item as integer)
	scene.editboxes.insert(item)
endfunction

function Scene_InsertParticles(scene ref as Scene, item as integer)
	scene.particles.insert(item)
endfunction

function Scene_RemoveSprite(scene ref as Scene, item as integer)
	Utility_Integer_FindAndRemove(scene.sprites, item)
endfunction

function Scene_RemoveText(scene ref as Scene, item as integer)
	Utility_Integer_FindAndRemove(scene.texts, item)
endfunction

function Scene_RemoveButton(scene ref as Scene, item as integer)
	Utility_Integer_FindAndRemove(scene.buttons, item)
endfunction

function Scene_RemoveEditBox(scene ref as Scene, item as integer)
	Utility_Integer_FindAndRemove(scene.editboxes, item)
endfunction

function Scene_RemoveParticles(scene ref as Scene, item as integer)
	Utility_Integer_FindAndRemove(scene.particles, item)
endfunction

function Scene_RemoveAndDestroySprite(scene ref as Scene, item as integer)
	Scene_RemoveSprite(scene, item)
	if(GetSpriteExists(item)) then DeleteSprite(item)
endfunction

function Scene_RemoveAndDestroyText(scene ref as Scene, item as integer)
	Scene_RemoveText(scene, item)
	if(GetTextExists(item)) then DeleteText(item)
endfunction

function Scene_RemoveAndDestroyButton(scene ref as Scene, item as integer)
	Scene_RemoveButton(scene, item)
	if(GetVirtualButtonExists(item)) then DeleteVirtualButton(item)
endfunction

function Scene_RemoveAndDestroyEditBox(scene ref as Scene, item as integer)
	Scene_RemoveEditBox(scene, item)
	if(GetEditBoxExists(item)) then DeleteEditBox(item)
endfunction

function Scene_RemoveAndDestroyParticles(scene ref as Scene, item as integer)
	Scene_RemoveParticles(scene, item)
	if(GetParticlesExists(item)) then DeleteParticles(item)
endfunction

function Scene_Show(scene ref as Scene)
	for i = 0 to scene.sprites.length
		SetSpriteActive(scene.sprites[i], 1)
		SetSpriteVisible(scene.sprites[i], 1)
	next i
	
	for i = 0 to scene.texts.length
		SetTextVisible(scene.texts[i], 1)
	next i
	
	for i = 0 to scene.buttons.length
		SetVirtualButtonActive(scene.buttons[i], 1)
		SetVirtualButtonVisible(scene.buttons[i], 1)
	next i
	
	for i = 0 to scene.editBoxes.length
		SetEditBoxActive(scene.editBoxes[i], 1)
		SetEditBoxVisible(scene.editBoxes[i], 1)
	next i
	
	for i = 0 to scene.particles.length
		SetParticlesActive(scene.particles[i], 1)
		SetParticlesVisible(scene.particles[i], 1)
	next i
endfunction

function Scene_Hide(scene ref as Scene)
	for i = 0 to scene.sprites.length
		SetSpriteActive(scene.sprites[i], 0)
		SetSpriteVisible(scene.sprites[i], 0)
	next i
	
	for i = 0 to scene.texts.length
		SetTextVisible(scene.texts[i], 0)
	next i
	
	for i = 0 to scene.buttons.length
		SetVirtualButtonActive(scene.buttons[i], 0)
		SetVirtualButtonVisible(scene.buttons[i], 0)
	next i
	
	for i = 0 to scene.editBoxes.length
		SetEditBoxActive(scene.editBoxes[i], 0)
		SetEditBoxVisible(scene.editBoxes[i], 0)
	next i
	
	for i = 0 to scene.particles.length
		SetParticlesActive(scene.particles[i], 0)
		SetParticlesVisible(scene.particles[i], 0)
	next i
endfunction

function Scene_Destroy(scene ref as Scene)
	for i = 0 to scene.sprites.length
		DeleteSprite(scene.sprites[i])
	next i
	
	for i = 0 to scene.texts.length
		DeleteText(scene.texts[i])
	next i
	
	for i = 0 to scene.buttons.length
		DeleteVirtualButton(scene.buttons[i])
	next i
	
	for i = 0 to scene.editBoxes.length
		DeleteEditBox(scene.editBoxes[i])
	next i
	
	for i = 0 to scene.particles.length
		DeleteParticles(scene.particles[i])
	next i
	
	scene.sprites.length = -1
	scene.texts.length = -1
	scene.buttons.length = -1
	scene.editBoxes.length = -1
	scene.particles.length = -1
endfunction