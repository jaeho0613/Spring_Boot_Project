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

      <!-- <form class="form-inline" id="searchForm" action="/board/list" method="GET">
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
			</form> -->

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
      <h5 class="card-title text-center">Board Read Page</h5>

      <!-- Bno input -->
      <div class="form-group">
        <label for="Bno">Bno</label>
        <input type="text" class="form-control" id="Bno" name="bno" value="${board.bno}" readonly>
      </div>

      <!-- Title input -->
      <div class="form-group">
        <label for="Title">Title</label>
        <input type="text" class="form-control" id="Title" name="title" value="${board.title}" readonly>
      </div>

      <!-- Text input -->
      <div class="form-group">
        <label for="Content">Text Area</label>
        <textarea class="form-control" name="content" id="Content" rows="3" readonly>${board.content}</textarea>
      </div>

      <!-- Writer input -->
      <div class="form-group">
        <label for="Writer">Writer</label>
        <input type="text" class="form-control" id="Writer" name="writer" value="${board.writer}" readonly>
      </div>

      <button data-oper='modify' class="btn btn-primary">Modify</button>
      <button data-oper='list' class="btn btn-primary">List</button>

      <div class="row mt-5">
        <div class="col-lg-12">
          <div class="card">

            <!-- 댓글 윗 부분 -->
            <h5 class="card-header d-flex align-items-center">
              <i class="fas fa-comments fa-fw mr-1"></i>
              <span>Reply</span>
              <button type="button" id="addReplyBtn" class="btn btn-primary ml-auto p-2" data-toggle="modal"
                data-target="#exampleModal">New Reply</button>
            </h5>

            <!-- 댓글 폼-->
            <ul class="chat list-group list-group-flush">

            </ul>
          </div>
        </div>
      </div>

      <div class="panel-footer">
        <!-- <nav aria-label="Page navigation example" class="justify-content-center d-flex">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
        </nav> -->
      </div>

      <!-- Data 전달을 위한 Hidden Form -->
      <form id="operForm" action="/board/modify" method="get">
        <input type="hidden" name="bno" id="bno" value="${board.bno}">
        <input type="hidden" name="pageNum" value="${ cri.pageNum }">
        <input type="hidden" name="amount" value="${ cri.amount }">
        <input type="hidden" name="keyword" value="${ cri.keyword }">
        <input type="hidden" name="type" value="${ cri.type }">
      </form>

      <!-- 댓글 입력 Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">New message</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>

            <!-- Modal Input -->
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label class="col-form-label">Reply</label>
                  <input type="text" class="form-control" name="reply" value="New Reply!!!!">
                </div>
                <div class="form-group">
                  <label class="col-form-label">Replyer</label>
                  <input type="text" class="form-control" name="replyer" value="replyer">
                </div>
                <div class="form-group">
                  <label class="col-form-label">Reply Date</label>
                  <input type="text" class="form-control" name="replyDate" value="">
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
              <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
              <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
              <button id="modalCloseBtn" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End of Main Content -->

  <!-- footer.jsp -->
  <jsp:include page="../includes/footer.jsp"></jsp:include>

  </body>

  <script src="/resources/js/reply.js"></script>

  <!-- Reply 이벤트 처리 -->
  <script>
    $(document).ready(function () {

      var bnoValue = "${ board.bno }";
      var replyUL = $(".chat");

      showList(1);

      function showList(page) {

        console.log("show list " + page);

        replyService.getList({
          bno: bnoValue,
          page: page || 1
        }, function (replyCnt, list) {

          console.log("replyCnt : " + replyCnt);
          console.log("list: " + list);

          if (page == -1) {
            pageNum = Math.ceil(replyCnt / 10.0);
            showList(pageNum);
            return;
          }

          var str = "";

          if (list == null || list.length == 0) {
            return;
          }

          for (let i = 0, len = list.length || 0; i < len; i++) {

            str += "<li class='list-group-item' data-rno='" + list[i].rno + "'>";
            str += "<div class='card-body'>";
            str += "<div class='header d-flex justify-content-between'>" +
              "<h5 class='card-title'>" + list[i].replyer + "</h5>" +
              "<small class='pull-rigth text-rigth'>" + replyService.displayTime(list[i].replyDate) +
              "</small></div>";
            str += "<p class='card-text'>" + list[i].reply + "</p></div></li>";
          }

          replyUL.html(str);

          showReplyPage(replyCnt);
        }); // end Function
      } // end showList

      var modal = $(".modal");
      var modalInputReply = modal.find("input[name='reply']");
      var modalInputReplyer = modal.find("input[name='replyer']");
      var modalInputReplyDate = modal.find("input[name='replyDate']");

      var modalModBtn = $("#modalModBtn");
      var modalRemoveBtn = $("#modalRemoveBtn");
      var modalRegisterBtn = $("#modalRegisterBtn");

      // New Reply 버튼 이벤트
      $("#addReplyBtn").on("click", function () {
        modal.find("input").val("");
        modalInputReplyDate.closest("div").hide();
        modal.find("button[id != 'modalCloseBtn']").hide();

        modalRegisterBtn.show();

        $(".modal").modal("show");
      });

      // 댓글 추가 이벤트
      modalRegisterBtn.on("click", function () {

        var reply = {
          reply: modalInputReply.val(),
          replyer: modalInputReplyer.val(),
          bno: bnoValue
        };

        replyService.add(reply, function (result) {

          alert(result);

          modal.find("input").val("");
          modal.modal("hide");

          // showList(1);
          showList(-1);

        });
      });

      // 댓글 클릭시 수정,삭제 Modal 노출
      $(".chat").on("click", "li", function () {

        var rno = $(this).data("rno");

        console.log(rno);

        replyService.get(rno, function (reply) {

          modalInputReply.val(reply.reply);
          modalInputReplyer.val(reply.replyer);
          modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
          modal.data("rno", reply.rno);

          modal.find("button[id != 'modalcloseBtn']").hide();
          modalModBtn.show();
          modalRemoveBtn.show();

          $(".modal").modal("show");
        });
      });

      // 댓글 수정
      modalModBtn.on("click", function (e) {
        var reply = {
          rno: modal.data("rno"),
          reply: modalInputReply.val()
        };

        console.log(reply);

        replyService.update(reply, function (result) {

          alert(result);
          modal.modal("hide");
          showList(pageNum);
        });
      });

      // 댓글 삭제
      modalRemoveBtn.on("click", function (e) {
        var rno = modal.data("rno");

        replyService.remove(rno, function (result) {

          alert(result);
          modal.modal("hide");
          showList(pageNum);
        });
      });

      var pageNum = 1;
      var replyPageFooter = $(".panel-footer");

      function showReplyPage(replyCnt) {

        var endNum = Math.ceil(pageNum / 10.0) * 10;
        var startNum = endNum - 9;

        var prev = startNum != 1;
        var next = false;

        if (endNum * 10 >= replyCnt) {
          endNum = Math.ceil(replyCnt / 10.0);
        }

        if (endNum * 10 < replyCnt) {
          next = true;
        }

        var str = "<nav aria-label='Page navigation example' class='justify-content-center d-flex'>";
        str += "<ul class='pagination'>";

        if (prev) {
          str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
        }

        for (var i = startNum; i <= endNum; i++) {
          var active = pageNum == i ? "active" : "";

          str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
        }

        if (next) {
          str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
        }

        str += "</ul></nav>";

        console.log(str);

        replyPageFooter.html(str);
      }

      replyPageFooter.on("click", "li a", function (e) {
        e.preventDefault();
        console.log("page click");

        var targetPageNum = $(this).attr("href");

        console.log("targetPageNum: " + targetPageNum);

        pageNum = targetPageNum;

        showList(pageNum);
      });

    });
  </script>

  <!-- Reply Rest API Test -->
  <!-- <script>
    console.log("================");

    var bnoValue = "${board.bno}";

    // 댓글 추가
    replyService.add({
        reply: "JS TEST",
        replyer: "tester",
        bno: bnoValue
      },
      function (result) {
        alert("Result :" + result);
      }
    );

    // 댓글 리스트 가져오기
    replyService.getList({
      bno: bnoValue,
      page: 1
    }, function (list) {

      for (var i = 0, len = list.length || 0; i < len; i++) {
        console.log(list[i]);
      }
    });

    // 댓글 삭제 (4번)
    replyService.remove(4, function (count) {

      console.log(count);

      if (count === "success") {
        alert("REMOVED");
      }
    }, function (err) {
      alert("ERROR...");
    });

    // 댓글 수정 (22번)
    replyService.update({
      rno: 1,
      bno: bnoValue,
      reply: "Modified Reply....",
      replyer: "user00"
    }, function (result) {
      alert("수정 완료......");
    });

    // 특정 번호의 댓글 조회 (10번)
    replyService.get(10, function (data) {
      console.log("get!!");
      console.log(data);
    });
  </script> -->

  <!-- form 조작 스크립트 -->
  <script>
    $(document).ready(function () {

      var operForm = $("#operForm");

      $("button[data-oper='modify']").on("click", function (e) {

        operForm.attr("action", "/board/modify").submit();

      });

      $("button[data-oper='list']").on("click", function (e) {

        operForm.find('#bno').remove();
        operForm.attr('action', "/board/list");
        operForm.submit();

      });
    });
  </script>

  </html>