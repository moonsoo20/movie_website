package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class reviewDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	reviewBean rb= new reviewBean();

	private static reviewDao rdao;

	private reviewDao() {
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

	public static reviewDao getInstance() {
		if(rdao==null)
			rdao = new reviewDao();
		return rdao;
	}
	public int getArticleCount(String rname){

		int count = 0;
		String sql = "select count(*) as cnt from review where rname=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, rname);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} try {
			if(ps != null)
				ps.close();
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("전체 레코드 갯수:" + count);
		return count;
	}
	
	public ArrayList<reviewBean> getArticles(String rname,int start, int end){
		//		1페이지 : 1,5
		//		2페이지 : 6,10

		ArrayList<reviewBean> lists = new ArrayList<reviewBean>();

		//3.sql문 작성, 분석
		String sql = "select rid, rname,review,rdate from (select rownum as rank,rid,rname,review,rdate from review where rname=?) where rank between ? and ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, rname);
			ps.setInt(2,start);
			ps.setInt(3,end);

			if (ps != null)
				System.out.println("SQL문 분석 성공");
			else
				System.out.println("SQL문 분석 실패");

			//4.sql문 실행
			rs = ps.executeQuery();
			if (rs != null)
				System.out.println("select 실행 성공");
			else
				System.out.println("select 실행 실패");

			while(rs.next()){
				reviewBean rb = new reviewBean();

				rb.setRid(rs.getString("rid"));
				rb.setRname(rs.getString("Rname"));
				rb.setReview(rs.getString("Review"));
				rb.setRdate(rs.getString("rdate"));

				lists.add(rb);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			//5.자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return lists;
	}

}
