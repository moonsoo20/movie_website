package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class movieDao {
	movieBean mb= new movieBean();
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static movieDao mdao;
	
	private movieDao() {
		Context initContext; 
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static movieDao getInstance() {
		if(mdao==null)
			mdao = new movieDao();
		return mdao;
	}
	
	
	public ArrayList<movieBean> searchMovieName() {
		
		String sql= "select distinct mname from movie";
		
		ArrayList<movieBean> mlist= new ArrayList<movieBean>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String mname= rs.getString("Mname");
				movieBean mb= new movieBean();
				mb.setMname(mname);
				mlist.add(mb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
		return mlist;
		
		
	}
	
	public ArrayList<movieBean> searchTime(String mname,String mdate) {
		
		String sql= "select time from movie where mname=? and mdate=?";
		ArrayList<movieBean> tlist= new ArrayList<movieBean>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mname);
			ps.setString(2, mdate);
			rs = ps.executeQuery();
			while(rs.next()) {
				String time= rs.getString("time");
				movieBean mb= new movieBean();
				mb.setTime(time);
				tlist.add(mb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		for(int i=0; i<tlist.size(); i++) {
			tlist.get(i).getTime();
		}
		
	
		return tlist;
		

		
		
	}
}
