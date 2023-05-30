package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class memberDao {


		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		private static memberDao mdao;

		private memberDao() {
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


		public static memberDao getInstance() {
			if(mdao==null)
				mdao = new memberDao();
			return mdao;
		}	
		
		private memberBean getMemberDTO(ResultSet rs2) throws SQLException {

			memberBean member = new memberBean();
			member.setMid(rs2.getString("mid"));
			member.setMname(rs2.getString("mname"));
			member.setMpw(rs2.getString("mpw"));
			member.setMtel(rs2.getInt("mtel"));

			return member;
		
		}
		
		public int insertMember(String name,String id, String pw,String tel) {
			int cnt=-1;
			String sql="insert into member values(?,?,?,?)";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, name);
				ps.setString(3, pw);
				ps.setString(4, tel);

				cnt = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(ps != null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			
			return cnt;
		}
	public memberBean searchPass(String mid,String mname, String mtel) {
			
			memberBean member = null;
	
			
			String sql="select * from member where mid=? and mname=? and mtel=?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, mid);
				ps.setString(2, mname);
				ps.setString(3, mtel);

				rs = ps.executeQuery();

				if(rs.next()) {
					member = getMemberDTO(rs);
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
			
			
			return member;
			
		}

		public memberBean getMemberInfo(String id, String pw) {

			String sql = "select * from member where mid=? and mpw=?";

			memberBean member = null;
			try {
				ps = conn.prepareStatement(sql);

				ps.setString(1, id);
				ps.setString(2, pw);

				rs = ps.executeQuery();

				if(rs.next()) {
					member = getMemberDTO(rs);
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

			return member;
		}
		
		public  memberBean  searchId(String mname,String mtel) {
			
			memberBean member = null;
			System.out.println(mname);
			System.out.println(mtel);
			
			String sql="select * from member where mname=? and mtel=?";
			try {
				ps = conn.prepareStatement(sql);

				ps.setString(1, mname);
				ps.setString(2, mtel);

				rs = ps.executeQuery();

				if(rs.next()) {
					member = getMemberDTO(rs);
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
			
			
			return member;
		}
	}

