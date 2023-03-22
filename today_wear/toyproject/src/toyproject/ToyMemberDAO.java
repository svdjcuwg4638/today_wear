package toyproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ToyMemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static ToyMemberDAO instance = new ToyMemberDAO();
	
	public static ToyMemberDAO getInstance() {
		return instance;
	}
	
	public ToyMemberDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) try {conn.close(); } catch (SQLException e) {}
		}
		
	}
	
	private ToyMemberDTO mapping(ResultSet rs) throws SQLException {
		ToyMemberDTO dto = new ToyMemberDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setAge(rs.getInt("age"));
		dto.setGender(rs.getString("gender"));
		dto.setUserId(rs.getString("userId"));
		dto.setUserPw(rs.getString("userPw"));
		dto.setLocation(rs.getString("location"));
		return dto;
	}
	
	private void close() {
		try {
			if(rs != null) 		rs.close();
			if(pstmt != null) 	pstmt.close();
			if(conn != null) 	conn.close();
		} catch(Exception e) {}
	}
	
	public ArrayList<ToyMemberDTO> selectList() {
		ArrayList<ToyMemberDTO> list = new ArrayList<ToyMemberDTO>();
		String sql = "select * from toymember order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ToyMemberDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
	public int modify(ToyMemberDTO user) {
		int row=0;
		String sql="update toymember set name=?, age=?, gender=?, userPw=?, location=? where userId=?";
		
		try {
			conn= ds.getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setInt(2, user.getAge());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getUserPw());
			pstmt.setString(5, user.getLocation());
			pstmt.setString(6, user.getUserId());
			row=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return row;
	}
	
	public ToyMemberDTO login(ToyMemberDTO user) {
		ToyMemberDTO dto = selectOne(user.getUserId());
		if(dto == null) return dto=null;
		if(user.getUserId().equals(dto.getUserId()) && user.getUserPw().equals(dto.getUserPw())) {
			return dto;
		}
		else {
			return dto=null;
		}		
	}
	
	public ToyMemberDTO selectOne(String userid) {
		String sql = "select * from toymember where userid='" + userid +"'";
		ToyMemberDTO dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return dto;
	}
	
	public int insert(ToyMemberDTO ob) {
		int row = 0;
		String sql = "insert into toymember (name, age, gender, userid, userpw, location) values(?,?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ob.getName());
			pstmt.setInt(2, ob.getAge());
			pstmt.setString(3, ob.getGender());
			pstmt.setString(4, ob.getUserId());
			pstmt.setString(5, ob.getUserPw());
			pstmt.setString(6, ob.getLocation());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	public int update(ToyMemberDTO ob) {
		int row = 0;
		String sql = "update toymember set name=?, age=?, gender=?, userid=?, userpw=?, location=? where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ob.getName());
			pstmt.setInt(2, ob.getAge());
			pstmt.setString(3, ob.getGender());
			pstmt.setString(4, ob.getUserId());
			pstmt.setString(5, ob.getUserPw());
			pstmt.setString(6, ob.getLocation());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	public int delete(ToyMemberDTO user) {
		int row = 0;
		String sql = "delete from toymember where userId='" + user.getUserId()+"'";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { close(); }
		return row;
	}

}
