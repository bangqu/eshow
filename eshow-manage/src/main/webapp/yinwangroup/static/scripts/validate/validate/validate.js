
/**************************************************************

	Script		: Validate
	Version		: 2.1
	Authors		: Samuel Birch
	Desc		: Form validation
	Licence		: Open Source MIT Licence

**************************************************************/

var Validate = new Class({
	
	getOptions: function(){
		return {
			validateOnBlur: true,
			errorClass: 'error',
			errorMsgClass: 'errorMessage',
			dateFormat: 'dd/MM/yy',
			onFail: Class.empty,
			onSuccess: false,
			showErrorsInline: true,
			label: 'Please wait...'
		};
	},

	initialize: function(form, options){
		this.setOptions(this.getOptions(), options);
		
		this.form = $(form);
		this.elements = this.form.getElements('.required');
		
		this.list = [];
		
		this.elements.each(function(el,i){
			if(this.options.validateOnBlur){
				el.addEvent('blur', this.validate.bind(this, el));
			}
		}.bind(this));
		
		this.form.addEvent('submit', function(e){
			var event = new Event(e);
			var doSubmit = true;
			this.elements.each(function(el,i){
				if(! this.validate(el)){
					event.stop();
					doSubmit = false
					this.list.include(el);
				}else{
					this.list.remove(el);
				}
			}.bind(this));
			
			if(doSubmit){
				if(this.options.onSuccess){
					event.stop();
					this.options.onSuccess(this.form);
				}else{
					this.form.getElement('input[type=submit]').setProperty('value',this.options.label);
				}
			}else{
				this.options.onFail(this.getList());
			}
		}.bind(this));
		
	},
	
	getList: function(){
		var list = new Element('ul');
		this.list.each(function(el,i){
			if(el.title != ''){
			var li = new Element('li').injectInside(list);
			new Element('label').setProperty('for', el.id).setText(el.title).injectInside(li);
			}
		});
		return list;
	},
	
	validate: function(el){
		var valid = true;
		this.clearMsg(el);
		
		switch(el.type){
			case 'text':
			case 'password':
			case 'select-one':
				if(el.value != ''){
					if(el.hasClass('email')){
						var regEmail = /^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/;
						if(el.value.toUpperCase().match(regEmail)){
							valid = true;
						}else{
							valid = false;
							this.setMsg(el, '请输入有效的Email地址！');
						}
					}
				}else{
					valid = false;
					this.setMsg(el);
				}
				break;
		}
		return valid;
	},
	
	setMsg: function(el, msg){
		if(msg == undefined){
			msg = el.title;
		}
		if(this.options.showErrorsInline){
			if(el.error == undefined){
				el.error = new Element('span').addClass(this.options.errorMsgClass).setText(msg).injectAfter(el);
			}else{
				el.error.setText(msg);
			}
			el.addClass(this.options.errorClass);
		}
	},
	
	clearMsg: function(el){
		el.removeClass(this.options.errorClass);
		if(el.error != undefined){
			el.error.remove();
			el.error = undefined;
		}
	}
	
});

Validate.implement(new Options);
Validate.implement(new Events);


/*************************************************************/

