package video;

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

public class VideoDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static VideoDAO instance = new VideoDAO();
	public static VideoDAO getInstance() { return instance; }
	private VideoDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) { e.printStackTrace(); }
	}
	
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {}
	}
	
	public List<VideoDTO> selectList(int program_idx) {
		ArrayList<VideoDTO> list = new ArrayList<>();
		String sql = "select * from video where program_idx= ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, program_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VideoDTO dto = new VideoDTO();
				dto.setLink(rs.getString("link"));
				dto.setProgram_idx(rs.getInt("program_idx"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}

}
