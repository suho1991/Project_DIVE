<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="../resources/css/product/register.css">
<%@ include file="../include/header.jsp"%>
<div class="board_list_wrap">
	<div class="board_list_wraping">
		<div class="top">
			<h1>상품 등록 페이지</h1>
			<div class="logo">
				<a href="./index.html"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
		</div>
		<form role="form" action="/product/register" method="post">
			<div class="board">
				<div class="board_title">
					<h3>제목</h3>
					<input type="text" name="title" class="board_title_write">
				</div>
				<div class="box">
					<div class="board_region">
						<h4>판매자 지역</h4>
						<input type="text" name="region" class="board_size" list="depList"
							placeholder="ex) 서울">
					</div>
					<div class="board_price">
						<h4>희망 가격</h4>
						<input type="text" name="price" class="board_size">
					</div>
				</div>
				<div class="board_content">
					<h3>내용</h3>
					<textarea name="description" class="board_content_write"></textarea>
				</div>
				
			</div>
			<div class="board_btn">
				<input type='hidden' name="writer"
					value="<sec:authentication property="principal.user.userId"/>" />
				<input type='hidden' name="userNum"
					value="<sec:authentication property="principal.user.id"/>" /> <input
					type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button type="submit" class="btn_registration">등록</button>
				<a href="/product/list"><button class="btn_list">목록</button></a>
			</div>
		</form>
				<div class="dragndrap uploadDiv">
					<h3>파일 첨부</h3>
					<input type="file" name="uploadFile" multiple>
				</div>
				<div class='uploadResult'>
					<ul>

					</ul>
				</div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>
<script>
$(document).ready(function(){
	
	//목록 조회로 돌아가기
	$(".btn_list").on("click", function(e){
		e.preventDefault();
		location.href="/product/list";
	})
	
var formObj = $("form[role='form']");
//게시물 등록 시에 첨부 파일 정보까지 함께 처리하기
$("button[type='submit']").on("click", function(e){
	e.preventDefault();
	
	var outStr = "";
	
	$(".uploadResult ul li").each(function(i, obj){
		var jobj = $(obj);
		
		outStr += "<input type='hidden' name='listAttach[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
		outStr += "<input type='hidden' name='listAttach[" + i + "].uploadPath' value='" + jobj.data("uploadpath") + "'>";
		outStr += "<input type='hidden' name='listAttach[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
		outStr += "<input type='hidden' name='listAttach[" + i + "].fileType' value='" + jobj.data("image") + "'>";
		
	});
	formObj.append(outStr).submit();
});

var extCheckRegExp = new RegExp("(.*?)\.(jpg|gif|png)$");
var maxSize = 41943040;	//40M

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

function checkFileExtAndSize(fileName, fileSize) {
	if (fileSize > maxSize) {
		alert("파일 사이즈 초과");
		return false;
	}
	if (!extCheckRegExp.test(fileName)) {
		alert("해당 종류의 파일은 업로드를 허용하지 않습니다.");
		return false;	
	}
	return true;
}


var uploadResultULTag = $(".uploadResult ul");

function showUploadedFile(listAttachFileDTO) {
	var outStr = "";
	$(listAttachFileDTO).each(function(i, attachFileDTO) {
		outStr += "<li data-uploadpath='" + attachFileDTO.uploadPath + "' data-uuid='" 
				+ attachFileDTO.uuid + "' data-filename='" + attachFileDTO.fileName + "' data-image='" 
				+ attachFileDTO.image + "'><div>" 
				+ "<span> " + attachFileDTO.fileName + "</span>";
		if(attachFileDTO.image) {
			var fileCallPath = encodeURIComponent(attachFileDTO.uploadPath + "/"
					+ attachFileDTO.thumbnailHeader + attachFileDTO.uuid + 
					attachFileDTO.fileNameSeparatorUuid + attachFileDTO.fileName);
			
			var originPath = attachFileDTO.uploadPath + "/" + attachFileDTO.uuid
			 + attachFileDTO.fileNameSeparatorUuid + attachFileDTO.fileName;
			
			originPath = originPath.replace(new RegExp(/\\/g), "/");
			
			outStr += "<button type='button' class='btn btn-warning btn-circle' data-file='" + fileCallPath + "' data-type='image'><i class='fa fa-times'></i></button><br>"
					+ "<img src='/displayImage?absoluteFileName=" + fileCallPath + "'>";
					
		}
		outStr += "</div></li>";
	});
		uploadResultULTag.append(outStr);
}

$("input[type='file']").change(function(e){
	var formData = new FormData();
	var inputFileTag = $(this);
	var files = inputFileTag[0].files;
	
	
	for (var i = 0; i < files.length; i++) {
		if (!checkFileExtAndSize(files[i].name, files[i].size)) {
			return false;
		}
		formData.append("uploadFile", files[i]);
	}
	
	$.ajax({
		url:'/uploadAjaxAction',
		processData:false,
		contentType:false,
		data:formData,
		type:'POST',
		dataType:'json',
		beforeSend:function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success:function(listAttachFileDTO) {
			showUploadedFile(listAttachFileDTO);
		}
	})
	
});

$(".uploadResult").on("click", "button", function(e){
	var deleteTargetFileName = $(this).data("file");
	var delteTargetFileType = $(this).data("type");

	var targetLi = $(this).closest("li");
	
	$.ajax({
		url : '/deleteFile',
		data : {deleteTargetFileName : deleteTargetFileName, delteTargetFileType : delteTargetFileType},
		dateType : 'text',
		type : 'POST',
		beforeSend:function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success : function(result){
			targetLi.remove();
		}
	});
});
})
</script>
