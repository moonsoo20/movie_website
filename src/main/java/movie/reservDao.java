package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class reservDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "jspid";
	String pw = "jsppw";
	Connection conn=null;
	PreparedStatement ps= null;
	ResultSet rs= null;

	
	private static reservDao rdao;
	
	private reservDao() {
		try {
			Class.forName(driver);
	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
	
		}
	}

	public void getConnection() {
		try {
			
			conn=DriverManager.getConnection(url,id,pw);
	
		}
		catch (SQLException e) {
			e.printStackTrace();
		
		}

	}


	public static reservDao getInstance() {
		if(rdao==null)
			rdao = new reservDao();
		return rdao;
	}
	
	
	public int searchSeat(String seatNum,String mname,String mdate,String time) {
		getConnection();
		PreparedStatement ps = null;
		
		int cnt=-1;
		String sql="select * from reserv where rseat=? and rname=? and rdate=? and rtime=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,seatNum);
			ps.setString(2,mname);
			ps.setString(3,mdate);
			ps.setString(4,time);
			
			cnt= ps.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null)
					conn.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	return cnt;
	}
	
	public int insertReserv(String rid,String rname,String rdate,String rtime,String rseat) {
		getConnection();
		PreparedStatement ps = null;
		
		int cnt=-1;
		String sql="insert into reserv values(?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,rid);
			ps.setString(2, rname);
			ps.setString(3, rdate);
			ps.setString(4, rtime);
			ps.setString(5, rseat);

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null)
					conn.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	return cnt;
		
	}
}
