<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
body {
	position: relative;
}
/* 페이지 제목 스타일 */
.page-title {
	position: absolute;
	top: 142px;
    left: 400px;
    text-align: center;
    margin: 40px 0;
}

.page-title h1 {
    font-size: 2.5em;
    color: #3e4346; /* 블루 색상 */
    margin: 0;
}

/* 컨테이너 스타일 */
.container {
    max-width: 900px;
    margin: 0 auto;
    margin-top: 60px;
    padding: 20px;
    background-color: #fff; /* 흰색 배경 */
    border-radius: 8px; /* 둥근 모서리 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 */
}

/* 섹션 스타일 */
.section {
    margin-bottom: 40px;
}

.section h2 {
    font-size: 2em;
    color: #007bff; /* 블루 색상 */
    margin-bottom: 10px;
    border-bottom: 2px solid #007bff; /* 제목 아래 밑줄 추가 */
    padding-bottom: 5px;
    display: flex;
    align-items: center;
}

.section h2 i {
    margin-right: 10px; /* 아이콘과 텍스트 간격 */
    color: #007bff; /* 아이콘 색상 */
}

/* 항목 스타일 */
.skill-item {
    margin-bottom: 20px;
}

.skill-item p {
    margin: 5px 0;
}

</style>

</head>
<body>

<!-- 페이지 제목 -->
<div class="page-title">
    <h1>Skills</h1>
</div>

<!-- 컨테이너 -->
<div class="container">
    <!-- Language Section -->
    <div class="section">
        <h2><i class="fas fa-code"></i> Language</h2>
        <div class="skill-item">
            <strong>JAVA</strong>
            <p>다양한 프로젝트에서 자바의 이론적 개념을 실무에 적용하며, Spring Framework와 같은 자바 기반 프레임워크를 활용한 경험을 통해 효과적이고 안정적인 애플리케이션 개발 능력을 보유하고 있습니다.</p>
        </div>
        <div class="skill-item">
            <strong>JavaScript</strong>
            <p>기초적인 JavaScript 지식을 보유하고 있으며, 팀 프로젝트에서 AJAX나 이벤트 핸들러 등의 기본적인 JavaScript를 사용하여 웹 페이지를 구현해본 경험이 있습니다.</p>
        </div>
        <div class="skill-item">
            <strong>HTML</strong>
            <p>HTML의 기본적인 태그들을 이해하고 있으며, 다양한 프로젝트에서 웹 페이지를 구성하고 기본적인 CSS를 활용하여 스타일링한 경험이 있습니다.</p>
        </div>
    </div>

    <!-- Server Section -->
    <div class="section">
        <h2><i class="fas fa-server"></i> Server</h2>
        <div class="skill-item">
            <strong>Apache Tomcat</strong>
            <p>Apache Tomcat을 사용하여 웹 애플리케이션을 배포 및 관리한 경험이 있습니다. 간단한 설정과 배포 과정으로 웹 애플리케이션을 운영할 수 있어 선택했습니다.</p>
        </div>
    </div>

    <!-- Framework Section -->
    <div class="section">
        <h2><i class="fas fa-cogs"></i> Framework</h2>
        <div class="skill-item">
            <strong>Spring Framework</strong>
            <p>Spring MVC의 장단점을 이해하고 있으며, 이를 사용하여 ‘우리동네편의점’ 웹 애플리케이션 개발 프로젝트를 진행한 경험이 있습니다.</p>
        </div>
        <div class="skill-item">
            <strong>JSP</strong>
            <p>JSP를 활용한 CRUD 사이트 개발 팀 프로젝트 진행 경험이 있습니다.</p>
        </div>
    </div>

    <!-- Database Section -->
    <div class="section">
        <h2><i class="fas fa-database"></i> Database</h2>
        <div class="skill-item">
            <strong>OracleSQL</strong>
            <p>OracleSQL을 팀 프로젝트의 메인 DB로 사용하였으며, 두 번의 팀 프로젝트를 진행한 경험이 있습니다. 관련 자격증인 SQLD자격증을 보유하고 있습니다.</p>
        </div>
    </div>

    <!-- Tools & Collaborations Section -->
    <div class="section">
        <h2><i class="fas fa-tools"></i> Tools & Collaborations</h2>
        <div class="skill-item">
            <strong>Eclipse, Spring Tool Suite (STS)</strong>
            <p>IDE는 Eclipse와 Spring 기반 애플리케이션 개발에 특화된 STS를 주력으로 사용하고 있습니다.</p>
        </div>
        <div class="skill-item">
            <strong>Git & GitHub</strong>
            <p>아직 git 사용에 아주 익숙하지는 않지만 마지막 팀 프로젝트 작업에 활용을 해보면서 계속해서 배워가고 있습니다.</p>
        </div>
    </div>
</div>

</body>
</html>
