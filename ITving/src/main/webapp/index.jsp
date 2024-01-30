<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	main {
		overflow-x: hidden;
	}
	.main-image {
        position: relative;
        height: 700px;
        margin-top: 5px;
     }
     .main-image > div > a > label > img:first-child {
     	width: 1700px;
     	border-radius: 15px;
     }
     
     #slider {
            width: 1800px;
            height: 700px;
            margin: 50px auto;
            position: relative;
            /* border: 1px solid black; */
        }
        .wrap {
            position: relative;
        }
        .item {
            box-sizing: border-box;
            position: absolute;
            width: 1700px;
            height: 700px;
            line-height: 500px;
            text-align: center;
            font-size: 40px;
            transition-duration: 1s;
        }
        .item > a:hover {
        	cursor: pointer;
        }
        .control {
            width: 1700px;
            display: flex;
            justify-content: space-between;
            position: absolute;
            top: 45%;
            font-size: 70px;
            color: grey;
        }
        .control > div:hover {
            cursor: pointer;
            color: #eee;
        }
      .item > a > label > img:first-child {
      	position: relative;
      }	
      .item > a > label > img:nth-child(2) {
      	position: absolute;
      	top: 60%; left: 60px; width: 600px;
      }
     .item > a:hover > label {
     	cursor: pointer;
     }
	 .program-top5 {
     	margin: 50px 0 90px 0;
     }
     .program-top5 > p{
     	font-weight: bold;
     	font-size: 20px;
     }
     .program-top5 > div > div {
     	flex: 1;
     	text-align: center;
     }
     .program-top5-img {
     	position: relative;
     	z-index: 1;
     }
     .rankNum {
    	position: absolute;
    	bottom: -45px;
    	left: -30px;
    	z-index: 5;
    	font-size: 200px;
    	font-family: fantasy;
    	color: #eee;
     }
     .program-list > div > div {
     	font-weight: bold;
     	font-size: 20px;
     }
     .program-list  > div:first-child {
     	margin: 20px 0;
     }
     .program-list-arrbt > div {
    	margin: 0 6px;
     }
     .program-list-arrbt > div > a:hover {
     	color: #ff153c;
     }
     .program-top5-img > a > img,
     .program-list-img > div > a > img {
     	transition-duration: 0.3s;
     }
     .program-top5-img > a:hover > img,
     .program-list-img > div > a:hover > img {
     	transform: translate(0, -10px);
     	transition-duration: 0.3s;
     }
     .program-list-img > div {
     	text-align: center;
     	margin: 0 10px 50px 10px;
     }
    .program-list-img > div > a > img {
    	border-radius: 10px;
    	height: 320px;
    }
    
</style>

</head>
<body>
<c:if test="${empty login }">
	<c:redirect url="/login.jsp" />
</c:if>

<main>
	<div class="frame">
		<div id="slider">
			<div class="main-image flex wrap">
				<div class="item"><a href="${cpath }/board.jsp?idx=18" ><label><!-- 환승연애 -->
					<img src="https://image.tving.com/ntgs/operation/banner/2023/12/28/1703747658_1.jpg/dims/resize/F_webp,1920">
					<img src="https://image.tving.com/ntgs/operation/banner/2023/12/28/1703747649_2.png/dims/resize/F_webp,1024">
				</label></a></div>
				<div class="item"><a href="${cpath }/board.jsp?idx=15"><label><!-- 이재곧죽습니다 -->
					<img src="https://image.tving.com/ntgs/operation/banner/2024/01/04/1704328325_1.jpg/dims/resize/F_webp,1920">
					<img src="https://image.tving.com/ntgs/operation/banner/2024/01/04/1704328316_2.png/dims/resize/F_webp,1024">
				</label></a></div>
				<div class="item"><a href="${cpath }/board.jsp?idx=38"><label><!-- 용감한형사들 -->
					<img src="https://image.tving.com/ntgs/operation/banner/2023/12/28/1703757531_1.jpg/dims/resize/F_webp,1920">
					<img src="https://image.tving.com/ntgs/operation/banner/2023/12/22/1703205696_2.png/dims/resize/F_webp,1024"
						 style="top: 40%; width: 650px;">
				</label></a></div>
				<div class="item"><a href="${cpath }/board.jsp?idx=21"><label><!-- 나혼자만레벨업 -->
					<img src="https://image.tving.com/ntgs/operation/banner/2024/01/12/1705018849_1.jpg/dims/resize/F_webp,1920">
					<img src="https://image.tving.com/ntgs/operation/banner/2024/01/12/1705018836_2.png/dims/resize/F_webp,1024">
				</label></a></div>
				<div class="item"><a href="${cpath }/board.jsp?idx=2"><label><!-- 나나투어 -->
					<img src="https://image.tving.com/ntgs/operation/banner/2024/01/05/1704413016_1.jpg/dims/resize/F_webp,1920">
					<img src="https://image.tving.com/ntgs/operation/banner/2024/01/05/1704412997_2.png/dims/resize/F_webp,1024"
						 style="top: 10%; width: 500px; left: 80px;">
				</label></a></div>
			</div>
			<div class="control">
            <div direction="-1">&lt</div>
            <div direction="1">&gt</div>
        </div>
		</div>
		
		<script>
        // item 배열을 미리 불러온다
        const arr = Array.from(document.querySelectorAll('.item'))

        function slider(event) {
            // 단위 너비, css와 너비를 맞춰야 한다
            const unit = 1800 //document.body.clientWidth * 0.95
            const mid = Math.trunc(arr.length / 2)
            // 클릭한 요소의 방향 (1, -1)
            const direction = +event.target.getAttribute('direction')
            
            // 방향에 따라 맨 앞의 값을 맨 뒤에 넣거나
            // 맨 뒤에서 값을 빼서 맨 앞에 넣는다
            if(direction == 1) arr.push(arr.shift())    
            else               arr.splice(0, 0, arr.pop())

            // 배열의 각 요소를 반복실행하여
            arr.forEach((element, index) => {
                element.style.opacity = 0.2     // 투명도를 일괄조절하고
                element.style.left = -(unit * (mid - index)) + 'px' // position: absolute의 left값을 수정한다
            })

            arr[mid].style.opacity = 1  // 가운데 요소는 투명도 1 (보여야 한다)
            arr[0].style.opacity = 0    // 양 끝의 요소는 투명도 0 (반대로 넘어갈때 보이지 않아야 한다)
            arr[arr.length - 1].style.opacity = 0
        }
        
        // 좌우 화살표에 대한 클릭 이벤트
        document.querySelectorAll('.control > div').forEach(e => e.onclick = slider)

        // 초기 작업, 미리 수행하지 않으면 모든 요소가 겹쳐있음
        // dispatchEvent는 지정한 요소의 이벤트를 강제로 발생시킴
        for(let i = 0; i < 7; i++) {
            document.querySelector('.control > div').dispatchEvent(new Event('click'))
        }
        // 아래 코드를 주석 해제 하면 주기적으로 움직임. 멈출 수 없음
        setInterval(
            () => document.querySelector('.control > div:last-child').dispatchEvent(new Event('click')), 
         4000)
    </script>
		
		<div class="program-top5">
			<p>오늘의 아이티빙 TOP 5</p>
			<div class="flex">
				<c:set var="recommendlist" value="${recommendDAO.selectTopProgram() }" />
				<c:forEach var="recommenddto" items="${recommendlist }" varStatus="status">
					<c:set var="programdto" value="${programDAO.selectOne(recommenddto.category_idx) }"/>
					
					<div class="program-top5-img">
						<a href="${cpath }//board.jsp?idx=${programdto.idx}"><img src="${cpath }/programImage/${programdto.image}" height="320px" style="border-radius: 10px;"
							 onerror="this.onerror=null; this.src='${cpath }/programImage/default.png';"></a>
						<div class="rankNum">${status.index +1}</div>
					</div>
					
				</c:forEach>
			</div>
		</div>
		
		<div class="program-list">
			<div class="sb">
				<div>모든 프로그램</div>
				<div class="flex program-list-arrbt" id="arr-bt">
					<div><a href="${cpath }/index.jsp?str=count#arr-bt">좋아요순</a></div>
					<div style="color: grey;"> | </div>
					<div><a href="${cpath }/index.jsp?str=category_idx#arr-bt">최신순</a></div>
				</div>
			</div>
			<div class="flex wrap program-list-img">
				<c:if test="${empty param }">
					<c:set var="list" value="${programDAO.selectList() }" />
					<c:forEach var="dto" items="${list }">
						<div><a href="${cpath }/board.jsp?idx=${dto.idx}">
							<img src="${cpath }/programImage/${dto.image}"
								 onerror="this.onerror=null; this.src='${cpath }/programImage/default.png';">
						</a></div>
					</c:forEach>
				</c:if>
				<c:if test="${not empty param }">
					<c:set var="recommendlistAll" value="${recommendDAO.selectOrderByCount('program',param.str) }" />
					<c:forEach var="recommenddtoAll" items="${recommendlistAll }">
						<c:set var="dto" value="${programDAO.selectOne(recommenddtoAll.category_idx) }" />
						<div><a href="${cpath }/board.jsp?idx=${dto.idx}">
							<img src="${cpath }/programImage/${dto.image}"
								 onerror="this.onerror=null; this.src='${cpath }/programImage/default.png';">
						</a></div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		
	</div>
	
					
			
			
	
</main>	

</body>
</html>