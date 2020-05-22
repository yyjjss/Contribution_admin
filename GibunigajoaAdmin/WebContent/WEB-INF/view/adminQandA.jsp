<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<!-- -------------------------------------관리자 Q&A 리스트 페이지------------------------------------------------- -->

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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
    /* Q&A상세 화면으로 이동 */
	function QandAContent(a) {
		
		location.href="QandAContent.do?board_idx="+a;
	};

	//logout시 controller session 삭제 처리로 이동  
	function logout(){
				if(confirm("로그아웃 하시겠습니까?")){
					//kakaoLogOut();
					location.href = "logout.do"; 
				}else{
							
				}
	}
	</script>

</head>

<body id="page-top">

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

		<div id="content-wrapper" class="d-flex flex-column">
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

				<!-- 관리자 Q&A리스트 시작 -->
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">Q&A</h1>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">Q&A 답변하기</h4>
							<a style="position: absolute; right: 50px; top: 10px;"> </a>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" style="table-layout: fixed;">
									<thead>
										<tr>
											<th style="width: 100px;">답변상태</th>
											<th style="width: 200px;">문의자</th>
											<th>제목</th>
											<th style="width: 150px;">문의날짜</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="dto" items="${list}">
											<tr title="${dto.board_idx}">
												<c:if test="${dto.status_id eq 1}">
													<td style="font-size: 15px">접수중</td>
												</c:if>
												<c:if test="${dto.status_id eq 2}">
													<td style="font-size: 15px">처리중</td>
												</c:if>
												<c:if test="${dto.status_id eq 3}">
													<td style="font-size: 15px">답변완료</td>
												</c:if>
												
												<td style="font-size: 15px">${dto.nickname}</td>
												
												<td style="font-size: 15px">
													<a href="#" onclick="QandAContent(${dto.board_idx})">${dto.subject}</a>
												</td>
												
												<td style="font-size: 15px">
												<fmt:formatDate value="${dto.register_date}" pattern="yyyy년 MM월 dd일" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 관리자 Q&A리스트 끝 -->

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