<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/header.jsp"%>


<!-- 图片轮播 -->
<div class="carousel slide" id="carousel-210314" data-ride="carousel"
	data-interval="2000">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li class="active" data-slide-to="0" data-target="#carousel-210314">
		</li>
		<li data-slide-to="1" data-target="#carousel-210314"></li>
		<li data-slide-to="2" data-target="#carousel-210314"></li>
	</ol>
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img alt=""
				src="${pageContext.request.contextPath}/images/adver/ad5.jpg" />

		</div>
		<div class="item">
			<img alt=""
				src="${pageContext.request.contextPath}/images/adver/1.jpg" />

		</div>
		<div class="item">
			<img alt=""
				src="${pageContext.request.contextPath}/images/adver/ad7.jpg" />
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#carousel-210314"
		data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	<a class="right carousel-control" href="#carousel-210314"
		data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
</div>

<!-- 今日推荐 -->
<div class="row clearfix">

	<div class="col-md-2 column ">
		<div class="thumbnail today-style">
			<div class="caption">
				<h3>今日推荐</h3>
			</div>
			<img src="${pageContext.request.contextPath}/images/goods/2016.png" />
		</div>
	</div>
	

	<c:forEach items="${todaylist}" var="t" varStatus="vs">
		<c:if test="${vs.count<=5}">
			<div class="col-md-2 column ">
				<a
					href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${t.goods_id}">
					<div class="thumbnail todaygoods" id="">
						<img src="${pageContext.request.contextPath}${t.goods_pic}" />
						<div class="caption text-center">
							<h4 class="font-red">￥${t.goods_price}</h4>
							<p>${t.goods_name}</p>
						</div>
					</div>
				</a>
			</div>
		</c:if>
	</c:forEach>



</div>



<!-- 服装 -->
<c:forEach items="${catelist}" var="c" varStatus="vs">
				<div class="navtitle"><span class="cate-title">${c.cateName}</span>
					<small>${c.cateDesc}</small>
					<a class="btn btn-default btn-xs pull-right btn-more"  href="#" role="button">更多</a>
					<ul class="list-inline pull-right cate-ul" >
					<c:forEach items="${c.childlist}" var="cl" varStatus="i">
			  			<li><a href="">${cl.childname}</a></li>
		            </c:forEach>
					</ul>
				 </div>	 						    
						<div class="row">
							<c:forEach items="${c.goodslist}" var="g" varStatus="gvs">
								<div class="col-md-2">
								   <a href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${g.goodsId}">
									<div class="thumbnail homegoods">
										<img alt="暂无图片" src="${pageContext.request.contextPath}${g.goodsPic}" />
										<div class="caption caption-style">
											<p>${g.goodsName}</p>
											<p class="font-red">
												 ￥ ${g.goodsPrice}											 
											</p>
										</div>
									</div>
								   </a>	
								</div>
							</c:forEach>
			            </div>
            </c:forEach>

<div class="panel panel-default">
				<div class="panel-heading ">

					<h3 class="panel-title">
						热销商品
					</h3>
				</div>
				<div class="panel-body">
				    
						<div class="row">
			<c:forEach items="${hostlist}" var="g" varStatus="vs">
				<c:if test="${vs.count<=6}">
					<div class="col-md-2">
						<a href="${pageContext.request.contextPath}/goods/goodsDetail.action?goods_id=${g.goodsId}">
							<div class="thumbnail homegoods">
								<img alt="暂无图片"
									src="${pageContext.request.contextPath}${g.goodsPic}" />
								<div class="caption caption-style">
									<p>${g.goodsName}</p>
									<p class="font-red">￥ ${g.goodsPrice}</p>
								</div>
							</div>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div>
				</div>
			</div>
<!-- col-12 end -->



<!-- row end -->


<%@include file="footer.jsp"%>

