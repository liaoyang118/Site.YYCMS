
/*
    旧的后台管理页面的layout,自适应，弹Iframe Tab【无效】
*/

//模态窗对象数组
var dialogArr = new Array();
//模态窗的mask 对象数组
var maskArr = new Array();

//保存模态窗中Iframe的地址，便于后面bind load方法
var iframeArr = new Array();
//模态窗中的 Iframe中的Loding遮罩 对象数组
var loadingArr = new Array();
//定时移除loading遮罩的定时器 ID
var timeOutId;

//当前窗口的高度--指触发函数按钮所在的Iframe
var curWinHeight;

//Iframe的最终宽高
var iframeW;
var iframeH;

//load路径
var loadingImg = "/Img/loading.gif";
//loading图片的宽度
var loadingW = 200;
//loading图片的高度
var loadingH = 13;


$(function () {
    mDialog.getWindowHeight();
})

var mDialog = {
    winHeight: null,
    winWidth: null,
    //模态窗模板
    dialogFormat: function (title, src) {
        return '<div class="modal">' +
        '<div class="title">' +
            '<div class="left"><span>' + title + '</span></div>' +
            '<div class="right"><a href="javascript:void(0);" class="close"></a></div>' +
        '</div>' +
        '<div class="main">' +
            '<iframe src="' + src + '" style="width:100%;height:100%;border:none;overflow-x:hidden;"></iframe>' +
        '</div>' +
    '</div>'
    },
    //得到当前页面和宽高
    getWindowHeight: function () {
        this.winHeight = $(window).height();
        this.winWidth = $(window).width();

        //初始化窗体高度
        curWinHeight = this.winHeight;
    },
    //绑定拖动方法
    bindDraggable: function () {
        $(".modal").draggable({
            handle: ".title"
        });
    },
    CreateDialog: function (title, src, width, height) {
        var id = this.makeRandom();
        if (src.indexOf("?") == -1) {
            src += "?window=" + id;
        }
        else {
            src += "&window=" + id;
        }
        this.getWindowHeight();
        var modalFormat = this.dialogFormat(title, src);
        var modalObj = $(modalFormat);
        if (width && height) {
            modalObj.css({
                width: width + "px",
                height: height + "px"
            });

            //指定Iframe 容器的高度 和 高度；用于限定内嵌Iframe 的位置
            modalObj.find(".main").css({
                height: (height - 32 - 10) + "px",//10 -- 边界宽度；32 -- title高度
                width: (width - 20) + "px"
            });
            var _top = (this.winHeight - height) / 2;
            var _left = (this.winWidth - width) / 2;
            //设定居中
            modalObj.css({
                top: _top + "px",
                left: _left + "px"
            });
        }
        else {
            throw "必须设置宽高";
        }
       
        //设置模态窗 id
        modalObj.attr("id", "dialog_" + id);

       
        var iframe = modalObj.find(".main Iframe");
        //设置Iframe ID
        iframe.attr("id", "iframe_" + id);
        //将Iframe 放入数组
        iframeArr[id] = iframe;

        //将模态窗 地址引用放入数组保存
        dialogArr[id] = modalObj;

        //绑定关闭方法
        modalObj.find(".close").bind("click", function () {
            mDialog.closeModalWindow(id);
        });

        //为模态窗添加Loading遮罩  //此处顺序一定要注意
        this.addLoadingMask(id);
        //将模态窗添加到主Iframe中
        $("body").append(modalObj);
        this.bindDraggable();
        this.addMask(id);

        //Iframe绑定 移除Loadin遮罩
        iframeArr[id].bind("load", function () {
            mDialog.removeLoadingMask(id);
        });
        //超时移除 Loadin遮罩
        timeOutId= setTimeout(function () {
            mDialog.removeLoadingMask(id);
        }, 1000 * 15);

        //绑定resize
        $(parent.window).resize(function () {
            
            setTimeout(function () {
                mDialog.getWindowHeight();
                mDialog.ResizeMaskandDialog(mDialog.winWidth, mDialog.winHeight,id,width,height);
            }, 250);
        });

    },
    //增加 点击层 遮罩
    addMask: function (id) {
        var mask = $('<div id="mask_' + id + '"></div>');
        this.getWindowHeight();
        mask.css({
            "position": "absolute",
            top: "0px",
            left: "0px",
            background: "#000000",
            width: this.winWidth + "px",
            height: this.winHeight + "px",
            opacity: "0.3"
        });
        //将mask 地址引用放入数组保存
        maskArr[id] = mask;
        $("body").append(mask);
    },
    //增加模态窗层 Loading 遮罩
    addLoadingMask: function (id) {
        //模态窗
        var mObj = dialogArr[id];
        iframeH = $(mObj).find(".main").height();
        iframeW = $(mObj).find(".main").width();

        //10 -- 边界宽度；32 -- title高度
        var maskDiv = $('<div id="LoadingMask_' + id + '" style="width:' + iframeW + 'px;height:' + iframeH + 'px;position: absolute;left:  10px;top: 32px;"><img src="' + loadingImg + '" width="' + loadingW + '" height="' + loadingH + '" style="margin-top:' + ((iframeH - loadingH) / 2) + 'px;margin-left:' + ((iframeW - loadingW) / 2) + 'px" /></div>');

        $(mObj).find(".main").append(maskDiv);

        //添加loading 遮罩对象到 数组中
        loadingArr[id] = maskDiv;
    },
    //生成随机数
    makeRandom: function () {
        return parseFloat(Math.random()) * 10;
    },
    //关闭模态窗 根据id为索引
    closeModalWindow: function (id) {
        //移除模态窗
        dialogArr[id].remove();
        //移除对应的Mask
        maskArr[id].remove();

        //移除数组元素
        delete dialogArr[id];
        delete maskArr[id];
    },
    //移除 Loading遮罩
    removeLoadingMask: function (id) {
        loadingArr[id].remove();
        //清除定时器
        clearTimeout(timeOutId);

        //删除数组元素
        //delete loadingArr[id];
    },
    //关闭模态窗
    closeDialog: function (id) {
        mDialog.closeModalWindow(id);
    },
    //resize点击层遮罩和模态窗的位置
    ResizeMaskandDialog: function (w, h,id,dialogW,dialogH) {
        //点击层遮罩
        maskArr[id].css({
            width: w + "px",
            height: h + "px"
        });
        var _top = (h - dialogH) / 2;
        var _left = (w - dialogW) / 2;
        //设定居中
        dialogArr[id].css({
            top: _top + "px",
            left: _left + "px"
        });
    }
};
