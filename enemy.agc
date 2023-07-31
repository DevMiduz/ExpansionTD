/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	enemy.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	INCLUDES

*/

/*

	CONSTANTS

*/

/*

	TYPES

*/

type Enemy
	id as integer
	position as Vector2D
	nextPathPoint as Vector2D
	health as float
	speed as float
	armour as float
	shield as float
	multiplier as float 		// multiplier to adjust enemies toughness by wave by setting a level.
	currency as integer 		// money gained for killing.
	score as integer 		// score gained for killing.
endtype

/*

	FUNCTIONS

*/

