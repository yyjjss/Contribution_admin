<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 페이지</title>

<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
	//logout시 controller session 삭제 처리로 이동  
	function logout(){
				if(confirm("로그아웃 하시겠습니까?")){
					//kakaoLogOut();
					location.href = "logout.do"; 
				}else{
							
				}
	}
</script>

<style>
/* modal창의 배경 */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* 입력칸 스타일 */
.a {
	color: black;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	border: 10px solid transparent;
}
/* 공지사항 작성 버튼 꾸미기 */
#testBtn {
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	margin-right: -4px;
	border: 1px solid skyblue;
	background-color: #4e73df;
	color: white;
	padding: 5px;
}

#testBtn:hover {
	color: white;
}
b
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<br>
			<!-- Sidebar - Brand -->
			<div class="sidebar-brand-icon rotate-n-15"></div>
			<div class="sidebar-brand-text mx-3"
				style="font-size: 20px; color: white;">관리자 페이지</div>
			</a>
			<br>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="adminQandA.do">
					<span style="font-size: 18px;">Q&A 답변</span>
			</a></li>
			<br>

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link"
				href="adminNoticeList.do"> <span style="font-size: 18px;">공지사항
						올리기</span>
			</a></li>
			<br>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="programList.do">
					<span style="font-size: 18px;">프로그램 승인</span>
			</a></li>
			<br>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="memberListType.do?type=1">
					<span style="font-size: 18px;">회원 List</span>
			</a></li>
			<br>
								
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
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
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">프로그램 승인</h1>
					<!-- <p class="mb-4">공지사항 올리기</p> -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">프로그램 신청 List</h4>
						</div>
						<div class="table-responsive">
							<div class="card-body">

								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>프로그램 제목</th>
											<th>시작일자</th>
											<th>종료일자</th>
											<th>승인상태</th>
										</tr>
									</thead>

									<tbody>
									<c:if test="${!empty programList}">
										<c:forEach var="requestProgram" items="${programList}">
											<tr>
												<td style="font-size: 15px">
												<a href = "showProgramContent.do?program_id=${requestProgram.program_id}&organization_id=${requestProgram.organization_id}">${requestProgram.program_subject}</a>
												</td>
												<td style="font-size: 15px"><p><fmt:formatDate value="${requestProgram.start_date}" pattern = "yyyy-MM-dd"/></td>
												<td style="font-size: 15px"><fmt:formatDate value="${requestProgram.end_date}" pattern="yyyy-MM-dd"/></td>
												<td style="font-size: 15px">
												<c:if test="${requestProgram.approval_flg == 0}">미승인</c:if>
												<c:if test="${requestProgram.approval_flg == 1}">승인</c:if>
												</td>
											</tr>
										</c:forEach>
										</c:if>
										<c:if test="${empty programList }">
											<tr>
												<td rowspan="4">신청한 프로그램이 없습니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</div>
			


		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/check.js?v=1"></script>

</body>

</html>
