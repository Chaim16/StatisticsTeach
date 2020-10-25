$(document).ready(function() {
    // 宽度
    $(window).resize(function () {
        var height = $("#navwrap").width();
        if (height <= 200) {
            $("#informationwarp").css({ left: "200px" });
        } else {
            $("#informationwarp").css({ left: "20%" });
        }
    });
});


var createXMLHttpRequest = function() {
    try {
        return new XMLHttpRequest()
    }catch (e){
        try {
            return ActiveXObject("Msxml2.XMLHttp")
        }catch (e){
            try {
                return ActiveXObject("Microsoft.XMLHttp")
            }catch (e){
                alert("浏览器不支持……")
                return e
            }
        }
    }
}

window.onload = function (){
    // 获取界面元素
    var xqnd = document.getElementById("selectYear");
    // 失焦执行
    xqnd.onblur = function (){
        // 第一步：创建对象
        var xmlHttp = createXMLHttpRequest();
        // 第二步：打开连接
        xmlHttp.open("POST", "/selectBasisInfoByYear", true)
        // 设置请求头
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        // 第三步：发送信息
        xmlHttp.send("xqnd=" + xqnd.value)
        // 第四步：给xmlHttp的onreadystatechange事件注册监听
        xmlHttp.onreadystatechange = function (){
            window.location.reload(true);
        }
    }

}
