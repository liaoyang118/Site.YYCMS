
/*
    旧的后台管理页面的layout,自适应，弹Iframe Tab【无效】
    
*/

//模态窗全局变量
var _title;
var _width;
var _height;
var _url;
var _left;
var _top;
var loadingImg = "/Img/loading1.jpg";
//当前窗口的宽高
var currentWindowHeight;
var currentWindowWidth;
//模态窗口数组
var winArr = new Array();

var myDialog = {
    modalWindowFormat: function (content) {
        return '<div id="modal" style="position:absolute;left:' + _left + 'px;top:' + _top + 'px;width:' + _width + 'px;height:' + _height + 'px;z-index:200;"><table id="modalTable" style="margin:0px;"><tr><td style="background:url(/Img/background1.png) no-repeat;width:10px;height:10px;"></td><td style="background:url(/Img/wh.png) repeat-x;width:' + (_width - 20) + 'px;height:10px;" class="move"></td><td style="background:url(/Img/background1.png) no-repeat;width:10px;height:10px; background-position:-15px 0px;"></td></tr><tr><td style="background:url(/Img/wh.png) repeat;width:10px;height:10px;"></td><td style="background:url(/Img/wh.png) repeat;width:' + (_width - 20) + 'px;height:16px;" class="move"><span>' + _title + '</span><div class="close" onclick="myDialog.RemoveModalWindow();"></div></td><td style="background:url(/Img/wh.png) repeat;width:10px;height:10px;"></td></tr><tr><td style="background:url(/Img/wh.png) repeat;width:10px;height:10px;"></td><td style="background:url(/Img/wh.png) repeat;width:' + (_width - 20) + 'px;height:10px;" class="move"></td><td style="background:url(/Img/wh.png) repeat;width:10px;height:10px;"></td></tr><tr><td style="background:url(/Img/wh.png) repeat-y;width:10px;height:' + (_height - 40) + 'px;"></td><td>' + content + '</td><td style="background:url(/Img/wh.png) repeat-y;width:10px;height:' + (_height - 40) + 'px;"></td></tr><tr><td style="background:url(/Img/background1.png) no-repeat;width:10px;height:10px;background-position:0px -15px;"></td><td style="background:url(/Img/wh.png) repeat-x;width:' + (_width - 20) + 'px;height:10px;"></td><td style="background:url(/Img/background1.png) no-repeat;width:10px;height:10px; background-position:-15px -15px;"></td></tr></table></div>'
    },
    //得到当前窗口高度--宽度
    GetCurrentWindowHAndW: function () {
        currentWindowHeight = $(window).height();
        currentWindowWidth = $(window).width();
    },
	//创建模态窗口
    CreateModalWindow: function (title, width, height, url) {
        var random = Math.random();

		if (this.hasModalWindow() == false) {
			_title = title;
			_width = width;
			_height = height;
			_url = url;
			this.GetCurrentWindowHAndW();
			_left = currentWindowWidth / 2 - width / 2;
		    _top = currentWindowHeight / 2 - height / 2;

		    //模态窗口  遮罩位置
			var _maskH= height - 38;
			var _maskW = width - 20;

		    //模态窗口  遮罩
			var _mask = $("<div id='mask_loading'></div>").css({
			    width: _maskW + "px",
			    height: _maskH + "px",
			    background: "#000",
			    opacity: "0.5",
			    top: "37px",
			    left: "10px",
			    position: "absolute"
			});


		    //模态窗口  遮罩loading
			var _maskLoadingTop = (height - 48) / 2 - 50;
			var _maskLoadingLeft = (width - 20) / 2 - 50;
			_mask.html("<div style='width:100px;height:100px;top:" + _maskLoadingTop + "px;left:" + _maskLoadingLeft + "px;position:relative;'><img src='" + loadingImg + "' /></div>");

            //填充内容
			var Iframe = '<iframe id="iframe_div' + '" src="' + _url + '" style="width:100%;height:100%;overflow-y:scroll;border:none;background:#fff;"></iframe>';

            //添加模态窗口
			var window = $(this.modalWindowFormat(Iframe));
			$("body").append(window);
		    //添加 模态窗口 遮罩
			this.addMask( _mask);

		    //绑定模态窗 加载完毕 关闭 loading
			this.bindLoad();

            //绑定模态窗 拖动
			this.BindMove();
		}
		else {
			return false;
		}
    },
    //移除 模态窗口
    RemoveModalWindow: function () {
        if (this.hasModalWindow())
        {
            $("#modal").remove();
        }
    },
	//绑定 模态窗口 拖动方法
	BindMove: function () {
		$("#modal").draggable({
			handle: ".move"
		});
	},
	//是否存在模态窗
	hasModalWindow: function () {
		if ($("#modal").length>0)
			return true;
		else
			return false;
	},
    //添加 模态窗口 遮罩
	addMask: function (obj) {
	    $("#iframe_div").parent().append(obj);
	},
    //移除 模态窗口 遮罩
	removeMask: function (id) {
	    $("#mask_loading").remove();
	},
    //绑定Iframe Load
	bindLoad: function () {
	    $("#iframe_div").bind("load", function () {
	        if ($("#mask_loading").length>0)
	        {
	            setTimeout(function () {
	                $("#mask_loading").remove();
	            }, 100);
	        }
	    });
	}
};