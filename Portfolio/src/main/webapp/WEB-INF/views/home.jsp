<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>

/* 컨테이너 스타일 */
.container {
	padding: 20px;
	max-width: 900px;
	margin: auto;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container:hover {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

/* 섹션 스타일 */
.section {
	margin-bottom: 40px;
	background-color: #ffffff;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.section:hover {
	background-color: #f1f3f4; /* 라이트 그레이 */
	cursor: pointer;
}

.section.collapsed {
	height: 100px;
}

.section.expanded {
	height: auto;
}

.section h1, .section h2 {
	margin-top: 0;
	margin-bottom: 10px;
	color: #333;
	cursor: pointer;
	font-size: 1.5em; /* 제목 크기 증가 */
}

/* 섹션 콘텐츠 스타일 */
.section-content {
	display: flex;
	align-items: center;
	overflow: hidden;
}

.section.collapsed .section-content {
	display: none;
}

.section.expanded .section-content {
	display: flex;
}

.profile img {
	width: 120px;
	height: 168px;
	margin-right: 20px;
	border-radius: 12px; /* 둥근 모서리 */
	border: 1px solid grey;
}

/* 프로필 섹션 스타일 */
.profile {
	background-color: #ffffff;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 40px;
}

.section-details p {
	margin: 10px 0;
	font-size: 1.1em;
	line-height: 1.5;
}

.section-details p a {
	color: #007bff; /* 링크 색상 */
	text-decoration: none;
}

.section-details p a:hover {
	text-decoration: underline;
}

/* Education Section Styles */
.education-item {
	display: flex;
	align-items: center;
	margin-bottom: 20px; /* 항목 간 간격 */
}

.education-icon {
	font-size: 28px; /* 아이콘 크기 */
	color: #007bff; /* 아이콘 색상 블루로 변경 */
	margin-right: 20px;
}

.education-details {
	flex: 1;
}

.education-details h3 {
	margin: 0;
	font-size: 1.3em;
	color: #333;
	line-height: 1.4;
}

.education-details p {
	margin: 5px 0;
	font-size: 1.1em;
	color: #555; /* 약간 연한 회색으로 텍스트 색상 조정 */
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
	var sections = document.querySelectorAll(".section:not(.profile)");

	sections.forEach(function(section) {
		section.addEventListener("click", function() {
			if (section.classList.contains("collapsed")) {
				section.classList.remove("collapsed");
				section.classList.add("expanded");
			} else {
				section.classList.remove("expanded");
				section.classList.add("collapsed");
			}
		});
	});
});
</script>

</head>
<body>
	<div class="container">
		<!-- Profile Section -->
		<div class="profile">
			<h2>Profile</h2>
			<div class="section-content">
				<img src="${cpath}/resources/images/profile.jpg"
					alt="Profile Picture">
				<div class="section-details">
					<p>
						<i class="fas fa-user"></i> Name : 김유빈
					</p>
					<p>
						<i class="fas fa-envelope"></i> Email : <a
							href="mailto:ubinn0210@gmail.com">ubinn0210@gmail.com</a>
					</p>
					<p>
						<i class="fas fa-clipboard"></i> Notion : <a
							href="https://www.notion.so/788a3780ff3c42be88a51b047633fb02?pvs=4"
							target="_blank">My Notion</a>
					</p>
					<p>
						<i class="fab fa-github"></i> GitHub : <a
							href="https://github.com/yubin0210" target="_blank">My GitHub</a>
					</p>
					<p>
						<i class="fas fa-phone"></i> Phone : 010-6422-1640
					</p>
				</div>
			</div>
		</div>

		<!-- Education Section -->
		<div class="section education collapsed">
			<h2>Education</h2>
			<div class="section-content">
				<ul>
					<li>
						<div class="education-item">
							<div class="education-icon">
								<i class="fas fa-school"></i>
							</div>
							<div class="education-details">
								<h3>KG IT BANK</h3>
								<p>2022.04 ~ 2022.08</p>
							</div>
						</div>
					</li>
					<li>
						<div class="education-item">
							<div class="education-icon">
								<i class="fas fa-globe-americas"></i>
							</div>
							<div class="education-details">
								<h3>캐나다 워킹홀리데이</h3>
								<p>2022.08 ~ 2023.05</p>
							</div>
						</div>
					</li>
					<li>
						<div class="education-item">
							<div class="education-icon">
								<i class="fas fa-graduation-cap"></i>
							</div>
							<div class="education-details">
								<h3>
									KG IT BANK<br>웹 융합 SW 기반 빅데이터 솔루션 개발자 양성 과정 수료
								</h3>
								<p>2023.10 ~ 2024.04</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

	</div>
</body>
</html>
