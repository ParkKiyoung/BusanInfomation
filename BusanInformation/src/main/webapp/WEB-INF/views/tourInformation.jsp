<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	
</script>
<head>
<title>부산 정보 포털</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css">
</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<%@include file="./includes/busanHeader.jsp"%>
			<!-- Main -->
				<div id="main">
					<div class="container">
						<div class="row main-row">
							<div class="col-4 col-12-medium">

								<section>
									<h2>Who are you guys?</h2>
									<ul class="small-image-list">
										<li>
											<a href="#"><img src="images/pic2.jpg" alt="" class="left" /></a>
											<h4>Jane Anderson</h4>
											<p>Varius nibh. Suspendisse vitae magna eget et amet mollis justo facilisis amet quis.</p>
										</li>
										<li>
											<a href="#"><img src="images/pic1.jpg" alt="" class="left" /></a>
											<h4>James Doe</h4>
											<p>Vitae magna eget odio amet mollis justo facilisis amet quis. Sed sagittis consequat.</p>
										</li>
									</ul>
								</section>

								<section>
									<h2>How about some links?</h2>
									<div>
										<div class="row">
											<div class="col-6 col-12-small">
												<ul class="link-list">
													<li><a href="#">Sed neque nisi consequat</a></li>
													<li><a href="#">Dapibus sed mattis blandit</a></li>
													<li><a href="#">Quis accumsan lorem</a></li>
													<li><a href="#">Suspendisse varius ipsum</a></li>
													<li><a href="#">Eget et amet consequat</a></li>
												</ul>
											</div>
											<div class="col-6 col-12-small">
												<ul class="link-list">
													<li><a href="#">Quis accumsan lorem</a></li>
													<li><a href="#">Sed neque nisi consequat</a></li>
													<li><a href="#">Eget et amet consequat</a></li>
													<li><a href="#">Dapibus sed mattis blandit</a></li>
													<li><a href="#">Vitae magna sed dolore</a></li>
												</ul>
											</div>
										</div>
									</div>
								</section>

							</div>
							<div class="col-8 col-12-medium imp-medium">

								<section>
									<h2>Two Column #2 (left-hand sidebar)</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ante ante, viverra a ornare sed, convallis sed est. Proin felis sapien, adipiscing quis eleifend vel, sodales vitae sapien. Donec vel lacus leo, eu convallis metus. Cras egestas feugiat tortor, vitae interdum augue aliquam a. Sed nec augue id orci egestas commodo in eget magna. Nunc eleifend diam non odio laoreet placerat gravida nulla bibendum. Phasellus tempus imperdiet suscipit.</p>
									<p>Mauris risus nulla, pulvinar vitae sagittis a, pharetra nec tellus. Suspendisse varius enim ac felis mattis aliquam. Aenean et justo quis ipsum gravida lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec lacinia bibendum cursus. Nullam nec pellentesque lacus. In porta erat in tortor rhoncus quis accumsan magna pretium. Nulla posuere magna eget mauris lacinia in mollis sem fermentum. Donec mollis adipiscing mauris, ut posuere enim rhoncus ut. Nunc commodo vestibulum orci vel placerat. Cras sed risus libero. Donec ac lacus vitae lectus mattis commodo id vitae libero. Etiam lorem odio, volutpat nec pulvinar sit amet, tincidunt ut lacus. Pellentesque consequat arcu vel nisi lobortis in pellentesque orci sollicitudin. Cras gravida lacus turpis, consectetur porttitor lectus. Cras malesuada tortor id neque porta ut semper quam iaculis.</p>
									<p>Nulla ut tortor quam, a luctus nunc. Nulla condimentum diam porttitor arcu placerat tincidunt. Nunc non augue ipsum. Nulla facilisi. Phasellus feugiat augue in ipsum egestas semper. Suspendisse blandit, nisl ullamcorper blandit sollicitudin, sem leo auctor lectus, et volutpat mauris elit et odio. Ut elementum risus in metus mollis tristique vulputate nulla interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vitae orci dui, ut facilisis dui.</p>
								</section>

							</div>
						</div>
					</div>
				</div>

				<!-- Footer -->
		<%@include file="./includes/busanFooter.jsp"%>
		<!-- Scripts -->
		<script src="/resoureces/assets/js/jquery.min.js"></script>
		<script src="/resoureces/assets/js/browser.min.js"></script>
		<script src="/resoureces/assets/js/breakpoints.min.js"></script>
		<script src="/resoureces/assets/js/util.js"></script>
		<script src="/resoureces/assets/js/main.js"></script>
</body>
</html>