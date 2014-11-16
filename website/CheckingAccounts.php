<?php
session_start();
include('connect.php');
?>

<!DOCTYPE HTML>
<html>
<head>
<title>Monkey Bank of America</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>
</head><body class="homepage">

<!-- Header -->
<header id="header">
  <div class="logo container">
    <div>
      <h1><a href="index.php" id="logo">The Monkey Bank of America</a></h1>
      <p>by CS157A</p>
    </div>
  </div>
</header>

<?php include('nav.php'); ?>
		
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
							<div class="content">
							
								<!-- Content -->
						
									<article class="box page-content">

										<header>
											<h2>No Sidebar</h2>
											<p>Semper amet scelerisque metus faucibus morbi congue mattis</p>
											<ul class="meta">
												<li class="icon fa-clock-o">5 days ago</li>
												<li class="icon fa-comments"><a href="#">1,024</a></li>
											</ul>
										</header>

										<section>
											<span class="image featured"><img src="images/pic05.jpg" alt="" /></span>
											<p>
												Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus. 
												Praesent semper mod quis eget mi. Etiam eu ante risus. Aliquam erat volutpat. 
												Aliquam luctus et mattis lectus sit amet pulvinar. Nam turpis nisi 
												consequat etiam lorem ipsum dolor sit amet nullam.
											</p>
										</section>
										
										<section>
											<h3>More intriguing information</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac quam risus, at tempus 
												justo. Sed dictum rutrum massa eu volutpat. Quisque vitae hendrerit sem. Pellentesque lorem felis, 
												ultricies a bibendum id, bibendum sit amet nisl. Mauris et lorem quam. Maecenas rutrum imperdiet 
												vulputate. Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis orci convallis tempor. 
												Etiam a lacus a lacus pharetra porttitor quis accumsan odio. Sed vel euismod nisi. Etiam convallis 
												rhoncus dui quis euismod. Maecenas lorem tellus, congue et condimentum ac, ullamcorper non sapien
												vulputate. Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis orci convallis tempor. 
												Etiam a lacus a lacus pharetra porttitor quis accumsan odio. Sed vel euismod nisi. Etiam convallis 
												rhoncus dui quis euismod. Maecenas lorem tellus, congue et condimentum ac, ullamcorper non sapien. 
												Donec sagittis massa et leo semper a scelerisque metus faucibus. Morbi congue mattis mi. 
												Phasellus sed nisl vitae risus tristique volutpat. Cras rutrum commodo luctus.
											</p>
										</section>

										<section>
											<h3>So in conclusion ...</h3>
											<p>
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac quam risus, at tempus 
												justo. Sed dictum rutrum massa eu volutpat. Quisque vitae hendrerit sem. Pellentesque lorem felis, 
												ultricies a bibendum id, bibendum sit amet nisl. Mauris et lorem quam. Maecenas rutrum imperdiet 
												vulputate. Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis orci convallis tempor. 
												Etiam a lacus a lacus pharetra porttitor quis accumsan odio. Sed vel euismod nisi. Etiam convallis 
												rhoncus dui quis euismod. Maecenas lorem tellus, congue et condimentum ac, ullamcorper non sapien. 
												Donec sagittis massa et leo semper a scelerisque metus faucibus. Morbi congue mattis mi. 
												Phasellus sed nisl vitae.
											</p>
											<p>
												Suspendisse laoreet metus ut metus imperdiet interdum aliquam justo tincidunt. Mauris dolor urna, 
												fringilla vel malesuada ac, dignissim eu mi. Praesent mollis massa ac nulla pretium pretium. 
												Maecenas tortor mauris, consectetur pellentesque dapibus eget, tincidunt vitae arcu. 
											</p>
										</section>

									</article>

							</div>
						</div>
					</div>
					<div class="row 200%">
						<div class="12u">

							<!-- Features -->
								<section class="box features">
									<h2 class="major"><span>A Major Heading</span></h2>
									<div>
										<div class="row">
											<div class="3u">
												
												<!-- Feature -->
													<section class="box feature">
														<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
														<h3><a href="#">A Subheading</a></h3>
														<p>
															Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in 
															lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
														</p>
													</section>
										
											</div>
											<div class="3u">
												
												<!-- Feature -->
													<section class="box feature">
														<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
														<h3><a href="#">Another Subheading</a></h3>
														<p>
															Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in 
															lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
														</p>
													</section>
										
											</div>
											<div class="3u">
												
												<!-- Feature -->
													<section class="box feature">
														<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
														<h3><a href="#">And Another</a></h3>
														<p>
															Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in 
															lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
														</p>
													</section>
										
											</div>
											<div class="3u">
												
												<!-- Feature -->
													<section class="box feature">
														<a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
														<h3><a href="#">And One More</a></h3>
														<p>
															Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in 
															lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
														</p>
													</section>
										
											</div>
										</div>
										<div class="row">
											<div class="12u">
												<ul class="actions">
													<li><a href="#" class="button big">Do Something</a></li>
													<li><a href="#" class="button alt big">Think About It</a></li>
												</ul>
											</div>
										</div>
									</div>
								</section>

						</div>
					</div>
				</div>
			</div>

		<!-- Footer -->
					<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Code Monkeys. All rights reserved.</li>
  </ul>
</footer>

	</body>
</html>