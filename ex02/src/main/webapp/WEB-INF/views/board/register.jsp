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
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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
      <ul class="navbar-nav ml-auto">

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

    <!-- Input From -->
    <div class="card-body mr-5 ml-5">
      <h5 class="card-title text-center">Board Register</h5>
      <form class="form-signin" role="form" action="/board/register" method="POST">

        <!-- Title input -->
        <div class="form-group">
          <label for="Title">Title</label>
          <input type="text" class="form-control" id="Title" name="title" placeholder="제목이 무엇인가요?">
        </div>

        <!-- Text input -->
        <div class="form-group">
          <label for="Content">Text Area</label>
          <textarea class="form-control" name="content" id="Content" rows="3" placeholder="내용이 무엇인가요?"></textarea>
        </div>

        <!-- Writer input -->
        <div class="form-group">
          <label for="Writer">Writer</label>
          <input type="text" class="form-control" id="Writer" name="writer" placeholder="이름이 뭔가요?">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-primary">Reset Button</button>

      </form>
    </div>
  </div>

  <!-- End of Main Content -->

  <!-- footer.jsp -->
  <jsp:include page="../includes/footer.jsp"></jsp:include>

  </body>

  </html>