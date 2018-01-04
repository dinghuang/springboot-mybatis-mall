<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>电子商务首页</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<link rel="stylesheet" href="<%=path%>/css/recommend/cn.css"
      type="text/css" media="screen, project, print" />
<script type="text/javascript" src="<%=path%>/js/recommend/jquery.js"></script>
<link rel="stylesheet" href="<%=path%>/css/selling/ec.css"
      type="text/css" />
<link rel="stylesheet" href="<%=path%>/css/selling/index.css"
      type="text/css" />

<body>
<jsp:include page="top.jsp"></jsp:include>
<div id="slide-index">
    <div class="slides" style="width: 1000px; margin-left: 0px; ">

        <c:forEach items="${rollingList}" var="rollingBean">
            <div class="slide autoMaxWidth" style="width: 1000px; ">
                <div class="image" id="bi_${rollingBean.rid }">
                    <a href="<%=path%>/mcItemServletUrl?mid=${rollingBean.mid}"
                       target="_top"> <img name="banner0"
                                           src="<%=path%>/images/recommend_images/${rollingBean.rimg }"
                                           style="left: 0px; position: relative; " /></a>
                </div>
                <div class="text" id="bt_${rollingBean.rid }"
                     style="left: 204.5px; top: 46px; "></div>
                <div class="button" id="bb_${rollingBean.rid }"
                     style="left: 207.5px; top: 265px; width: 138px; display: block; "></div>
            </div>
        </c:forEach>
    </div>
    <div class="control">
        <a href="" class="active"></a> <a href="" class=""></a> <a href=""
                                                                   class=""></a> <a href="" class=""></a> <a href="" class=""></a>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        indexSlides.ini();
        latestNews.ini();
        featurePopup.ini();

        for (var i = 0; i < 5; i++) {
            //var bImgSrc=$('#bi_'+i).find("img").attr("src");
            //var bTextSrc=$('#bt_'+i).find("img").attr("src");
            //var bButtonSrc=$('#bb_'+i).find("img").attr("src");
            //alert(imgSrc);
            $('#bt_' + i).find("img").addClass("IE6png");
            $('#bb_' + i).find("img").addClass("IE6png");
            //$("img[src$='.png']").addClass("IE6png");
        }

    });

    var indexSlides = {};

    indexSlides.timer = false;
    indexSlides.total = $('#slide-index .control a').length;
    indexSlides.current = -1;
    indexSlides.offScreenLeft = 2000;
    indexSlides.leaveScreenLeft = 4000;
    indexSlides.animating = false;

    indexSlides.obj = $('#slide-index .slide');

    indexSlides.style = [];
    indexSlides.style[0] = {
        text : {
            left : '30px',
            top : '46px'
        },
        button : {
            left : '33px',
            top : '265px'
        },
        direction : 'lr'
    };
    indexSlides.style[1] = {
        text : {
            left : '30px',
            top : '81px'
        },
        button : {
            left : '30px',
            top : '244px'
        },
        direction : 'tb'
    };
    indexSlides.style[2] = {
        text : {
            left : '56px',
            top : '86px'
        },
        button : {
            left : '363px',
            top : '282px'
        },
        direction : 'tb'
    };

    indexSlides.style[3] = {
        text : {
            left : '56px',
            top : '86px'
        },
        button : {
            left : '363px',
            top : '282px'
        },
        direction : 'tb'
    };
    indexSlides.style[4] = {
        text : {
            left : '56px',
            top : '86px'
        },
        button : {
            left : '363px',
            top : '282px'
        },
        direction : 'lr'
    };
</script>
<script type="text/javascript" src="<%=path%>/js/recommend/cn.index.js"></script>
<div>&nbsp;</div>
<div>&nbsp;</div>


<div class="layout">
    <div class="channel-floor">
        <div class="h">
            <h2>
                <a title="热卖" target="_blank">热卖</a>
            </h2>
        </div>

        <div class="b">
            <ul class="channel-pro-list">
                <c:forEach items="${mcSellingList}" var="mcSellingBean" begin="0" end="0">
                    <li id="channel-pro-1-1"
                        class="channel-pro-item channel-pro-rec-item">
                        <div class="channel-pro-panels">
                            <div class="pro-info">
                                <div class="p-img">
                                    <a href="<%=path%>/mcItemServletUrl?mid=${mcSellingBean.mid}"
                                       target="_top" rel="nofollow"> <img
                                            src="<%=path%>/images/mc_images/${mcSellingBean.mimg}"
                                            style="width: 180px" alt="" />
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="<%=path%>/mcItemServletUrl?mid=${mcSellingBean.mid}"
                                       target="_top"> ${mcSellingBean.mname}</a>
                                </div>
                                <div class="p-shining">
                                    <div class="p-slogan">${mcSellingBean.mdescription}</div>
                                    <div class="p-promotions">火爆热销中，8月6日20:00，限时抢购!</div>
                                </div>
                                <div class="p-price">
                                    <em>￥</em><span>${mcSellingBean.mprice}</span>
                                </div>
                                <div class="p-button">
                                    <a href="<%=path%>/mcItemServletUrl?mid=${mcSellingBean.mid}"
                                       target="_top" class="channel-button" title="立即抢购">立即抢购</a>
                                </div>
                                <i class="p-tag"><img
                                        src="<%=path%>/images/selling_images/1382542488099.png"
                                        style="" /></i>

                            </div>
                        </div>
                    </li>
                </c:forEach>
                <c:forEach items="${mcSellingList}" var="mcSellingBean" begin="1"
                           varStatus="vs">
                    <li id="channel-pro-1-${vs }" class="channel-pro-item">
                        <div class="channel-pro-panels">
                            <div class="pro-info">
                                <div class="p-img">
                                    <a href="<%=path%>/mcItemServletUrl?mid=${mcSellingBean.mid}"
                                       target="_top" rel="nofollow"> <img
                                            src="<%=path%>/images/mc_images/${mcSellingBean.mimg}"
                                            style="" alt="" />
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="<%=path%>/mcItemServletUrl?mid=${mcSellingBean.mid}"
                                       target="_top"> ${mcSellingBean.mname}
                                            <%-- <span class="p-slogan"> ${mcSellingBean.mdescription}</span> --%>

                                    </a>
                                </div>
                                <div class="p-price">
                                    <em>￥</em><span> ${mcSellingBean.mprice}</span>
                                </div>
                                <i class="p-tag"><img
                                        src="<%=path%>/images/selling_images/1382542488099.png"
                                        style="" /></i>
                            </div>
                        </div>
                    </li>

                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
