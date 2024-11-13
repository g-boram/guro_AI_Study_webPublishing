package pack.dao;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.sql.Statement;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import pack.dbcp.DBCP;
import pack.dto.MemberBean;
import pack.dto.ZipcodeBean;


public class MemberMgr {
	

	  Connection conn= null;
      Statement stmt = null;
      ResultSet  objRS = null;
      PreparedStatement pstmt = null; 
      DBCP dbcp = null;
      
      
      /* 아이디 중복 검사 시작(/member/idCheck.jsp) */ 
      public boolean checkId(String id) {
    	  
    	  boolean res = false; 
    	  // 임시 초기화, ID 사용 가능여부를 판별하는 변수 
    	  // true면 입력한 ID는 사용불가, false면 입력한 ID는 사용가능
    	  try {
    		  conn = dbcp.mtdConn();
    		  
    		  String sql = "select count(*) from member where uId = ?"; 
    		  
    		  pstmt = conn.prepareStatement(sql);
    		  pstmt.setString(1, id);
    		  objRS = pstmt.executeQuery();
    		  
	    		  if (objRS.next()) {
	    			  int recordCnt = objRS.getInt(1);
	    		      
	    			  if (recordCnt == 1) res = true;
	    			  
	    		  }
		  } catch (Exception e) {
			  System.out.print("오류발생 : " + e.getMessage());
		  } finally {
			  try { 
				  conn.close(); 
			  } catch (Exception ex) { 
				  System.out.println(ex.getMessage());
		      }
		  }
    	  return res;
      }
      /* 아이디 중복 검사 끝(/member/idCheck.jsp) */
      
      
      
      /* 우편번호 찾기 시작(/member/zipCheck.jsp) */ 
      public List<ZipcodeBean> zipcodeRead(String area3) {
    	  
    	  List<ZipcodeBean> objList = new Vector<>(); 
    	  
    	  try {
    		  conn = dbcp.mtdConn();
    		  String sql = "select zipcode, area1, area2, area3, area4 "; 
    		  		   sql += " from tblZipcode where area3 like ?";
    		  		   
    		  pstmt = conn.prepareStatement(sql); 
    		  pstmt.setString(1, "%"+ area3 +"%"); 
    		  objRS = pstmt.executeQuery();
    		  
	    	  while (objRS.next()) {
	    		  
	    		  ZipcodeBean zipBean = new ZipcodeBean(); 
	    		  
	    		  zipBean.setZipcode(objRS.getString(1)); 
	    		  zipBean.setArea1(objRS.getString(2)); 
	    		  zipBean.setArea2(objRS.getString(3)); 
	    		  zipBean.setArea3(objRS.getString(4)); 
	    		  zipBean.setArea4(objRS.getString(5));
	    		  objList.add(zipBean);
	    	  }
	    	  
    	  } catch (Exception e) {
    		  System.out.print("오류발생 : " + e.getMessage());
    	  } finally {
    		  try { 
    			  conn.close(); 
    		  } catch (Exception ex) { 
    			  System.out.println(ex.getMessage());
    		  }
    	  }
    	  return objList;
     }
     /* 우편번호 찾기 끝(/member/zipCheck.jsp) */
      
      
      /* 회원가입 시작 (/member/memberProc.jsp) */ 
      public boolean insertMember(MemberBean bean) {
    	  System.out.println("bean: " + bean);
    	  
    	  boolean flag = false;
    	  
    	  try {
	    	  conn = dbcp.mtdConn();
	    	  String sql = "insert into member (";
	    	  sql += "uId, uPw, uName, uEmail, gender, uBirthday, "; 
	    	  sql += "uZipcode, uAddr, uHobby, uJob, joinTM) values ("; 
	    	  sql += "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()";
	    	  sql += ")";
	    	  
	    	  pstmt = conn.prepareStatement(sql);
	    	  pstmt.setString(1, bean.getuId());
	    	  pstmt.setString(2, bean.getuPw());
	    	  pstmt.setString(3, bean.getuName());
	    	  pstmt.setString(4, bean.getuEmail());
	    	  pstmt.setString(5, bean.getGender());
	    	  pstmt.setString(6, bean.getuBirthday()); 
	    	  pstmt.setString(7, bean.getuZipcode()); 
	    	  pstmt.setString(8, bean.getuAddr());
	    	  
	    	  String[] hobby = bean.getuHobby(); // {"여행", "게임", "운동"} 
	    	  String[] hobbyName = {"인터넷", "여행", "게임", "영화", "운동"}; 
	    	  char[] hobbyCode = {'0', '0', '0', '0', '0'};
	    	  
	    	  for (int i=0; i<hobby.length; i++) {
		    	  for(int j=0; j<hobbyName.length; j++) {
		    	  
		    		  if (hobby[i].equals(hobbyName[j])) { // i : 1, j : 2
		    			  hobbyCode[j] = '1';
		    		  } 
		    	  }
	    	  }
	    	  // char[] => hobbyCode => {'0', '1', '1', '0', '1'} j : 1,2,4
	    	  // j: 01234
	    	  // char[] 변수a => new String(변수a); => char[] 자료형이 String 자료형으로 변경됨 // {'0', '1', '1', '0', '1'} => new String( ) => "01101"
	    	  // String[] 변수b => new Strin(변수b); (X)
	    	  pstmt.setString(9, new String(hobbyCode));
	    	  pstmt.setString(10, bean.getuJob()); 
	    	  int rowCnt = pstmt.executeUpdate();
	    	  
	    	  if (rowCnt == 1) flag = true;
    	  
    	  } catch (Exception e) {
    		  System.out.print("오류발생 : " + e.getMessage());
    	  } finally {
    		  try { 
    			  conn.close(); 
    		  } catch (Exception ex) { 
    			  System.out.println(ex.getMessage());
    		  }
    	  }
    	  return flag;
      }
      /* 회원가입 끝 (/member/memberProc.jsp) */
      
      
      
      /* 로그인 처리 시작 (/member/loginProc.jsp) */ 
      public boolean loginMember(String id, String pw) {
    	  boolean loginChkTF = false; 
    	  
    	  try {
	    	  conn = dbcp.mtdConn();
	    	  String sql = "select count(*) from member where uId = ? and uPw = ?"; 
	    	  
	    	  pstmt = conn.prepareStatement(sql);
	    	  pstmt.setString(1, id);
	    	  pstmt.setString(2, pw);
	    	  
	    	  objRS = pstmt.executeQuery(); 
	    	  
	    	  if (objRS.next()) {
	    		  int recordCnt = objRS.getInt(1);
	    		  if (recordCnt == 1) loginChkTF = true;
	    	  }
    	  } catch (Exception e) {
    		  System.out.print("오류발생 : " + e.getMessage());
    	  } finally {
    		  try { 
    			  conn.close(); 
    		  } catch (Exception ex) { 
    			  System.out.println(ex.getMessage());
    		  }
    	  }
    	  return loginChkTF;
       }
       /* 로그인 처리 끝 (/member/loginProc.jsp) */
      
      /* 회원정보 수정 시작 (/member/memberModProc.jsp) */ 
      public MemberBean modifyMember(String id) {
    	  MemberBean mBean = new MemberBean();
    	  // Statement => 매개변수가 없을 경우
    	  // PreparedStatement => 매개변수가 있을 경우
    	  try {
    		  try {
    		  conn = dbcp.mtdConn();
    		  String sql = "select uId, uPw, uName, uEmail, ";
    		  sql += " gender, uBirthday, uZipcode, ";
    		  sql += " uAddr, uHobby, uJob, joinTM ";
    		  sql += " from member where uId = ?"; pstmt = conn.prepareStatement(sql);
    		  pstmt.setString(1, id);
    		  objRS = pstmt.executeQuery();
    		  if (objRS.next()) { mBean.setuId(objRS.getString("uId"));
    		  }
    		  mBean.setuPw(objRS.getString("uPw")); mBean.setuName(objRS.getString("uName")); mBean.setuEmail(objRS.getString("uEmail")); mBean.setGender(objRS.getString("gender")); mBean.setuBirthday(objRS.getString("uBirthday")); mBean.setuZipcode(objRS.getString("uZipcode")); mBean.setuAddr(objRS.getString("uAddr")); String[] hobbyAry = new String[5];
    		  String hobby = objRS.getString("uHobby");
    		  // "가나다AB"
    		  hobbyAry = hobby.split(""); // 인덱스0 "가" 인덱스1 "나" 
    		  //System.out.println("split 결과 : " + Arrays.toString(hobbyAry)); 
    		  mBean.setuHobby(hobbyAry);
    		  mBean.setuJob(objRS.getString("uJob"));
    		  } catch (Exception e) {
    		  System.out.print("오류발생 : " + e.getMessage());
    		  } finally {
    			  try { 
    				  conn.close(); 
    			  } catch (Exception ex) { 
    				  System.out.println(ex.getMessage());
    			  }
    		  }
    		  return mBean;
    		    
    	  }
    	 /* 회원정보 수정 끝 (/member/memberModProc.jsp) */
    	  
    	  /* 로그인 사용자 이름 반환(/bbs/write.jsp) 시작 */ 
    	  public String getMemberName(String uId) {
    		  String uName = ""; 
    		  String sql = null;
    		  
    		  try {
    			  conn = dbcp.mtdConn();
    			  sql = "select uName from member where uId=?";
    			  pstmt = conn.prepareStatement(sql); pstmt.setString(1, uId);
    			  objRS = pstmt.executeQuery(); if (objRS.next()) {
    			                                uName = objRS.getNString(1);
    			  }
    		  }catch (Exception e) {
    			  System.out.print("오류발생 : " + e.getMessage());
    		  } finally {
    		  try { conn.close(); } catch (Exception ex) { System.out.println(ex.getMessage());}
    		  }
    		  return uName;
    		  }
    	  /* 로그인 사용자 이름 반환(/bbs/write.jsp) 끝 */
    	  
}