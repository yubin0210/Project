<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
/* 전체 컨테이너 스타일 */
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

/* 제목 스타일 */
.page-title {
	font-size: 36px;
	font-weight: 700;
	text-align: center;
	margin-bottom: 40px; /* 제목과 콘텐츠 사이의 간격 */
	color: #333;
}

/* 섹션 스타일 */
.section {
	margin-bottom: 20px;
	background-color: #ffffff;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	cursor: pointer;
}

.section:hover {
	background-color: #f1f3f4; /* 라이트 그레이 */
	cursor: pointer;
}

.section.collapsed .section-content {
	display: none;
}

.section.expanded .section-content {
	display: block;
}

.section h2 {
	margin-top: 0;
	margin-bottom: 10px;
	color: #333;
	cursor: pointer;
	font-size: 1.5em; /* 제목 크기 증가 */
}

/* 섹션 콘텐츠 스타일 */
.section-content {
	overflow: hidden;
	transition: all 0.3s ease;
}

.section-details p {
	font-size: 16px;
	line-height: 1.6;
	color: #555;
}

.section-details p a {
	color: #007bff; /* 링크 색상 */
	text-decoration: none;
}

.section-details p a:hover {
	text-decoration: underline;
}

/* 아이콘 스타일 */
.project-icon {
	font-size: 20px;
	margin-right: 10px;
}

/* 코드 블록 스타일 */
.project-code pre {
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
	border-radius: 6px;
	padding: 15px;
	font-size: 0.9em;
	line-height: 1.5;
	overflow-x: auto;
}
</style>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var sections = document.querySelectorAll(".section");

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
		<!-- Page Title -->
		<div class="page-title">Project Experience</div>

		<!-- Project 1 Section -->
		<div class="section collapsed">
			<h2>
				<span class="project-icon">&#128187;</span>재고 관리 및 편의점 웹 애플리케이션
			</h2>
			<div class="section-content">
				<div class="section-details">
					<p>
						<strong>자신의 위치와 가장 가까운 편의점을 찾아주고 온라인으로 주문 및 결제를 할 수 있도록 함</strong>
					</p>

					<h3>프로젝트 주제 선정 이유</h3>
					<p>수업에서 배웠던 내용들을 실제 프로젝트에서 활용하면서 동시에 새로운 기술과 기능을 배울 수 있는 기회를
						가지고자 함. 또한, 일상 생활에서 흔히 이용하는 편의점과 관련된 주제를 선정 함.</p>

					<h3>주요 기능</h3>
					<ul>
						<li>위치 정보, 결제 (API)</li>
						<li>고객과 관리자의 1:1 문의 채팅 (WebSocket)</li>
						<li>재고 관리 및 장바구니 기능</li>
					</ul>

					<h3>개발 환경</h3>
					<ul>
						<li><strong>&#128187; Language :</strong> JAVA, HTML/CSS</li>
						<li><strong>&#128736; Framework :</strong> JSP</li>
						<li><strong>&#128421; Server :</strong> Apache Tomcat 9.0</li>
						<li><strong>&#128451; DB :</strong> OracleSQL</li>
						<li><strong>&#128295; IDE :</strong> Eclipse, SQL Developer</li>
					</ul>

					<h3>프로젝트를 통해 느낀 점</h3>
					<p>• 프로젝트를 진행하면서 팀원들과의 지속적인 커뮤니케이션과 꾸준한 학습이 중요하다는 것을 알게 되었습니다.
						또한, 개인의 생각을 고집하기보다는 다양한 관점과 방법을 통해 코드를 작성하는 것이 프로젝트가 더 나은 방향으로 나아갈
						수 있는 방법임을 배우게 되었습니다.</p>
					<p>• 이번 프로젝트에서 데이터베이스 테이블 정규화를 과도하게 진행하여 테이블 간의 구조를 파악하기가 어려웠고,
						데이터 조회 속도가 저하되었다는 것을 알 수 있었습니다. 이를 통해 과도한 정규화의 단점을 명확히 이해하였고,
						데이터베이스 설계의 중요성을 깨달았습니다.</p>
					<p>• 많은 어려움을 마주했지만 포기하지 않고 끈기 있게 시도하여 그 문제들을 해결할 수 있었습니다. 충분한
						노력과 팀원들과의 지속적인 커뮤니케이션을 통해 문제를 해결하며, 결국 성공적으로 프로젝트를 마무리할 수 있었습니다.</p>

					<h3>주요 코드</h3>
					<div class="project-code">
						<!-- 주요 코드 삽입 -->
						<pre>
                    // 예시 코드
                    public class StoreLocationService {
                        public List findNearestStores(Location userLocation) {
                            // 위치 정보를 기반으로 가장 가까운 편의점 목록을 반환하는 로직
                            return storeRepository.findStoresNear(userLocation);
                        }
                    }
                        </pre>
					</div>
				</div>
			</div>
		</div>

		<!-- Project 2 Section -->
		<div class="section collapsed">
			<h2>
				<span class="project-icon">&#128187;</span>OTT 프로그램 커뮤니티 사이트
			</h2>
			<div class="section-content">
				<div class="section-details">
					<p>
						<strong>관심 있는 프로그램의 게시판에서 자유롭게 글과 댓글을 작성 및 관리할 수 있음</strong>
					</p>

					<h3>프로젝트 목표</h3>
					<p>처음으로 다른 사람과 함께하는 팀 프로젝트인 만큼 끝까지 흥미가 떨어지지 않고 개발할 수 있는, 그리고
						JSP를 활용한 CRUD사이트 개발이 목표였기에 이에 부합하는 OTT 프로그램 커뮤니티 사이트를 주제로 선정 하였음.</p>

					<h3>주요 기능</h3>
					<ul>
						<li>회원 가입 및 로그인</li>
						<li>게시판 글 / 댓글 작성 및 관리</li>
					</ul>

					<h3>개발 환경</h3>
					<ul>
						<li><strong>&#128187; Language :</strong> JAVA, HTML/CSS</li>
						<li><strong>&#128736; Framework :</strong> JSP</li>
						<li><strong>&#128421; Server :</strong> Apache Tomcat 9.0</li>
						<li><strong>&#128451; DB :</strong> OracleSQL</li>
						<li><strong>&#128295; IDE :</strong> Eclipse, SQL Developer</li>
					</ul>

					<h3>프로젝트를 통해 느낀 점</h3>
					<p>• 두 명이 진행한 소규모 프로젝트였지만 처음이라 합을 맞추는 것이 쉽지 않았습니다. 주제 선정부터 테이블
						설계, 코드 작성의 사소한 부분에서도 어려움이 있었지만, 서로의 생각을 존중하며 지속적인 소통을 통해 원활하게
						프로젝트를 진행할 수 있었습니다.</p>
					<p>• 처음으로 누군가와 함께 프로젝트를 진행하며 원하는 결과물을 만들어내고 나니 매우 뿌듯했습니다. 비록 작은
						규모의 프로젝트였지만, 협업을 통해 문제를 해결하고 목표를 달성하는 과정에서 큰 성취감을 느꼈습니다. 이 프로젝트
						경험은 앞으로의 개발자 생활에 큰 동기부여가 되었습니다.</p>
					<p>• 지금까지 배운 지식만으로 프로젝트를 진행하다 보니 기능적으로 아쉬운 부분이 많았습니다. 이러한 부족함을
						채우기 위해 더 발전된 언어와 기술을 배워야 할 필요성을 느꼈습니다.</p>

					<h3>주요 코드</h3>
					<div class="project-code">
						<!-- 주요 코드 삽입 -->
						<pre>
                        // 예시 코드
                        public class CommentService {
                            public void addComment(Post post, String content) {
                                // 게시글에 댓글을 추가하는 로직
                                post.addComment(new Comment(content));
                            }
                        }
                        </pre>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
