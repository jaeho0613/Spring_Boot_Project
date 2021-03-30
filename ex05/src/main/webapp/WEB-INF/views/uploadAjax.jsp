<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>

<body>
	<h1>Upload with Ajax</h1>

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
			width: 20px;
		}
	</style>

	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>

	<div class="uploadResult">
		<ul>

		</ul>
	</div>

	<button id="uploadBtn">Upload</button>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function () {

			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;

			function checkextension(fileName, filesize) {

				if (filesize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}

				return true;
			}

			var uploadResult = $(".uploadResult ul");

			function showUploadedFile(uploadresultArr) {

				var str = "";

				$(uploadresultArr).each(function (i, obj) {
					if (!obj.image) {
						str += "<li><img src='/resources/img/1.png'>" +
							obj.fileName + "</li>";
					} else {
						// str += "<li>" + obj.fileName + "</li>";
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

						str += "<li><img src='/display?fileName=" + fileCallPath + "'></li>";
					}
				});

				uploadResult.append(str);
			}

			var cloneObj = $(".uploadDiv").clone();

			$('#uploadBtn').on('click', function (e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);

				for (var i = 0; i < files.length; i++) {

					if (!checkextension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url: '/uploadAjaxAction',
					processData: false,
					contentType: false,
					data: formData,
					dataType: 'json',
					type: 'POST',
					success: function (result) {

						console.log(result);

						showUploadedFile(result);

						$(".uploadDiv").html(cloneObj.html());
					}
				});

			});

		});
	</script>

</body>

</html>