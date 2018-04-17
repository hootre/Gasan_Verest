<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>IMGCUT</title>
    <script>
		<%@ include file="../js/jquery.Jcrop.js"%>
		<%@ include file="../js/jquery.min.js"%>
	</script>
	<script type="text/javascript"> 
		function readURL(input) { 
			if (input.files && input.files[0]) { 
				var reader = new FileReader(); 
				reader.onload = function (e) { 
					$('#blah').attr('src', e.target.result); 
					} 
				reader.readAsDataURL(input.files[0]); 
				} } 
	</script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<style type="text/css">
		<%@ include file="../css/main.css"%>
		<%@ include file="../css/demos.css"%>
		<%@ include file="../css/jquery.Jcrop.css"%>
	</style>
</head>
<body>

<div class="container">
<div class="row">
<div class="span12">
<div class="jc-demo-box">

<div class="page-header">
<h1>Basic Handler</h1>
</div>

  <input class="file"  name="attachmentImg" type="file" onchange="readURL(this)"  multiple="multiple" accept=".gif, .jpg, .png" required>
  <img src="../css/sago.jpg" id="target" alt="[Jcrop Example]" />
	
  <form id="coords"
    class="coords"
    onsubmit="return false;"
    action="http://example.com/post.php">

  <!-- This is the form that our event handler fills -->


    <div class="inline-labels">
    <label>X1 <input type="text" size="4" id="x1" name="x1" /></label>
    <label>Y1 <input type="text" size="4" id="y1" name="y1" /></label>
    <label>X2 <input type="text" size="4" id="x2" name="x2" /></label>
    <label>Y2 <input type="text" size="4" id="y2" name="y2" /></label>
    <label>W <input type="text" size="4" id="w" name="w" /></label>
    <label>H <input type="text" size="4" id="h" name="h" /></label>
    </div>
  </form>

<div class="clearfix"></div>

</div>
</div>
</div>
</div>

</body>
</html>