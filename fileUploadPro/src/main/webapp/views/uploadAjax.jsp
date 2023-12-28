<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2023. 6. 8. - 오전 8:19:37</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet" href="/fileUploadPro/cdn/example.css">
<script src="/fileUploadPro/cdn/example.js"></script>


</head>
<body>
<h1 class="main">File Upload <sub>서블릿 3.0 + Ajax</sub></h1>
<div>
	<div class="uploadDiv">
	  <input type="file" name="uploadFile" multiple="multiple">
	  <button id="uploadFile" style="vertical-align:top; top: 2px">  Upload File </button>
	</div>
	<div class="uploadResult">
	  <ul>
	  </ul>
	</div>	
</div>
<div class="message long" title="설명">
  <ol>
    <li>fileUploadPro 프로젝트 생성</li>
    <li>webapp > images, upload, views 폴더 생성</li>
    <li>views > uploadAjax.jsp 추가</li>
    <li>UploadAjaxActionAjax.java  서블릿 추가</li>
    <li>images > attach.jsp 이미지 추가</li>
    <li>jspPro > lib 모든 jar파일 복사 + 붙이기</li>
    <li>webapp > cdn >   css/js</li>
    <li></li>
    <li></li>
    <li></li>
  </ol>
</div>

<script>
  $(function (){
	  
	  var regex = /(.*?)\.(exe|sh|alz)$/i;
	  var maxSize = 1024*1024*50; // 5M
	  
	  function checkExtension(fileName, fileSize){
		if( fileSize > maxSize ){
			alert("파일 사이즈 초과");
			return false;
		}  
		if(regex.test(fileName)){
			alert("해당 종류의 파일을 업로드할 수 없습니다.");
			return false;
		}
		return true;
	  }
	  
	  $("#uploadFile").on("click", function (event){
		  // HTML5            
		  var formData = new FormData();
		  var inputFile = $("input[name='uploadFile']");
		  var files = inputFile[0].files;
		  //console.log(files)
		  for (var i = 0; i < files.length; i++) {
			  if(!checkExtension(files[i].name, files[i].size)){
				  return false;
			  }
			formData.append("uploadFile", files[i]);
		 } // for
		 
		 $.ajax({
			 url:'/fileUploadPro/uploadAjaxAction.ajax',
			 processData: false,
			 contentType: false,
			 data:formData,
			 type:'POST',
			 dataType:'json',
			 success: function ( result ){
				 console.log(result);
				 // [ {fn, , , },{fn, , , },{fn, , , },{fn, , , }]
				 var content = "";
				 $(result).each(function(i, element) {  // {fn, , , }
					 if( element.image ){
						 //content += "<li><img src='"+  encodeURIComponent(element.uploadPath) +"' width='50px'>"+element.fileName+"</li>";
						 content += "<li><img src='"+  element.uploadPath +"' width='50px'>"+element.fileName+"</li>";
					 }else{						 
					    content += "<li><img src='/fileUploadPro/images/attach.jpg' width='50px'>"+element.fileName+"</li>";
					 }
				 });
				 $(".uploadResult ul").append(content);
			 }
		 }); // $.ajax
	  });
  });
</script>
</body>
</html>








