var timer = null;
var curIndex = 0, //当前index
    imgLen = $(".imgList li").length; //图片总数

// 定时器自动变换2.5秒每次
var autoChange = setInterval(function () {
    if (curIndex < imgLen - 1) {
        curIndex++;
    } else {
        curIndex = 0;
    }
    //调用变换处理函数
    changeTo(curIndex);
}, 4500);
//对左下角按钮index进行事件绑定处理等
$(".indexList").find("li").each(function (item) {
    $(this).hover(function () {
        clearInterval(autoChange);
        changeTo(item);
        curIndex = item;
    }, function () {
        autoChangeAgain();
    });
});

//清除定时器时候的重置定时器--封装
function autoChangeAgain() {
    autoChange = setInterval(function () {
        if (curIndex < imgLen - 1) {
            curIndex++;
        } else {
            curIndex = 0;
        }

        changeTo(curIndex); //调用变换处理函数
    }, 4500);
}

function changeTo(num) {
    var goLeft = num * 1430;
    $(".imgList").animate({left: "-" + goLeft + "px"}, 600);
    $(".infoList").find("li").removeClass("infoOn").eq(num).addClass("infoOn");
    $(".indexList").find("li").removeClass("indexOn").eq(num).addClass("indexOn");
}

$(function () {
    //banner轮播上悬浮框中点击tab切换
    $(".wrapper-left ul li").click(function () {
        var _index = $(this).index();
        $(".wrapper-left ul li").eq(_index).addClass("on").siblings().removeClass("on");
        $(".top-banner-con").hide().eq(_index).show();
        if (_index != 0) {
            _tips('很抱歉，功能还在建设中...', "1");
        }
    })


    //左边类型切换
    $(".bdc-type li").click(function () {
        $(".bdc-type li").removeClass("on");
        $(this).addClass("on");
        $(".type-con[style='display: block;']").hide();
        $("#" + $(this).prop("id") + $(".type-head .on").prop("id")).show();
        $(".pagination").hide();
    })

    //内容头部点击高亮
    $(".type-head ul li").click(function () {
        $(".type-head ul li").removeClass("on");
        $(this).addClass("on");
        $(".type-con[style='display: block;']").hide();
        $("#" + $(".bdc-type .on").prop("id") + $(this).prop("id")).show();
    })

    //鼠标移动具体分类上显示小提示框
    $(".type-con .row ul li ").hover(function () {
        if ($(this).find(".fl").attr("zt") == 1) {
        var arrowLeft = $(this).position().left;        //当前盒子离左边的距离
        /* alert(arrowLeft)*/
        var arrowTop = $(this).position().top + $(this).height() + 10;    //当前盒子离父级的top值
        $(".type-con .row ul li").removeClass("on");
        $(this).addClass("on");
        showTip("tipBox");    //显示小提示框
        lcdm = $(this).find(".lcdm").val();
        if (arrowLeft > 600) {           //如果鼠标移到最右边的盒子时，小提示框靠左一点显示。
            $(".tip-box .arrow").css("left", 300);
            $(".tip-box").css("left", arrowLeft - 200);
        } else {
            $(".tip-box .arrow").css("left", 100);
            $(".tip-box").css("left", arrowLeft);
        }
        $(".tip-box").css("top", arrowTop);
    }
    }, function () {
        $(".type-con .row ul li").removeClass("on");
        hideTip("tipBox");
    });

    //分页显示内容
    $(".pagination li").hover(function () {
        var _index = $(this).index();
        $(".pagination li").eq(_index).addClass("on").siblings().removeClass("on");
        $(".show-all").hide().eq(_index).fadeIn();
    }, function () {

    })
})

function showTip(objID) {        //显示小提示框
    var tipBox = document.getElementById(objID)
    clearInterval(timer);
    tipBox.style.display = 'block';
}

function hideTip(objID) {        //延时隐藏提示框，更好的体验
    timer = setTimeout(function () {
        var tipBox = document.getElementById(objID);
        tipBox.style.display = 'none';
    }, 500)
}
