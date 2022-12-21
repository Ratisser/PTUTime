<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style type="text/css">
.A {
	background-color: #FFFFFF;
	border: #FFFFFF 1px solid
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4>
								<i class="fa fa-circle text-green"></i> 실시간 채팅
							</h4>
						</div>
						<div class="portlet-widgets">
							<span class="divider"></span> <a data-toggle="collapse"
								data-parent="#accordion" href="#chat"><i class="fa fa-chevron-down"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div>
							<div class="portlet-body chat-widget"
								style="max-width: 100vw; max-height: 400vh;">
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<div class="media-body"></div>
										</div>
										<textarea class="A" id="messageWindow" rows="10" cols="40"
											readonly="true"></textarea>
									</div>
								</div>
							</div>
							<div class="portlet-footer">
								<div class="form-group">
									<textarea class="form-control" id="inputMessage"
										placeholder="메세지를 입력하세요..." onkeyup="enterkey()"></textarea>
								</div>
								<div class="form-group">
								<div align ="right">
								<input type="submit" class="btn btn-default pull" value="전송" onclick="send()" />
									<a href="chat.jsp"><button type="button" class="btn btn-default pull">초기화</button></a>
									</div>
									</div>
								</div>
					</div>
				</div>
			</div>
			</div>
			</div>
			</div>
			<jsp:include page="space.jsp"/>
			<jsp:include page="footer.jsp"/>

</body>
			<script type="text/javascript">
			var textarea = document.getElementById("messageWindow");
			var webSocket = new WebSocket('ws://210.121.224.50:8090/y/broadcasting');
			var inputMessage = document.getElementById('inputMessage');
			webSocket.onerror = function(event) {
				onError(event)
			};
			webSocket.onopen = function(event) {
				onOpen(event)
			};
			webSocket.onmessage = function(event) {
				onMessage(event)
			};
			function onMessage(event) {
				textarea.value += "상대 : " + event.data  + "\n";
			}
			function onOpen(event) {
				textarea.value += "실시간 채팅방에 입장하였습니다.\n채팅내용은 저장되지 않습니다.\n";
			}
			function onError(event) {
				alert(event.data);
			}
			function send() {
				if (inputMessage.value == '') {
					alert('내용을 입력해 주세요.');
				} else {
					textarea.value += "나 : " + inputMessage.value + "\n";
					webSocket.send(inputMessage.value);
					inputMessage.value = "";
				}
			}
			function enterkey() {
				if (window.event.keyCode == 13) {
						alert('전송버튼을 눌러주세요.');
						inputMessage.value = "";
				}
			}
			window.setInterval(function() {
				var elem = document.getElementById('messageWindow');
				elem.scrollTop = elem.scrollHeight;
			}, 0);
			</script>
</html>