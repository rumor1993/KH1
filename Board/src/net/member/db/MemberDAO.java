package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


/*
 	DAO(Data Access Object) 클래스
 	- 데이터 베이스와 연동하여 레코드의 추가, 수정, 삭제 작업이
 	이루어지는 클래스 입니다.
 	
 	- 어떤 Action 클래스가 호출되더라도 그에 해당하는 데이터베이스
 	연동 처리는 DAO 클래스에서 이루어지게 됩니다.
 */

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	
	// 생성자에게 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			
		}catch(Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public int isId(String id, String pass) {
		try {
			con =ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "select id, password from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(2).equals(pass)) {
					result = 1; // 아이디와 비밀번호 일치하는 경우
				}else {
					result = 0; // 비밀번호가 일치하지 않는 경우
				}

			}else {
				result = -1; // 아이디가 존재하지 않는 경우
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public List<Member> getList() {
		List<Member> list = new ArrayList<Member>();
		try {
			con=ds.getConnection();
			
			String sql = "select * from member ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			/*
			 	create table member(
			 				id	varchar2(15),
			 				password varchar2(10),
			 */
			while(rs.next()) {
			Member member = new Member();
			member.setId(rs.getString(1));
			member.setPassword(rs.getString(2));
			member.setName(rs.getString(3));
			member.setAge(rs.getInt(4));
			member.setGender(rs.getString(5));
			member.setEmail(rs.getString(6));
			list.add(member);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}

	public Member member_info(String id) {
		Member m = null;
		try {
			con = ds.getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				m = new Member();
				m.setId(rs.getString(1));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAge(rs.getInt(4));
				m.setGender(rs.getString(5));
				m.setEmail(rs.getString(6));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		return m;
	
	}

/*	public int member_delete(String id) {
		try {
			con = ds.getConnection();
			String sql = "delete from member where id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			if(!id.equals("admin")) {
			result = pstmt.executeUpdate();
			}else {
			result = -1;
			}
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/
	
	 public void member_delete(String id) {

	      try {
	         con = ds.getConnection();
	         String sql = "delete from member where id = ? ";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (pstmt != null) {
	            try {
	               pstmt.close();
	            } catch (SQLException sq) {
	               sq.printStackTrace();
	            }
	         }
	         if (con != null) {
	            try {
	               con.close();
	            } catch (SQLException sq) {
	               sq.printStackTrace();
	            }
	         }
	      }
	 }

	public int member_update(Member m) {
		try {
			con = ds.getConnection();
			String sql = "UPDATE member SET NAME=?, AGE=?, GENDER=?, EMAIL=? WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			System.out.println(m.getId());


			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getId());
			
			result = pstmt.executeUpdate();
			
		 } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         if (pstmt != null) {
	            try {
	               pstmt.close();
	            } catch (SQLException sq) {
	               sq.printStackTrace();
	            }
	         }
	         if (con != null) {
	            try {
	               con.close();
	            } catch (SQLException sq) {
	               sq.printStackTrace();
	            }
	         }
	      }
		return result;
	 }

	public int Insert(Member m) {
		try {
			con = ds.getConnection();
			String sql ="INSERT INTO member(ID,PASSWORD,NAME,AGE,GENDER,EMAIL) VALUES (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getAge());
			pstmt.setString(5,m.getGender());
			pstmt.setString(6, m.getEmail());
			
			result = pstmt.executeUpdate();
			
			
		
		}catch (SQLIntegrityConstraintViolationException e) {
	         result = -1;
	         System.out.println("멤버 아이디 중복에러입니다.");
	      }catch(Exception e) {
	    	  e.printStackTrace();
	      }finally {
	      }
	         if (pstmt != null) {
	            try {
	               pstmt.close();
	            } catch (SQLException sq) {
	               sq.printStackTrace();
	            }
	         }
	         if (con != null) {
	            try {
	               con.close();
	            } catch (SQLException sq) {
	               sq.printStackTrace();
	            }
	         }
	      
		return result;
	}
	
}
