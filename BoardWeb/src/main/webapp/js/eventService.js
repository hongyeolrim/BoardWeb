/**
 * 
 */

const svc = {
	eventList: function(){
		fetch('eventList.do')
		.then(res => res.json())
		.then(getEventList);
		
	},
	
	addEvent: function(event, successCallback, errorCallback) {
		fetch('addEvent.do',{
			method: 'POST',
			headers: {
				'Content-type': 'application/json'
			},
			body: JSON.stringify(event)
		})
					.then(result => result.json())
					.then(successCallback)
					.catch(errorCallback)
			},
			
    
	}
	
