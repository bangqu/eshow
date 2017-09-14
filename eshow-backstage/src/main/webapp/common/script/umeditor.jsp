<script type="text/javascript" charset="utf-8" src="${ctx}/umeditor/third-party/template.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="${ctx}/umeditor/lang/zh-cn/zh-cn.js"></script>
<link href="${ctx}/umeditor/themes/default/css/umeditor.min.css" type="text/css" rel="stylesheet">

<script type="application/javascript">
    function getUMEditor(_textareaId) {
        var ue = UM.getEditor(_textareaId, {
            toolbar: [
                ' bold italic underline strikethrough forecolor ',
                'insertorderedlist insertunorderedlist | link unlink emotion image insertvideo',
                '| justifyleft justifycenter justifyright justifyjustify |paragraph  fontsize'
            ],
            lang: /^zh/.test(navigator.language || navigator.browserLanguage || navigator.userLanguage) ? 'zh-cn' : 'en',
            langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
            imagePath: "",
            focus: true,
            initialFrameWidth: 563,
            initialFrameHeight: 600,
            filterRules: function () {
                return {
                    span: function (node) {
                        if (/Wingdings|Symbol/.test(node.getStyle('font-family'))) {
                            return true;
                        } else {
                            node.parentNode.removeChild(node, true)
                        }
                    },
                    p: function (node) {
                        var listTag;
                        if (node.getAttr('class') == 'MsoListParagraph') {
                            listTag = 'MsoListParagraph'
                        }
                        node.setAttr();
                        if (listTag) {
                            node.setAttr('class', 'MsoListParagraph')
                        }
                        if (!node.firstChild()) {
                            node.innerHTML(UM.browser.ie ? '&nbsp;' : '<br>')
                        }
                    },
                    div: function (node) {
                        var tmpNode, p = UM.uNode.createElement('p');
                        while (tmpNode = node.firstChild()) {
                            if (tmpNode.type == 'text' || !UM.dom.dtd.$block[tmpNode.tagName]) {
                                p.appendChild(tmpNode);
                            } else {
                                if (p.firstChild()) {
                                    node.parentNode.insertBefore(p, node);
                                    p = UM.uNode.createElement('p');
                                } else {
                                    node.parentNode.insertBefore(tmpNode, node);
                                }
                            }
                        }
                        if (p.firstChild()) {
                            node.parentNode.insertBefore(p, node);
                        }
                        node.parentNode.removeChild(node);
                    },
                    //$:{}表示不保留任何属性
                    br: {$: {}},
                    ol: {$: {}},
                    ul: {$: {}},

                    dl: function (node) {
                        node.tagName = 'ul';
                        node.setAttr()
                    },
                    dt: function (node) {
                        node.tagName = 'li';
                        node.setAttr()
                    },
                    dd: function (node) {
                        node.tagName = 'li';
                        node.setAttr()
                    },
                    li: function (node) {

                        var className = node.getAttr('class');
                        if (!className || !/list\-/.test(className)) {
                            node.setAttr()
                        }
                        var tmpNodes = node.getNodesByTagName('ol ul');
                        UM.utils.each(tmpNodes, function (n) {
                            node.parentNode.insertAfter(n, node);

                        })

                    },
                    table: function (node) {
                        UM.utils.each(node.getNodesByTagName('table'), function (t) {
                            UM.utils.each(t.getNodesByTagName('tr'), function (tr) {
                                var p = UM.uNode.createElement('p'), child, html = [];
                                while (child = tr.firstChild()) {
                                    html.push(child.innerHTML());
                                    tr.removeChild(child);
                                }
                                p.innerHTML(html.join('&nbsp;&nbsp;'));
                                t.parentNode.insertBefore(p, t);
                            })
                            t.parentNode.removeChild(t)
                        });
                        var val = node.getAttr('width');
                        node.setAttr();
                        if (val) {
                            node.setAttr('width', val);
                        }
                    },
                    tbody: {$: {}},
                    caption: {$: {}},
                    th: {$: {}},
                    td: {$: {valign: 1, align: 1, rowspan: 1, colspan: 1, width: 1, height: 1}},
                    tr: {$: {}},
                    h3: {$: {}},
                    h2: {$: {}},
                    //黑名单，以下标签及其子节点都会被过滤掉
                    '-': 'script style meta iframe embed object'
                }
            }()
        });
    }
</script>