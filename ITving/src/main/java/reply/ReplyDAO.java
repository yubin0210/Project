package reply;

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

public class ReplyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static ReplyDAO instance = new ReplyDAO();
	public static ReplyDAO getInstance() { return instance; }
	private ReplyDAO() {
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
	
	private ReplyDTO mapping(ResultSet rs) throws SQLException {
		ReplyDTO dto = new ReplyDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setBoard_idx(rs.getInt("board_idx"));
		dto.setWriter(rs.getString("writer"));
		dto.setContent(rs.getString("content"));
		dto.setWriteDate(rs.getDate("writeDate"));
		return dto;
	}
	
	public List<ReplyDTO> selectWriterList(String userid) {
		ArrayList<ReplyDTO> list = new ArrayList<>();
		String sql = "select * from reply where writer = ? "
				+ "		order by idx desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	public int insert(ReplyDTO dto) {
		int row = 0;
		String sql = "insert into reply (board_idx, writer, content)"
				+ "values (?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_idx());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	public List<ReplyDTO> selectList(int idx) {
		ArrayList<ReplyDTO> list = new ArrayList<>();
		String sql = "select * from reply where board_idx = ?"
				+ "order by idx desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setBoard_idx(rs.getInt("board_idx"));
				dto.setIdx(rs.getInt("idx"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setWriteDate(rs.getDate("writeDate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
	
	
	
	
	public ReplyDTO selectOne(int idx) {
		ReplyDTO dto = null;
		String sql = "select * from reply where idx = ?";
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
	
	
}
