package program;

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

public class ProgramDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static ProgramDAO instance = new ProgramDAO();
	public static ProgramDAO getInstance() { return instance; }
	private ProgramDAO() {
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
	
	private ProgramDTO mapping(ResultSet rs) throws SQLException{
		ProgramDTO dto = new ProgramDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setCategory(rs.getString("category"));
		dto.setImage(rs.getString("image"));
		dto.setContent(rs.getString("content"));
		return dto;
	}
	
	public int insert(ProgramDTO dto) {
		int row = 0;
		String sql = "insert into program "
				+ " (category, title, image, content) "
				+ " values (?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getImage());
			pstmt.setString(4, dto.getContent());
			row = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return row;
	}
	
	public List<ProgramDTO> selectList() {
		ArrayList<ProgramDTO> list = new ArrayList<>();
		String sql = "select * from program order by idx desc";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	public List<ProgramDTO> selectList(String search) {
		ArrayList<ProgramDTO> list = new ArrayList<>();
		String sql = "select * from program "
				+ "    where "
				+ "        title like '%' || ? || '%' "
				+ "    order by title";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	public List<ProgramDTO> selectCategoryList(String category) {
		ArrayList<ProgramDTO> list = new ArrayList<>();
		String sql = "select * from program where category = ? order by idx";
//				+ "    where "
//				+ "        title like '%' || ? || '%' "
//				+ "    order by title";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return list;
	}
	
	public ProgramDTO selectOne(int idx) {
		ProgramDTO dto = null;
		String sql = "select * from program where idx = ?";
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
	
	public int update(ProgramDTO dto) {
		int row = 0;
		String sql = "update program set category = ?, title = ?, image = ?, content = ?"
				+ "		where idx = ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getImage());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getIdx());
			row = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return row;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete from program where idx=?";
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

}
