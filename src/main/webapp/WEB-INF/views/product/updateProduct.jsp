<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet" href="../resources/css/productwrite.css">
<%@ include file="../include/header.jsp"%>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 200px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	heigth: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>
<div class="bigPictureWrapper">
<div class="bigPicture">
</div>
</div>
<div class="board_list_wrap">
	<div class="board_list_wraping">
		<div class="top">
			<h1>상품 등록 페이지</h1>
			<div class="logo">
				<a href="/"><i class="fas fa-universal-access"
					style="cursor: pointer"></i></a>
			</div>
		</div>
		<form role="form" action="/product/updateProduct" method="post">
			<div class="board">
				<div class="board_title">
					<h3>제목</h3>
					<input type="text" name="title" class="board_title_write" value="${product.title}">
				</div>
				<div class="box">
					<div class="board_region">
						<h4>판매자 지역</h4>
						<input type="text" name="region" class="board_size" list="depList"
							value="${product.region}">
					</div>
					<div class="board_price">
						<h4>희망 가격</h4>
						<input type="text" name="price" class="board_size" value="${product.price}">
					</div>
				</div>
				<div class="board_content">
					<h3>내용</h3>
					<textarea name="description" class="board_content_write">${product.description}</textarea>
				</div>
				
			</div>
			<div class="board_btn">
				<input type='hidden' name="writer"
					value="<sec:authentication property="principal.user.userId"/>" />
				<input type='hidden' name="userNum"
					value="<sec:authentication property="principal.user.id"/>" /> <input
					type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button type="submit" class="btn_registration">수정</button>
				<a href="/product/list"><button class="btn_list">목록</button></a>
			</div>
			
			<input type="hidden" id="pageNum" name="pageNum" value="${criteria.pageNum}" />
			<input type="hidden" id="amount" name="amount" value="${criteria.amount}" />
			<input type="hidden" name="type" value="${criteria.type}" />
			<input type="hidden" name="keyword" value="${criteria.keyword}" />
			<input type="hidden" name="userNum" value="${product.userNum}"/>
			<input type="hidden" name="id" value="${product.id}"/>
			<input type='hidden' name="${_csrf.parameterName}" value="${_csrf.token}" />
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

<script src="../resources/js/productwrite.js"></script>
</body>
</html>
<script>
$(document).ready(function(){


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

//문서 로드 직후에 깨끗한 상태 기억해 두기

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

(function(){
	var productId = "${product.id}"; 
	$.getJSON("/product/getAttachList", {id : productId}, function(listAttach){
		var outStr = "";
		
		$(listAttach).each(function(i, attachVO){
			outStr += "<li data-uploadpath='" + attachVO.uploadPath 
					+ "' data-uuid='" + attachVO.uuid
					+ "' data-filename='" + attachVO.fileName
					+ "' data-image='" + attachVO.fileType
					+ "' data-separatoruuid='" + attachVO.fileNameSeparatorUuid
					+ "'><div>";
			var fileCallPath = encodeURIComponent(attachVO.uploadPath + "/"
							 + attachVO.thumbnailHeader + attachVO.uuid
							 + attachVO.fileNameSeparatorUuid + attachVO.fileName);
			if(attachVO.fileType) {
				outStr += "<span> " + attachVO.fileName + "<span>"
						+ "<button type='button' data-file='" + fileCallPath + "' data-image='image' class='btn btn-wraning btn-circle'>"
						+ "<i class='fa fa-times'></i></button><br>"
						+ "<img src='/displayImage?absoluteFileName=" + fileCallPath + "'>";
			} else {
				outStr += "<span> " + attachVO.fileName + "</span><br>"
						+ "<button type='button' data-file='" + fileCallPath + "' data-image='file' class='btn btn-wraning btn-circle'>"
						+ "<i class='fa fa-times'></i></button><br>"
						+ "<img src='/resources/img/attach.png'>";
			}
			outStr += "</div></li>";
		});
		
		$(".uploadResult ul").html(outStr);
	});
})();

$(".uploadResult").on("click", "button", function(e){
	if(confirm("이미지 파일을 지우시겠습니까?")){
		var targetLi = $(this).closest("li");
		targetLi.remove();
	}
});


var formObj = $("form[role='form']");
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
	formObj.append(outStr).submit;
	formObj.submit();
});

});
</script>
