var replyService = (function(){
	
	function getReplyList(param, callbackFunc, errorFunc) {
		var pid = param.pid;
		var page = param.page || 1;
		
		$.getJSON(
				"/reply/list/" + pid + "/" + page + "/10.json",	//URL
				function(replyCriteria){
					if (callbackFunc) {
						callbackFunc(replyCriteria.replyCnt, replyCriteria.listReply);
					}
				}).fail(function(xhr, status, err){
					if (errorFunc) {
						errorFunc();
					}
				});
	}
	
	function createReply(replyJSON, csrfHeaderName, csrfTokenValue, callbackFunc, errorFunc) {

		$.ajax({
			type : 'post',
			url : '/reply/createReply',
			data : JSON.stringify(replyJSON),
			contentType : "application/json; charset=utf-8",
			beforeSend:function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result, status, xhr){
				if (callbackFunc) {
					callbackFunc(result);
					alert("댓글 완료");
				}
			},
			error:function(xhr, status, er){
				if (errorFunc) {
					errorFunc(er);
				}
			}
		});
	}

	function updateReply(obj, csrfHeaderName, csrfTokenValue, callbackFunc, errorFunc) {
		$.ajax({
			type : 'put',
			url : '/reply/',
			data : JSON.stringify(obj),
			contentType : "application/json; charset=utf-8",
			beforeSend:function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result, status, xhr){
				if (callbackFunc) {
					callbackFunc(result);
				}
			},
			error:function(xhr, status, er){
				if (errorFunc) {
					errorFunc(er);
				}
			}
		});
	}
	
	
	function deleteReply(id, userNum, csrfHeaderName, csrfTokenValue, callbackFunc, errorFunc) {
		$.ajax({
			type : 'delete',
			url : '/reply/' + id + '/' + userNum,
			beforeSend:function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(result, status, xhr){
				if (callbackFunc) {
					callbackFunc(result);
				}
			},
			error:function(xhr, status, er){
				if (errorFunc) {
					errorFunc(er);
				}
			}
		});
	}
	
	
	function convertTime2Str(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);

		if (gap < (1000 * 60 * 60 * 24)) {
			//하루 동안 올라온 글이면
			var hh = dateObj.getHours();
			var mm = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			return [(hh > 9 ? '' : '0') + hh, ':',
				(mm > 9 ? '' : '0') + mm, ':',
				(ss > 9 ? '' : '0') + ss
				].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			return [yy,'/', (mm>9?'':'0') + mm, '/',
				(dd>9?'':'0') + dd].join('');
		}
	}
	
	return {
		getReplyList : getReplyList,
		createReply : createReply,
		updateReply : updateReply,
		deleteReply : deleteReply,
		convertTime2Str : convertTime2Str
	};
})();