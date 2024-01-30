package board;

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

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() { return instance; }
	private BoardDAO() {
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
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setContent(rs.getString("content"));
		dto.setImage(rs.getString("image"));
		dto.setProgram_idx(rs.getInt("program_idx"));
		dto.setTitle(rs.getString("title"));
		dto.setViewCount(rs.getInt("viewCount"));
		dto.setWriteDate(rs.getDate("writeDate"));
		dto.setWriter(rs.getString("writer"));
		return dto;
	}
	
	public List<BoardDTO> selectList(int idx) {
	      ArrayList<BoardDTO> list = new ArrayList<>();
	      String sql = "select * from board where program_idx = ?"
//	            + "   where "
//	            + "       title like '%' || ? || '%' or "
//	            + "       writer like '%' || ? || '%' or "
//	            + "       content like '%' || ? || '%'   "
	            + "   order by idx desc";
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, idx);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            list.add(mapping(rs));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally { close(); }
	      return list;
	   }
	
	
	public int selectCount(String search) {
		int count = 0;
		String sql = "select count(*) from board "
				+ "	where "
				+ "		 (title like '%' || ? || '%' or "
				+ "		 writer like '%' || ? || '%' or "
				+ "		 content like '%' || ? || '%')	";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return count;
	}
	
	public List<BoardDTO> selectWriterList(String userid) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql = "select * from board where writer = ? order by idx desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				list.add(mapping(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	public int insert(BoardDTO dto) {
		int row = 0;
		String sql = "insert into board (program_idx, title, writer, content, image) values ("
				+ "?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getProgram_idx());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getImage());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	public BoardDTO selectOne(int idx) {
		BoardDTO dto = null;
		String sql = "select * from board where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return dto;
	}
	
	public int updateViewCount(int idx) {
		int row = 0;
		String sql = "update board set viewCount = viewCount + 1 where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	public int delete(int idx) {
		int row = 0;
		String sql = "delete from board where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	public int update(BoardDTO dto) {
		int row = 0;
		String sql = "update board set title = ?, content = ?, image = ?"
				+ "where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImage());
			pstmt.setInt(4, dto.getIdx());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
		
	}
}


















