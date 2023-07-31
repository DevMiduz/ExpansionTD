/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

/*
*	event_handler.agc
* 	CREATED BY: DEV MIDUZ
*	https://github.com/DevMiduz/ExpansionTD
*	devmiduz@gmail.com
*/

/*

	GLOBALS

*/

global eventHandler as EventHandler

/*

	TYPES
	
*/

type EventHandler
	queue as Integer[]
endtype

type Event
	id as integer
	/*
		Not needed due to use store to handle data storage
		
		One way to handler Event data could have been to have:
		integer[]
		string[]
		float[]
		to handle generic data.
		
		then extract the data into a type from there.
	*/
endtype

/*

	FUNCTIONS
	
*/

/*
	Use in conjunction with the global store to handle events.
*/

function EventHandler_PushEvent(eventHandler ref as EventHandler, eventID as integer)
	eventHandler.queue.insert(eventID)
endfunction

function EventHandler_PopEvent(eventHandler ref as EventHandler)
	if(eventHandler.queue.length <> -1)
		id = EventHandler.queue[eventHandler.queue.length]
		eventHandler.queue.remove()
		exitfunction id
	endif
endfunction -1

function EventHandler_RunEvents(eventHandler ref as EventHandler)
	eventId as integer
	
	while (eventID = EventHandler_PopEvent(eventHandler)) <> -1
		EventHandler_RunEvent(eventHandler, eventID)
	endwhile
endfunction

function EventHandler_RunEvent(eventHandler ref as EventHandler, eventID as integer)
	select eventID
		case CONST_GAME_STARTED_EVENT_ID:
			EventHandler_GameStartedEvent()
		endcase
		
		case CONST_GAME_PAUSED_EVENT_ID:
			EventHandler_GamePausedEvent()
		endcase
		
		case CONST_GAME_RESUMED_EVENT_ID:
			EventHandler_GameResumedEvent()
		endcase
		
		case CONST_GAME_STOPPED_EVENT_ID:
			EventHandler_GameStoppedEvent()
		endcase
		
		case CONST_GAME_RESTARTED_EVENT_ID:
			EventHandler_GameRestartedEvent()
		endcase
		
		case CONST_GAME_OVER_EVENT_ID:
			EventHandler_GameOverEvent()
		endcase
		
		case CONST_TURN_STARTED_EVENT_ID:
			EventHandler_TurnStartedEvent()
		endcase
		
		case CONST_TURN_FINISHED_EVENT_ID:
			EventHandler_TurnFinishedEvent()
		endcase
		
		case CONST_CYCLE_STARTED_EVENT_ID:
			EventHandler_CycleStartedEvent()
		endcase
		
		case CONST_CYCLE_FINISHED_EVENT_ID:
			EventHandler_CycleFinishedEvent()
		endcase
		
		case CONST_LIFE_LOST_EVENT_ID:
			EventHandler_LifeLostEvent()
		endcase
		
		case CONST_ENEMY_KILLED_EVENT_ID:
			EventHandler_EnemyKilledEvent()
		endcase
	endselect
endfunction

function EventHandler_GameStartedEvent()
	
endfunction

function EventHandler_GamePausedEvent()
	
endfunction

function EventHandler_GameResumedEvent()
	
endfunction

function EventHandler_GameStoppedEvent()
	
endfunction

function EventHandler_GameRestartedEvent()
	
endfunction

function EventHandler_GameOverEvent()
	
endfunction

function EventHandler_TurnStartedEvent()
	
endfunction

function EventHandler_TurnFinishedEvent()
	
endfunction

function EventHandler_CycleStartedEvent()
	
endfunction

function EventHandler_CycleFinishedEvent()
	
endfunction

function EventHandler_LifeLostEvent()
	
endfunction

function EventHandler_EnemyKilledEvent()
	
endfunction