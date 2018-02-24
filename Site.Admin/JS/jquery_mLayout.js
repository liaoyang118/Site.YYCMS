/// <reference path="jquery-1.10.2.js" />

/*
    页面布局JS
*/


//主体内容框 最小高度
var minH = 500;
//主体内容框 偏移量 left 
var offsetLeft = 170;
//主体内容框 偏移量 top
var offsetTop = 120;
//load路径
var loadingImg = "/Img/loading.gif";
//loading图片的宽度
var loadingW = 200;
//loading图片的高度
var loadingH = 13;

var mLayout = {
    //添加tab
    addTab: function (id, title, src) {
        if (this.hasTab(id)) {
            var tab = $("#tab_" + id);
            //选择tab
            this.showTabAndIframe(tab, id);
        }
        else {
            if (src.indexOf("?") == -1) {
                src += ("?name=iframe_" + id);
            }
            else {
                src += ("&name=iframe_" + id);
            }
            if (title.length > 10) {
                title = title.substring(0, 4) + "...";
            }
            var tab = $('<li  id="tab_' + id + '">&nbsp;<span>' + title + '</span>&nbsp;<a href="javascript:void(0);" class="tab_close" onclick="mLayout.CloseTabAndIframe(\'' + id + '\');"></a></li>');
            var tabIframe = $('<div id="iframe_div_' + id + '" style="width:100%;height:100%;"><iframe name="iframe_' + id + '" id="iframe_' + id + '"  src="' + src + '" style="border:none; width:100%;height:100%;overflow-y:scroll;background:#ffffff;"></iframe></div>');
            //添加tab
            $("#tab").append(tab);
            //添加Iframe
            $("#content").append(tabIframe);
            //添加遮罩
            this.addMask(id, tabIframe);

            //绑定移除遮罩
            $("#iframe_" + id).bind("load", function () {
                mLayout.removeMask(id);
            });
            //超时移除遮罩
            setTimeout(function () {
                mLayout.removeMask(id);
            }, 1000 * 15);
            //显示当前tab--Iframe
            this.showTabAndIframe(tab, id);

            //绑定点击事件
            tab.find("span").click(function () {
                mLayout.showTabAndIframe(tab, id);
            });
        }
    },
    //显示导航条和内容区
    showTabAndIframe: function (obj, id) {
        //显示tab
        $("#tab li").removeClass("tabna").removeClass("tab_cur");
        $(obj).addClass("tab_cur").siblings().addClass("tabna");
        //显示iframe
        $("#iframe_div_" + id).show().siblings().hide();
    },
    //关闭tab和Iframe
    CloseTabAndIframe: function (id) {

        var li = $("#tab_" + id);
        var iframe = $("#iframe_div_" + id);
        if (li.hasClass("tab_cur")) {
            if (li.prev("li").length > 0) {
                li.prev("li").show().attr("class", "tab_cur");
                iframe.prev("div").show();
                li.remove();
                iframe.remove();
            }
            else {
                li.next("li").show().attr("class", "tab_cur");
                iframe.next("div").show();
                li.remove();
                iframe.remove();
            }
        }
        else {
            li.remove();
            iframe.remove();
        }
    },
    //判断是否存在tab
    hasTab: function (id) {
        var tab = $("#tab_" + id);
        var iframe = $("#iframe_div_" + id);

        if (tab.length > 0 && iframe.length > 0) {
            return true;
        }
        else {
            return false;
        }
    },
    //添加遮罩
    addMask: function (id, obj) {
        //iframe_div 宽度和高度
        var H = $(obj).height();
        var W = $(obj).width();


        //30 导航条高度 8,6 边框线的宽度
        var maskDiv = $('<div id="mask_' + id + '" style="width:' + W + 'px;height:' + H + 'px;position: fixed;left: ' + (offsetLeft + 8) + 'px;top: ' + (offsetTop + 30 + 6) + 'px;"><img src="' + loadingImg + '" width="' + loadingW + '" height="' + loadingH + '" style="margin-top:' + ((H - loadingH) / 2) + 'px;margin-left:' + ((W - loadingW) / 2) + 'px" /></div>');

        $(obj).append(maskDiv);
    },
    //移除遮罩
    removeMask: function (id) {
        $("#mask_" + id).remove();
    }

}