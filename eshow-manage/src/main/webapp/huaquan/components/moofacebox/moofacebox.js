/*
 * mooFacebox
 * version: 0.1 (03/10/2008)
 * @requires MooTools v1.2 or later
 *
 * Facebox is a port to mootools of the original 
 * Facebox (http://famspam.com/facebox) written by Chris Wanstrath with some 
 * added features like drag support and titles.
 *
 * Licensed under the MIT:
 *
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright 2007, 2008 Chris Wanstrath [ chris@ozmm.org ]
 * Copyright 2008 Augusto Becciu [ augusto@becciu.org ]
 *
 * Usage:
 *  
 *  window.addEvent('domready', function() {
 *      var myFacebox = new mooFacebox();
 *  });
 *
 *
 *  <a href="#terms" rel="facebox">Terms</a>
 *    Loads the #terms div in the box
 *
 *  <a href="terms.html" rel="facebox">Terms</a>
 *    Loads the terms.html page in the box
 *
 *  <a href="terms.png" rel="facebox">Terms</a>
 *    Loads the terms.png image in the box
 *
 */


var mooFacebox = new Class({

    Implements: Options,

    options: {
        draggable: true,
        elementsSelector: 'a[rel="facebox"]',
        loading_image : 'images/loading.gif',
        close_image   : 'images/closelabel.gif',
        image_types   : [ 'png', 'jpg', 'jpeg', 'gif' ],
        facebox_html  : '\
    <div class="popup"> \
      <table> \
        <tbody> \
          <tr> \
            <td class="tl"/><td class="b"/><td class="tr"/> \
          </tr> \
          <tr> \
            <td class="b"/> \
            <td class="dialog-content"> \
              <h2 class="title"> \
                <span></span> \
              </h2> \
              <div class="body"> \
                <div class="content"> \
                </div> \
                <div class="footer"> \
                  <a href="#" class="close"> \
                    <img src="images/closelabel.gif" title="close" class="close_image" /> \
                  </a> \
                </div> \
              </div> \
            </td> \
            <td class="b"/> \
          </tr> \
          <tr> \
            <td class="bl"/><td class="b"/><td class="br"/> \
          </tr> \
        </tbody> \
      </table> \
    </div>'
    },

    loading: function() {
        if (this.faceboxEl.getElement('.loading')) return true;

        this.faceboxEl.getElement('.content').empty();

        var bodyEl = this.faceboxEl.getElement('.body');
        bodyEl.getChildren().setStyle('display', 'none');
        
        var loadingEl = new Element('div', {'class': 'loading'});
        var loadingImgEl = new Element('img', {'src': this.options.loading_image});
        loadingEl.adopt(loadingImgEl);

        bodyEl.adopt(loadingEl);

        var pageScroll = this.getPageScroll();
        this.faceboxEl.setStyles({
            top: pageScroll[1] + (this.getPageHeight() / 4),
            left: pageScroll[0]
        });

        $(document).addEvent('keydown', this.keydownHdlr);

        this.fadeIn(this.faceboxEl);
    },

    reveal: function(data, klass) {
        if (klass) this.faceboxEl.getElement('.content').addClass(klass);

        if ($type(data) == 'string')
            this.faceboxEl.getElement('.content').set('html', data);
        else
            this.faceboxEl.getElement('.content').adopt(data);

        this.faceboxEl.getElement('.loading').destroy();
        this.faceboxEl.getElement('.body').getChildren().each(this.fadeIn);
    },

    fadeIn: function(el) {
        el.set('tween', {
            onStart: function() {
                el.setStyle('display', 'block');
            }
        });
        el.fade('in');
    },

    fadeOut: function(el) {
        el.set('tween', {
            onComplete: function() {
                el.setStyle('display', 'none');
            }
        });
        el.fade('out');
    },

    close: function() {
        $(document).removeEvent('keydown', this.keydownHdlr);

        this.fadeOut(this.faceboxEl);
        var contentEl = this.faceboxEl.getElement('.content');
        contentEl.set('class', '');
        contentEl.addClass('content');
        return false;
    },

    setTitle: function(title) {
        var titleEl = this.faceboxEl.getElement('.title');
        if (title == "")
            titleEl.setStyle('display', 'none');
        else
            titleEl.setStyle('display', 'block');

        titleEl.getElement('span').set('text', title);
    },

    initialize: function(options) {
        this.setOptions(options);

        this.faceboxEl = new Element('div', {'id': 'facebox', 'style': 'display: none;'});
        this.faceboxEl.fade('hide');
        this.faceboxEl.set('html', this.options.facebox_html);

        $(document.body).adopt(this.faceboxEl);

        // preload images
        var preload = [ new Asset.image(this.options.close_image),
                        new Asset.image(this.options.loading_image) ];

        this.faceboxEl.getElements('.b:first, .bl, .br, .tl, .tr').each(function(el) {
            preload.push(new Asset.image(el.getStyle('background-image').replace(/url\((.+)\)/, '$1')));
        });

        this.faceboxEl.getElement('.close').addEvent('click', this.close.bind(this));
        this.faceboxEl.getElement('.close_image').set('src', this.options.close_image);

        if (this.options.draggable == true) {
            var dcontentEl = this.faceboxEl.getElement('.dialog-content');
            this.drag = this.faceboxEl.makeDraggable({handle: dcontentEl});
            dcontentEl.setStyle('cursor', 'move');
        }

        this.keydownHdlr = function(e) {
            e = new Event(e);
            e.stop();

            if (e.code == 27) this.close();
        }.bind(this);

        var image_types = this.options.image_types.join('|');
        image_types = new RegExp('\.' + image_types + '$', 'i');

        var elements = $$(this.options.elementsSelector);

        elements.addEvent('click', function(e) {
            e = new Event(e);
            e.stop();

            this.setTitle(e.target.title);

            this.loading();

            // support for rel="facebox[.inline_popup]" syntax, to add a class
            var klass = e.target.rel.match(/facebox\[\.(\w+)\]/);
            if (klass) klass = klass[1];

            // div
            if (e.target.href.match(/#/)) {
                var url = window.location.href.split('#')[0];
                var target = e.target.href.replace(url+'#','');
                this.reveal($(target).clone().setStyle('display','block'), klass);

            // image
            } else if (e.target.href.match(image_types)) {
                var image = new Asset.image(e.target.href, {
                    onload: function() {
                        this.reveal('<div class="image"><img src="' + image.src + '" /></div>', klass);
                    }.bind(this)
                });

            // ajax
            } else {
                new Request({
                    url: e.target.href,
                    method: 'get',
                    onSuccess: function(responseText, responseXML) {
                        this.reveal(responseText, klass);
                    }.bind(this)
                }).send();
            }

            return false;
        }.bind(this));

    },

    // getPageScroll() by quirksmode.com
    getPageScroll: function() {
        var xScroll, yScroll;
        if (self.pageYOffset) {
            yScroll = self.pageYOffset;
            xScroll = self.pageXOffset;
        } else if (document.documentElement && document.documentElement.scrollTop) { // Explorer 6 Strict
            yScroll = document.documentElement.scrollTop;
            xScroll = document.documentElement.scrollLeft;
        } else if (document.body) {// all other Explorers
            yScroll = document.body.scrollTop;
            xScroll = document.body.scrollLeft;	
        }

        return new Array(xScroll,yScroll);
    },

    // adapter from getPageSize() by quirksmode.com
    getPageHeight: function() {
        var windowHeight;
        if (self.innerHeight) {	// all except Explorer
            windowHeight = self.innerHeight;
        } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
            windowHeight = document.documentElement.clientHeight;
        } else if (document.body) { // other Explorers
            windowHeight = document.body.clientHeight;
        }

        return windowHeight;
    }

});

