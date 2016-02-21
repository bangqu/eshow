/** 类 */
var Class = {
	create: function() {
		return function() {
			this.initialize.apply(this, arguments);
		}
	}
}

/** 菜单列表 */
var MenuList = Class.create();
MenuList.prototype = {

	/**
	 * 构造方法
	 * id: 菜单列表
	 * opacity: 透明度 (0.0 - 1.0, 0.0 为全透明, 1.0 为不透明)
	 */
	initialize: function(id, opacity) {
		// 获取菜单列表
		this.obj = document.getElementById(id);
		if (!this.obj) { return; }

		// 对菜单列表内的所有菜单进行处理
		var menus = this.obj.childNodes;
		for (var i = 0; i < menus.length; i++) {
			var menu = menus[i];
			if (menu.tagName == 'LI') {
				// 构建菜单
				new Menu(menu, opacity);
			}
		}
	}
}

/** 菜单 */
var Menu = Class.create();
Menu.prototype = {

	/**
	 * 构造方法
	 * target: 目标菜单
	 * opacity: 透明度 (0.0 - 1.0, 0.0 为全透明, 1.0 为不透明)
	 */
	initialize: function(target, opacity) {
		this.util = new MenuUtil();

		// 获取目标菜单 (没多余元素)
		this.obj = this.util.cleanWhitespace(target);
		// 定义透明度, 默认为不透明
		this.opacity = opacity || 1;

		// 获取菜单
		this.menu = this.obj.childNodes

		// 重要! 如果菜单不包含菜单项, 则不进行处理
		if (this.menu.length < 2) { return; }

		// 菜单标题和菜单体
		this.title = this.menu[0];
		this.body = this.menu[1];


		// 定义初始样式
		this.util.setStyle(this.body, 'visibility', 'hidden');
		this.util.setStyle(this.body, 'position', 'absolute');
		this.util.setStyle(this.body, 'overflow', 'hidden');
		this.util.setStyle(this.body, 'display', 'block');

		// 添加监听器
		this.addListener(this.obj, 'mouseover', this.util.bind(this, this.activate), false);
		this.addListener(this.obj, 'mouseout', this.util.bind(this, this.deactivate), false);
	},

	/**
	 * 激活方法
	 * 当鼠标移动到菜单标题是激活
	 */
	activate: function() {
		// 获取当�