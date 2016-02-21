var DWRequest = new Class({
		Extends: Request,
		options: {
			onRequest: function() {
				show_ajax_message('request');
			},
			onSuccess: function() {
				show_ajax_message('success');
			},
			onFailure: function() {
				show_ajax_message('failure');
			},
			onCancel: function() {
				show_ajax_message('cancel');
			}
		}
	});
	
	
	//adds initial events
	window.addEvent('domready',function() {
		
		//for every action class
		$$('.ajax').each(function(el) {
			
			//add an event..
			el.addEvent('click', function(e) {
				e = new Event(e).stop();
					
				//make ajax request
				var req = new DWRequest({
					url: el.get('href'),
					method: 'get',
					data: 'something'
				}).send();
			});
		});
	});
	
	//shows the block
	function show_ajax_message(state)
	{
		//set position
		$('message').setStyle('top',window.getScrollTop() + 10);
		
		//on request...
		if(state == 'request')
		{
			//show the box
			$('message').addClass('onrequest').set('text','Performing Request...').setStyles({'background-color':'#fffea1','display':'block','opacity':'100'});
		}
		//on success
		else if(state == 'success')
		{
			//take care of box
			$('message').set('text','Request Complete!');
			
			//do effect
			var myMorph = new Fx.Morph('message',{'duration':1000});
			myMorph.start({'opacity': 0,'background-color': '#90ee90'});
		}
		else if(state == 'failure')
		{
			//take care of box
			$('message').set('text','Request Failed!');
			
			//do effect
			var myMorph = new Fx.Morph('message',{'duration':1000});
			myMorph.start({'opacity': 0,'background-color': '#ff0000'});
		}
		else if(state == 'cancel')
		{
			//take care of box
			$('message').set('text','Request Cancelled!');
			
			//do effect
			var myMorph = new Fx.Morph('message',{'duration':1000});
			myMorph.start({'opacity': 0,'background-color': '#fffea1'});
		}
	}