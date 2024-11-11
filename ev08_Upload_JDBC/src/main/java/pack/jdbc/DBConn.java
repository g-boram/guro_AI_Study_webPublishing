package pack.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import pack.dto.DataBean;

public class DBConn {
	// DAO
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	// DB 접속용 메서드
	public Connection mtdDBConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/ev08_Test?";
			url += "useSSL=false&";
			url += "useUnicode=true&";
			url += "characterEncoding=UTF8&";
			url += "serverTimezone=Asia/Seoul&";
			url += "allowPublicKeyRetrieval=true";

			String uid = "root";
			String upw = "goboram";

			conn = DriverManager.getConnection(url, uid, upw);

		} catch (ClassNotFoundException e) {
			System.out.print(e.getMessage());
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}

		return conn;

	}


	// 입력용 메서드 시작
	public boolean mtdInsert(HttpServletRequest req, DataBean dataBean) {

		String remoteIp = req.getRemoteAddr();

		boolean chk =false;
		try {
			String sql = "insert into uploadTbl ";
			sql += "(writer, originalFile, uploadFile, fileType, fileSize, remoteIP) ";
			sql += "values (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dataBean.getWriter());
			pstmt.setString(2, dataBean.getOriginalFile());
			pstmt.setString(3, dataBean.getUploadFile());
			pstmt.setString(4, dataBean.getFileType());
			pstmt.setInt(5, dataBean.getFileSize());
			pstmt.setString(6, remoteIp);
			int rtnCnt = pstmt.executeUpdate();
			if(rtnCnt == 1) {
				chk = true;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return chk;
	}

	// 입력용 메서드  끝

}






