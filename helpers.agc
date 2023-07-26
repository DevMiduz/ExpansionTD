/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	helpers.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	TYPES
	
*/

/*

	FUNCTIONS
	
*/

Function Lerp(src as float, dest as float, decimal as float)
	result as float
    result = src * ( 1 - decimal ) + dest * decimal
EndFunction result
