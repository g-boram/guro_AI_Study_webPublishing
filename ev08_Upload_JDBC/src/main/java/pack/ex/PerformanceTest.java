package pack.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.jni.File;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack.dto.DataBean;
import pack.jdbc.DBConn;

public class PerformanceTest {

    public boolean uploadAndSave(HttpServletRequest req, DataBean dataBean) {
        boolean chk = false;
        long uploadStartTime = System.currentTimeMillis();

        String saveFolder = "D:\\upFolder";
        int maxSize = 10 * 1024 * 1024; // 최대 10MB
        String encType = "UTF-8";

        try {
            MultipartRequest multiReq = new MultipartRequest(
                    req,
                    saveFolder,
                    maxSize,
                    encType,
                    new DefaultFileRenamePolicy()
            );

            // 파일 업로드 정보 설정
            String writer = multiReq.getParameter("writer");
            String originalFile = multiReq.getOriginalFileName("fileName");
            String uploadFile = multiReq.getFilesystemName("fileName");
            String fileType = multiReq.getContentType("fileName");

            File file = multiReq.getFile("fileName");
            int fileSize = (int) file.length();

            // 데이터 빈 설정
            dataBean.setWriter(writer);
            dataBean.setOriginalFile(originalFile);
            dataBean.setUploadFile(uploadFile);
            dataBean.setFileType(fileType);
            dataBean.setFileSize(fileSize);

            long uploadEndTime = System.currentTimeMillis();
            System.out.println("파일 업로드 소요 시간: " + (uploadEndTime - uploadStartTime) + "ms");

            // DB 저장 시작
            DBConn dbConn = new DBConn();
            Connection conn = dbConn.mtdDBConn();

            long dbStartTime = System.currentTimeMillis();
            chk = saveToDatabase(conn, req, dataBean);
            long dbEndTime = System.currentTimeMillis();

            System.out.println("DB 저장 소요 시간: " + (dbEndTime - dbStartTime) + "ms");
            System.out.println("총 작업 소요 시간: " + (dbEndTime - uploadStartTime) + "ms");

        } catch (IOException e) {
            System.out.println("파일 업로드 중 오류 발생: " + e.getMessage());
        }

        return chk;
    }

    private boolean saveToDatabase(Connection conn, HttpServletRequest req, DataBean dataBean) {
        String remoteIp = req.getRemoteAddr();
        boolean chk = false;

        try {
            String sql = "INSERT INTO uploadTbl (writer, originalFile, uploadFile, fileType, fileSize, remoteIP) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dataBean.getWriter());
            pstmt.setString(2, dataBean.getOriginalFile());
            pstmt.setString(3, dataBean.getUploadFile());
            pstmt.setString(4, dataBean.getFileType());
            pstmt.setInt(5, dataBean.getFileSize());
            pstmt.setString(6, remoteIp);

            int rtnCnt = pstmt.executeUpdate();
            if (rtnCnt == 1) {
                chk = true;
            }

            pstmt.close();
            conn.close(); // 연결 종료

        } catch (SQLException e) {
            System.out.println("DB 저장 중 오류 발생: " + e.getMessage());
        }

        return chk;
    }
}
