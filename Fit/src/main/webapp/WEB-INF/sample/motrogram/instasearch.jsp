<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html ng-app="metrogram">
<head>
	<title>Metrogram</title>
	<link rel="stylesheet" href="assets/style.css" />
	<script src="assets/angular.min.js"></script>
	<script src="assets/metrogram.js"></script>
</head>

<body ng-controller="slideshow" ng-class="loadingClass">
	<h1>
		<img src="assets/instagram-logo.png" /> 
		#<input type="text" ng-model="tag" ng-change="tagChange()" ng-init="tag = 'metronetlife'" size="{{ tag.length }}" />
	</h1>

	<ul id="slides">
		<li ng-repeat="image in images" class="slide" ng-class="{ active : image.isActive }">
			<figure>
				<img ng-src="{{ imaged.images.standard_resolution.url }}" class="image" />
			</figure>

			<div class="meta">
				<p class="qr">
					<img ng-src="http://qrfree.kaywa.com/?s=8&amp;d={{ image.link | escape }}" />
				<p>
				<p class="caption">
					<cite class="author">
						<img ng-src="{{ image.user.profile_picture }}" width="40" height="40" /> 
						{{ image.user.username }}
					</cite> 
					{{ image.caption.text }}
				</p>
				<p class="likes">
					&hearts; {{ image.likes.count }} likes
				</p>
				<ul class="comments">
					<li class="comment" ng-repeat="comment in image.comments.data">
						<cite class="author">
							<img ng-src="{{ comment.from.profile_picture }}" width="40" height="40" /> 
							{{ comment.from.username }}
						</cite> 
						{{ comment.text }}
					</li>
				</ul>
			</div>
		</li>
	</ul>
</body>
</html>