<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Heaer.jsp -->
<jsp:include page="../includes/header.jsp"></jsp:include>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Topbar -->
		<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 shadow d-flex justify-content-between">

			<form class="form-inline" id="searchForm" action="/board/list" method="GET">
				<select class="custom-select" name="type">
					<option value="" ${ pageMaker.cri.type==null ? 'selected' : '' }>검색옵션</option>
					<option value="T" ${ pageMaker.cri.type eq 'T' ? 'selected' : '' }>제목</option>
					<option value="C" ${ pageMaker.cri.type eq 'C' ? 'selected' : '' }>내용</option>
					<option value="W" ${ pageMaker.cri.type eq 'W' ? 'selected' : '' }>작성자</option>
					<option value="TC" ${ pageMaker.cri.type eq 'TC' ? 'selected' : '' }>제목 or 내용</option>
					<option value="TW" ${ pageMaker.cri.type eq 'TW' ? 'selected' : '' }>제목 or 작성자</option>
					<option value="TWC" ${ pageMaker.cri.type eq 'TWC' ? 'selected' : '' }>제목 or 내용 or 작성자</option>
				</select>
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="keyword"
					value="${ pageMaker.cri.keyword }">
				<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${ pageMaker.cri.amount }">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>

			<!-- Topbar Navbar -->
			<ul class="navbar-nav">

				<!-- Nav Item - Search Dropdown (Visible Only XS) -->
				<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle" href="#"
						id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-search fa-fw"></i>
					</a> <!-- Dropdown - Messages -->
					<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
						<form class="form-inline mr-auto w-100 navbar-search">
							<div class="input-group">
								<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
									aria-label="Search" aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</li>

				<!-- Nav Item - Alerts -->
				<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
						<span class="badge badge-danger badge-counter">3+</span>
					</a> <!-- Dropdown - Alerts -->
					<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="alertsDropdown">
						<h6 class="dropdown-header">Alerts Center</h6>
						<a class="dropdown-item d-flex align-items-center" href="#">
							<div class="mr-3">
								<div class="icon-circle bg-primary">
									<i class="fas fa-file-alt text-white"></i>
								</div>
							</div>
							<div>
								<div class="small text-gray-500">December 12, 2019</div>
								<span class="font-weight-bold">A new monthly report is
									ready to download!</span>
							</div>
						</a> <a class="dropdown-item d-flex align-items-center" href="#">
							<div class="mr-3">
								<div class="icon-circle bg-success">
									<i class="fas fa-donate text-white"></i>
								</div>
							</div>
							<div>
								<div class="small text-gray-500">December 7, 2019</div>
								$290.29 has been deposited into your account!
							</div>
						</a> <a class="dropdown-item d-flex align-items-center" href="#">
							<div class="mr-3">
								<div class="icon-circle bg-warning">
									<i class="fas fa-exclamation-triangle text-white"></i>
								</div>
							</div>
							<div>
								<div class="small text-gray-500">December 2, 2019</div>
								Spending Alert: We've noticed unusually high spending for your
								account.
							</div>
						</a> <a class="dropdown-item text-center small text-gray-500" href="#">Show
							All Alerts</a>
					</div>
				</li>

				<!-- Nav Item - Messages -->
				<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages -->
						<span class="badge badge-danger badge-counter">7</span>
					</a> <!-- Dropdown - Messages -->
					<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="messagesDropdown">
						<h6 class="dropdown-header">Message Center</h6>
						<a class="dropdown-item d-flex align-items-center" href="#">
							<div class="dropdown-list-image mr-3">
								<img class="rounded-circle" src="/resources/img/undraw_profile_1.svg" alt="">
								<div class="status-indicator bg-success"></div>
							</div>
							<div class="font-weight-bold">
								<div class="text-truncate">Hi there! I am wondering if you
									can help me with a problem I've been having.</div>
								<div class="small text-gray-500">Emily Fowler · 58m</div>
							</div>
						</a> <a class="dropdown-item d-flex align-items-center" href="#">
							<div class="dropdown-list-image mr-3">
								<img class="rounded-circle" src="/resources/img/undraw_profile_2.svg" alt="">
								<div class="status-indicator"></div>
							</div>
							<div>
								<div class="text-truncate">I have the photos that you
									ordered last month, how would you like them sent to you?</div>
								<div class="small text-gray-500">Jae Chun · 1d</div>
							</div>
						</a> <a class="dropdown-item d-flex align-items-center" href="#">
							<div class="dropdown-list-image mr-3">
								<img class="rounded-circle" src="/resources/img/undraw_profile_3.svg" alt="">
								<div class="status-indicator bg-warning"></div>
							</div>
							<div>
								<div class="text-truncate">Last month's report looks
									great, I am very happy with the progress so far, keep up the
									good work!</div>
								<div class="small text-gray-500">Morgan Alvarez · 2d</div>
							</div>
						</a> <a class="dropdown-item d-flex align-items-center" href="#">
							<div class="dropdown-list-image mr-3">
								<img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
								<div class="status-indicator bg-success"></div>
							</div>
							<div>
								<div class="text-truncate">Am I a good boy? The reason I
									ask is because someone told me that people say this to all
									dogs, even if they aren't good...</div>
								<div class="small text-gray-500">Chicken the Dog · 2w</div>
							</div>
						</a> <a class="dropdown-item text-center small text-gray-500" href="#">Read
							More Messages</a>
					</div>
				</li>

				<div class="topbar-divider d-none d-sm-block"></div>

				<!-- Nav Item - User Information -->
				<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas
							McGee</span> <img class="img-profile rounded-circle" src="/resources/img/undraw_profile.svg">
					</a> <!-- Dropdown - User Information -->
					<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="#"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
						</a> <a class="dropdown-item" href="#"> <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
						</a> <a class="dropdown-item" href="#"> <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity
							Log
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
							Logout
						</a>
					</div>
				</li>

			</ul>

		</nav>
		<!-- End of Topbar -->

		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">코드로 배우는 스프링</h1>
			<p class="mb-4">- Data Table을 제거한 상태입니다.</p>

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3 d-flex justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary d-flex align-items-center">Database
						List</h6>
					<button id="regBtn" type="button" class="btn btn-secondary">Register
						New Board</button>
				</div>
				<div class="card-body">

					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>#번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>#번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${ list }" var="board">
									<tr>
										<td>
											<a class="move" href="${ board.bno }">${ board.bno }</a>
										</td>
										<td>${ board.title }</td>
										<td>${ board.writer }</td>
										<td>
											<fmt:formatDate value="${ board.regdate }" pattern="yyyy-MM-dd" />
										</td>
										<td>
											<fmt:formatDate value="${ board.regdate }" pattern="yyyy-MM-dd" />
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- 페이징 UI -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">

								<!-- 이전 페이지가 있는가? -->
								<c:if test="${ pageMaker.prev }">
									<li class="page-item previous">
										<a class="page-link" href="${ pageMaker.startPage - 1 }" tabindex="-1">Previous</a>
									</li>
								</c:if>

								<!-- 총 페이지 갯수는 몇개인가? -->
								<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
									<li class="page-item ${ pageMaker.cri.pageNum == num ? " active": "" }">
										<a class="page-link" href="${ num }">${ num }</a>
									</li>
								</c:forEach>

								<!-- 다음 페이지가 있는가? -->
								<c:if test="${ pageMaker.next }">
									<li class="page-item">
										<a class="page-link" href="${ pageMaker.endPage + 1}">Next</a>
									</li>
								</c:if>

							</ul>
						</nav>

						<!-- 페이징 데이터 액션 폼 (hidden) -->
						<form action="/board/list" id="actionForm" method="get">
							<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${ pageMaker.cri.amount }">
							<input type="hidden" name="type" value="${ pageMaker.cri.type }">
							<input type="hidden" name="keyword" value="${ pageMaker.cri.keyword }">
						</form>

						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Modal
											title</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">처리가 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	<!-- footer.jsp -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>

	</body>

	<script type="text/javascript">
		$(document)
			.ready(
				function () {

					var result = '${result}';

					checkModal(result);

					// 웹 히스토리 초기화
					history.replaceState({}, null, null);

					// 페이지 모달 이벤트 예외 처리
					function checkModal(result) {

						if (result === '' || history.state) {
							return;
						}

						if (parseInt(result) > 0) {
							$(".modal-body").html(
								"게시글 " + parseInt(result) +
								" 번이 등록되었습니다.");
						}

						$("#myModal").modal("show");

					}

					// 게시물 수정 버튼 클릭
					$("#regBtn").on("click", function () {
						self.location = "/board/register";
					});

					// 페이징 링크 처리
					var actionForm = $('#actionForm');

					$(".page-item a").on("click", function (e) {

						e.preventDefault();

						console.log('click');

						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
					});

					$('.move').on('click', function (e) {

						e.preventDefault();
						actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>'");
						actionForm.attr('action', '/board/get');
						actionForm.submit();
					});

					console.log($(this).attr("href"));

					// 검색 로직
					var searchForm = $('#searchForm');

					$('#searchForm button').on('click', function (e) {

						if (!searchForm.find("option:selected").val()) {
							alert("검색종류를 선택하세요.");
							return false;
						}

						if (!searchForm.find("input[name='keyword']").val()) {
							alert("키워드를 입력하세요.");
							return false;
						}

						searchForm.find("input[name='pageNum']").val("1");
						e.preventDefault();

						searchForm.submit();
					});
				});
	</script>

	</html>