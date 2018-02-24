/// <reference path="jquery-1.10.2.js" />
/// <reference path="../Dialog/jquery.artDialog.source.js" />
/// <reference path="../Dialog/plugins/iframeTools.source.js" />

/*
    页面UI，弹窗
*/

//模态窗对象数组
var dialogArr = new Array();
var currentDialog;
//当前窗体高度
var currentWHeight;

//提交数据loading图片
var loadingImg = "/Img/loading.gif";
//loading窗
var mask = null;

var mDialogUI = {
    //打开窗口
    openWindow: function (url, title, width, height, isModal, callback) {
        var num = Math.random();
        if (url.indexOf("?") != -1) {
            url += ("&window=" + num);
        }
        else {
            url += ("?window=" + num);
        }
        currentDialog = $.dialog.open(url, {
            title: title,
            width: width + "px",
            height: height + "px",
            lock: isModal
        });
        dialogArr[num] = currentDialog;
    },
    //关闭窗口
    closeWindow: function (dialogNum) {
        dialogArr[dialogNum].close();
    },
    //提示错误信息
    errorMessage: function (message, title, width, height, delayClose) {
        $.dialog({
            content: message,
            title: title,
            width: width,
            height: height,
            icon: "error",
            lock: false,
            time: delayClose
        });
    },
    //提示信息
    message: function (message, title, width, height, delayClose) {
        $.dialog({
            content: message,
            title: title,
            width: width,
            height: height,
            icon: "warning",
            lock: false,
            time: delayClose
        });
    },
    //提示成功信息
    successMessage: function (message, title, width, height, delayClose) {
        $.dialog({
            content: message,
            title: title,
            width: width,
            height: height,
            icon: "succeed",
            lock: false,
            time: delayClose
        });
    },
    //确认信息
    confirm: function (title, content, callback) {
        $.dialog({
            title: title,
            content: content,
            icon: "question",
            button: [
                {
                    name: "确定",
                    callback: function () {
                        callback();
                    },
                    focus: true
                },
                {
                    name: "取消"
                }
            ]
        });
    },
    //审核信息
    //buttons 数组 ["通过","未审核","取消"]
    //callback function(result){}
    checkInfo: function (title, content, buttons, callback) {
        if (!$.isArray(buttons)) {
            throw "必须有button数组";
            return false;
        }
        else {
            var btnObjArr = [];

            if ($.inArray("取消", buttons) == -1) {
                buttons.push("取消");
            }
            for (var i = 0; i < buttons.length; i++) {
                var btnObj = {};
                btnObj.name = buttons[i];
                if (buttons[i] != "取消") {
                    btnObj.callback = (function (name) {
                        return function () {
                            callback(name);
                        }
                    })(btnObj.name);//自执行,返回一个函数
                    //自定义样式
                    btnObj.className = "aui_btn_check";
                }
                if (buttons[i] == "取消") {
                    btnObj.focus = true;
                }
                btnObjArr.push(btnObj);
            }
            $.dialog({
                title: title,
                content: content,
                icon: "question",
                button: btnObjArr
            });
        }

    },
    //loading
    loading: function (loadingMessage) {
        var msg;
        if (loadingMessage) {
            msg = loadingMessage + "...";
        }
        else {
            msg = "Loading..."
        }
        var html = '<div t="mask" style="width: 100%; height: 100%; position: fixed; z-index: 19900; top: 0px; left: 0px; overflow: hidden;"><div style="height: 100%;"><div style="width:190px;border: 2px solid #5A5F63;padding: 50px 20px;border-radius: 10px;background: rgba(233, 235, 236, 0.67);margin:' + (currentWHeight - 14) / 2 + 'px auto;"><div style="text-align: center;"><span>' + msg + '</span></div><img src=' + loadingImg + ' /></div></div></div>';
        mask = $(html);
        $("body").append(mask);
        //超时删除
        setTimeout(function () {
            if (mask != undefined && mask != null) {
                mask.remove();
            }
        }, 15000)
    },
    //closeLoading
    closeLoading: function () {
        if (mask == undefined || mask == null) {
            mask = $("body").find("div[t='mask']");
        }
        mask.remove();
        mask = null;
    }
};

//全局变量
(function (config) {
    config['lock'] = true;
    config['fixed'] = true;
    config['okVal'] = '确定';
    config['cancelVal'] = "取消";
    // [more..]
    currentWHeight = $(window).height();
})(art.dialog.defaults);

//扩展jquery ajax 表单异步上传文件 --yang.liao 没有和ajax 做合并
(function ($) {
    $.extend({
        //自定义扩展异步表单上传图片，限制返回Json,可以不用指定表单属性
        //fromeId:表单ID, url:提交地址, type：post/get, success:回调函数
        ajaxFile: function (fromeId, url, type, success) {
            //创建一个隐藏的Iframe
            var _iframe = $('<iframe style="display:none;" name="ajaxIframe" id="ajaxIframe"></iframe>');

            //添加到页面上
            $("body").append(_iframe);
            //将表单放到 隐藏的Iframe 里面提交
            var _from = $("#" + fromeId);
            _from.attr("enctype", "multipart/form-data");
            _from.attr("action", url);
            _from.attr("method", type);
            _from.attr("target", "ajaxIframe");
            //提交表单
            _from.submit();

            //加载完Iframe后在 load 事件中获取返回值
            var xml = {}, io = _iframe.get(0);
            var json = "";
            if (window.attachEvent) {
                io.attachEvent('onload', function () {
                    json = getJson(xml, "ajaxIframe");
                    success(json);
                });//IE
            }
            else {
                io.addEventListener('load', function () {
                    json = getJson(xml, "ajaxIframe");
                    success(json);
                }, false);//非IE
            }

            //注意：iframe,获取内容，用原生JS 
            function getJson(xml, iframeId) {
                var io2 = $("#" + iframeId).get(0);
                if (io2.contentWindow) {
                    xml.responseText = io2.contentWindow.document.body ? io2.contentWindow.document.body.innerHTML : null;
                    xml.responseXML = io2.contentWindow.document.XMLDocument ? io2.contentWindow.document.XMLDocument : io2.contentWindow.document;

                } else if (io2.contentDocument) {
                    xml.responseText = io2.contentDocument.document.body ? io2.contentDocument.document.body.innerHTML : null;
                    xml.responseXML = io2.contentDocument.document.XMLDocument ? io2.contentDocument.document.XMLDocument : io2.contentDocument.document;
                }

                var data = xml.responseText;
                var json = eval("(" + $(data).text() + ")");
                return json;
            };

        }
        ////formData
        //ajaxFormData: function (options) {
        //    if (options.formId) {
        //        var formdata = new FormData($("#" + options.formId));
        //        options.data = formdata;
        //    }
        //    else {
        //        throw "请指定表单ID 参数formId";
        //        return false;
        //    }
        //    var _option = $.extend({}, $.ajaxSettings, options);
        //    $.ajax(_option);
        //}
    });
})(jQuery)