package member;

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

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() { return instance; }
	private MemberDAO() {
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
	
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setUserid(rs.getString("userid"));
		dto.setUserpw(rs.getString("userpw"));
		dto.setNickname(rs.getString("nickname"));
		if(rs.getString("image") != null) {
			dto.setImage(rs.getString("image"));
		}
		dto.setPnum(rs.getString("pnum"));
		return dto;
	}
	public List<MemberDTO> selectList() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		String sql = "select * from member order by idx";
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
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = null;
		String sql = "select * from member where userid=? and userpw = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				login = mapping(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return login;
	}
	
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql = "insert into member (userid, userpw, nickname, pnum, image) "
				+ " values (?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getNickname());
			pstmt.setString(4, dto.getPnum());
			pstmt.setString(5, dto.getImage());
			row = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return row;
	}
	
	public int update(MemberDTO dto) {
		int row = 0;
		String sql = "update member set "
				+ "	userid = ?, userpw = ?, nickname = ?, pnum = ?, image = ? "
				+ " where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getNickname());
			pstmt.setString(4, dto.getPnum());
			pstmt.setString(5, dto.getImage());
			pstmt.setInt(6, dto.getIdx());
			row = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return row;
	}
	
	public MemberDTO searchID(String pnum) {
		MemberDTO dto = null;
		String sql = "select * from member where pnum = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return dto;
	}
	
	public MemberDTO searchPW(String userid) {
		MemberDTO dto = null;
		String sql = "select * from member where userid = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return dto;
	}
	
	public MemberDTO selectOne(String writer) {
		MemberDTO dto = null;
		String sql = "select * from member where userid = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	public int delete(int idx) {
	      int row = 0;
	      String sql = "delete from member where idx = ?";
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
