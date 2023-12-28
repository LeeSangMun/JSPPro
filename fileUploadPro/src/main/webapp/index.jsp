<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2023. 6. 8. - 오전 7:40:55</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="/fileUploadPro/cdn/example.css">
<script src="/fileUploadPro/cdn/example.js"></script>
</head>
<body>
<h3>index.jsp</h3>

<div class="message" title="File Upload 방식">
  <ol>
    <li>form 태그를 이용하는 방식 : 브라우저의 제한이 없어야하는 경우에 사용
      <ul>
        <li>페이지 이동과 동시에 첨부파일을 업로드하는 방식</li>
        <li>iframe를 이용해서 화면의 이동없이 첨부파일을 처리하는 방식</li>
      </ul>
    </li>
    <li>Ajax를 이용하는 방식
      <ul>
        <li>input type='file'을 이용하고 Ajax로 처리하는 방식</li>
        <li>HTML5의 Drag And Drop 기능이나 jQuery 라이브러리를 이용해서 처리하는 방식</li>
      </ul>
    </li>
  </ol>
</div>
<div class="message" title="처리 과정">
  <pre class="code">
  1. fileUploadPro 프로젝트 생성
  2. webapp> image ,  upload 폴더 생성
  3. webapp> views 폴더 생성
      ㄴuploadAjax.jsp     사용하는 파일
      ㄴuploadForm.jsp    필요없음
  4.  AttachFileDTO.java 추가 : 첨부된 파일 정보 저장 객체
       
       UploadAjaxActionAjax.java 서블릿 추가
         ㄴ @WebServlet("/uploadAjaxAction.ajax")
		 ㄴ @MultipartConfig(
											location = "C:\\upload",	
											fileSizeThreshold =  -1,	
											maxFileSize = 1024*1024*50,
											maxRequestSize = 1024*1024*50*5
										)
    5. lib 폴더 확인
       	ㄴthumbnailator-0.4.19.jar	섬네일 처리 라이브러리.				
  </pre>
</div>
</body>
</html>