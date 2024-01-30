package recommend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import program.ProgramDTO;

public class RecommendDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static RecommendDAO instance = new RecommendDAO();
	public static RecommendDAO getInstance() { return instance; }
	private RecommendDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {e.printStackTrace();}
	}
	
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {}
	}
	private RecommendDTO mapping(ResultSet rs) throws SQLException{
		RecommendDTO dto = new RecommendDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setPerson(rs.getString("person"));
		dto.setCategory(rs.getString("category"));
		dto.setCategory_idx(rs.getInt("category_idx"));
		dto.setIsLike(rs.getInt("isLike"));
		return dto;
	}
	
	// 아이디, 카테고리, category_idx를 이용하여 좋아요dto 반환 (해당 유저가 조회한 프로그램/게시글/댓글에 좋아요 되어있는지 확인가능)
	public RecommendDTO selectOne(String userid, String category, int category_idx) {
		RecommendDTO dto = null;
		String sql = "select * from recommend "
					+ "	where person = ? "
					+ "	and category = ? "
					+ "	and category_idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, category);
			pstmt.setInt(3, category_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return dto;
	}
	
	// idx를 이용하여 좋아요dto 반환
	public RecommendDTO selectOneByIdx(int idx) {
		RecommendDTO dto = null;
		String sql = "select * from recommend "
					+ "	where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return dto;
	}
	
	// insert
	public int insert(String userid, String category, int category_idx) {
		int row = 0;
		String sql = "insert into recommend (person, category, category_idx) "
				+ "		values ( ?, ?, ? )";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, category);
			pstmt.setInt(3, category_idx);
			row = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return row;
	}
	
	// 좋아요 버튼을 눌렀을 때 해당 idx에 해당하는 isLike변환(1,0)
	public int likeButton(int idx) {
		int row = 0;
		String sql = "update recommend set "
				+ "	isLike = 1 - isLike "
				+ " where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return row;
	}
	
	// [프로그램 전체]에서 좋아요 상위5개 조회
	public List<RecommendDTO> selectTopProgram() {
		ArrayList<RecommendDTO> list = new ArrayList<>();
		String sql = "select * from ("
				+ "		select category_idx, count(*) count "
				+ "			from recommend "
				+ "				where category = 'program' and isLike = 1 group by category_idx"
				+ "			order by count desc)"
				+ "		where rownum between 1 and 5";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecommendDTO dto = new RecommendDTO();
				dto.setCategory_idx(rs.getInt("category_idx"));
				dto.setCount(rs.getInt("count"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	// 프로그램 전체에서 좋아요 또는 최신순으로 정렬 (str에 들어올 값 : category_idx(최신순), count(좋아요순))
	public List<RecommendDTO> selectOrderByCount(String category, String str) {
		ArrayList<RecommendDTO> list = new ArrayList<>();
		String sql = "select category_idx, count(*) count "
				+ "		from recommend"
				+ "	where category = 'program' and isLike = 1"
				+ "	group by category_idx"
				+ " order by " + str + " desc" ;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecommendDTO dto = new RecommendDTO();
				dto.setCategory_idx(rs.getInt("category_idx"));
				dto.setCount(rs.getInt("count"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	// 프로그램의 카테고리(드라마/영화/애니/예능)별로 좋아요 상위5개의 Program idx & 좋아요수 반환
	public List<ProgramDTO> selectTopProgramCategory(String str) {
		ArrayList<ProgramDTO> list = new ArrayList<>();
		
		String sql = "select * from "
				+ "    (select idx, count(*) as Likecount from program A"
				+ "        join (select isLike, category, category_idx from recommend) B"
				+ "        on A.idx = B.category_idx"
				+ "        where B.category='program' and B.isLike=1 and A.category = ?"
				+ "        group by A.idx order by Likecount desc, idx desc)"
				+ "	where rownum between 1 and 5";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProgramDTO dto = new ProgramDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setLikeCount(rs.getInt("LikeCount"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	// 프로그램의 카테고리별로 좋아요순/최ㅣㄴ순
	public List<ProgramDTO> selectOrderByCategoryCount(String category, String str) {
		ArrayList<ProgramDTO> list = new ArrayList<>();
		String sql = "select idx, count(*) as Likecount from program A"
				+ "    join (select isLike, category, category_idx from recommend) B"
				+ "    on A.idx = B.category_idx"
				+ "    where B.category='program' and B.isLike=1 and A.category = ? "
				+ "    group by A.idx order by "+ str +" desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProgramDTO dto = new ProgramDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setLikeCount(rs.getInt("likeCount"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	public ProgramDTO selectProgramCount(int idx) {
	      ProgramDTO dto = null;
	      String sql = "select count(*) likeCount from recommend "
	            + " where category = 'program' and"
	            + "    category_idx = ? and"
	            + "      isLike = 1";
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            dto = new ProgramDTO();
	            dto.setLikeCount(rs.getInt("likeCount"));
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally { close(); }
	      return dto;
	   }
	
	
	
	
	
}
