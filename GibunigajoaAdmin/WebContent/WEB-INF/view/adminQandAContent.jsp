<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<!-- -------------------------------------관리자 Q&A 답변 페이지------------------------------------------------- -->

<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 페이지</title>

<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>



<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script>

<script>

    $(document).ready(function() {
    	$('#summernote').summernote({
    		 placeholder: '답변 내용을 적어주세요.',
    	        height: 400,
    	        width: 920,
    	        lang: 'ko-KR',
    	        toolbar: [
                    // [groupName, [list of button]]
                    ['Font Style', ['fontname']],
                    ['style', ['bold', 'italic', 'underline']],
                    ['font', ['strikethrough']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['paragraph']],
                    ['height', ['height']],
                    ['Insert', ['picture']],
                    ['Insert', ['link']],
                    ['Misc', ['fullscreen']]
                 ]
           
  	});
	});

    /* 목록 버튼 누르면 리스트로 돌아감 */
	function returnQandA() {
		location.href = "adminQandA.do";
	}

	//logout시 controller session 삭제 처리로 이동  
	function logout() {
		if (confirm("로그아웃 하시겠습니까?")) {
			//kakaoLogOut();
			location.href = "logout.do";
		} else {

		}
	}
</script>

<style>
/* 입력칸 스타일 */
.a {
	color: black;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	border: 10px solid transparent;
}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 시작-->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<br>
			<div class="sidebar-brand-icon rotate-n-15"></div>
			<div class="sidebar-brand-text mx-3" style="font-size: 20px; color: white;">관리자 페이지</div>
			
			<br>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<li class="nav-item"><a class="nav-link" href="adminQandA.do">
					<span style="font-size: 18px;">Q&A 답변</span>
			</a></li>
			
			<br>

			<li class="nav-item">
			<a class="nav-link" href="adminNoticeList.do"> <span style="font-size: 18px;">공지사항 올리기</span>
			</a></li>
			
			<br>
			
			<li class="nav-item"><a class="nav-link" href="programList.do">
					<span style="font-size: 18px;">프로그램 승인</span>
			</a></li>
			
			<br>

			<li class="nav-item"><a class="nav-link" href="memberListType.do?type=1">
					<span style="font-size: 18px;">회원 List</span>
			</a></li>
			
			<br>
			<hr class="sidebar-divider d-none d-md-block">
		</ul>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<ul class="navbar-nav ml-auto">
					
                        <!-- 관리자 로그아웃 버튼 -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">  
							<span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>${nickname}</b>님이 로그인 중입니다.</span> 
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">								
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="javascript:void(0);" onclick="logout()"> 
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>
					</ul>
				</nav>
				<!-- 관리자 로그아웃 버튼 끝 -->

                <!-- 관리자 Q&A 답변창 시작 -->
				<div class="container">
					<div class="col-md-12">
						<h1 class="mb-4">Q&A답변하기</h1>
						<button onclick="returnQandA()" class="btn btn-primary"
							    style="position: relative; left: 800px; width: 250px; font-size: 20px;">목록</button>
						<form action="qANDaUpdate.do" method="post">
							<div class="row no-gutters mb-5" style="background: #e8edf0;">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<div id="form-message-warning" class="mb-4"></div>
									<div class="row">
										<div class="col-md-12" style="display: inline;">
											<h2>${list.subject}</h2>
										</div>
										<hr width="1000px" color="black" noshade />
										<ul style="width: 100%; position: relative; top: 10px;">
											<li style="display: inline; color: black; position: relative; right: 30px;">
											                      작성자 :${list.nickname}</li>
											                      
											<li style="display: inline; color: black; position: relative; left: 20px;">
												<div style="display: inline;">접수 상태</div> 
												<select name="status_id" style="height:40px;">
													<option value="1">접수중</option>
													<option value="2">처리중</option>
													<option value="3">답변완료</option>
											    </select>
											</li>
											
											<li style="display: inline; color: black; position: relative; left: 350px;">
											                      작성일 : <fmt:formatDate value="${list.register_date}" pattern="yyyy년 MM월 dd일" />
											</li>
										</ul>
										
										<hr width="1000px" color="black" noshade />
										
										<div style="font-size: 22px; color:black">문의내용</div>
										<textarea class="form-control" name=subject id="subject"
											      style="margin: auto; display: inline-block;" rows="10"
											      readonly="readonly">${list.content}</textarea>
											
									<div style="font-size: 22px; color:black">답변내용</div>
										
										<textarea class="form-control" name=answer id="summernote"
											      style="margin: auto; display: inline-block;" rows="15">${list.answer}</textarea>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="submit" id="hidden" style="float: right; margin-right: 1%; height: 50px; 
											       width: 150px; font-size: 20px;" value="답변하기" class="btn btn-primary" />
										</div>
									</div>
									<input type="hidden" name="board_idx" value="${list.board_idx}" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			 <!-- 관리자 Q&A 답변창 끝 -->
		</div>

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>