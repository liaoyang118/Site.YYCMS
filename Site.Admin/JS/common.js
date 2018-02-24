/*
    此JS针对后台管理页面的layout,自适应，弹Iframe Tab
*/

var loadingImg = "/Img/loading1.jpg";

//格式化日期
function JsonDataFormat(str) {
    var millisecond = str.substring(6, str.length - 2);
    var jsonDate = new Date(parseInt(millisecond));

    Date.prototype.format = function (format) {
        var o =
        {
            "M+": this.getMonth() + 1, //month
            "d+": this.getDate(),    //day
            "h+": this.getHours(),   //hour
            "m+": this.getMinutes(), //minute
            "s+": this.getSeconds(), //second
            "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
            "S": this.getMilliseconds() //millisecond
        }
        if (/(y+)/.test(format))
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    }
   return jsonDate.format("yyyy-mm-dd");
}

//设置各容器的宽高,确保自适应
function SetHW() {
    $(".tabs-wrap").css({ width: "100%" });
    $("#contentTab .panel").css({ width: "100%", height: "100%" });
    $("#contentTab .panel-body.panel-body-noheader.panel-body-noborder").css({ width: "100%", height: "100%" });
    $("#contentTab .tabs-panels.tabs-panels-noborder").css({ width: "100%", height: "100%" });
}

var dialogArr = new Array();

//创建模态窗口 标题，url，宽度，高度，是否缓存，是否是模态窗口
function CreateIframe(title, url, width, height, cache, modal)
{
    var random = Math.random();
    url=url+"?window="+random;
    var div = "<div id='iframe_div'><iframe src='" + url + "' style='overflow-y:scroll;width:99%;height:99%; display:block;border:none;' ></iframe></div>";
    dialogArr[random] = div;

    if ($("#iframe_div").length == 0) {
        $("body").append(div);
    }
    $("#iframe_div").dialog({
        title: title,
        width: width,
        height: height,
        closed: false,
        cache: cache,
        modal: modal
    });
}

//关闭窗口
function CloseIframeDialog(random)
{
    if (dialogArr[random])
    {
        dialogArr[random].dialog("close");
    }
}



//载入遮罩
function ShowIframeMask(id)
{
    var Iframe = $("#ifr_" + id);
    var _height = Iframe.height();
    var _width = Iframe.width();
    var _top = Iframe.offset().top;
    var _left = Iframe.offset().left;

    var mask_div = $("<div id='mask_"+id+"'></div>").css({
        position: "absolute",
        "z-index": 100,
        width: _width,
        height: _height,
        top: _top,
        left: _left,
        opacity: "0.5",
        background:"#000"
    });
    var img_top = (_height / 2) - 50;
    var img_left = (_width / 2) - 50;
    mask_div.append('<div id="loading_div" style="z-index:101;position:relative;top:' + img_top + 'px;left:' + img_left + 'px;"><img src="'+loadingImg+'" alt="loading" /></div>');
   
    $("body").append(mask_div);
   
    //iframe 载入后移除
    Iframe.bind("load", setTimeout(function () {
        RemoveMask(id);
    }, 200))
    
    //如果15s 后还没有加载出Iframe,移除遮罩
    setTimeout(function () {
        RemoveMask(id);
    }, 15000);
}

//删除遮罩
function RemoveMask(id)
{
    $("#mask_" + id).remove();
}

//窗口变化时，改变遮罩的大小
function ResizeMask(id)
{
    var iframe = $("#ifr_" + id);
    if (iframe) {
        var _height = iframe.height();
        var _width = iframe.width();
        var _top = iframe.offset().top;
        var _left = iframe.offset().left;

        $("#mask_" + id).css({
            width: _width+"px",
            height: _height+"px",
            top: _top+"px",
            left: _left+"px"
        });

        //调整遮罩尺寸
        var loding_img = $("#loading_div");
        if (loding_img) {
            loding_img.css({
                top: (_height / 2) - 50+"px",
                left: (_width / 2) - 50+"px"
            });
        }
    }
}
