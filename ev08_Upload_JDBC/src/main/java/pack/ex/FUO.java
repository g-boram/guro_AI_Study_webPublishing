package pack.ex;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.jni.File;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack.dto.DataBean;

public class FUO {

    public boolean mtdUpload(HttpServletRequest req, DataBean dataBean) {

        boolean chk = false;

        // Mac에서 사용할 업로드 폴더 경로 설정
        String saveFolder = req.getServletContext().getRealPath("/uploads");
        File uploadDir = new File(saveFolder);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();  // 폴더가 없으면 생성
        }

        int maxSize = 10 * 1024 * 1024;  // 10MB
        String encType = "UTF-8";

        String writer = "";
        String originalFile = "";  // 원본 파일명
        String uploadFile = "";    // 업로드된 파일명
        int fileSize = 0;          // 파일 크기

        long startTime = System.currentTimeMillis();  // 업로드 시작 시간 기록

        try {
            MultipartRequest multiReq = new MultipartRequest(
                req,
                saveFolder,
                maxSize,
                encType,
                new DefaultFileRenamePolicy()
            );

            writer = multiReq.getParameter("writer");
            originalFile = multiReq.getOriginalFileName("fileName");
            uploadFile = multiReq.getFilesystemName("fileName");
            String fileType = multiReq.getContentType("fileName");

            File file = multiReq.getFile("fileName");
            fileSize = (int) file.length();

            // 데이터 빈 설정
            dataBean.setWriter(writer);
            dataBean.setOriginalFile(originalFile);
            dataBean.setUploadFile(uploadFile);
            dataBean.setFileType(fileType);
            dataBean.setFileSize(fileSize);

            chk = true;

        } catch (IOException e) {
            System.out.print(e.getMessage());
        }

        long endTime = System.currentTimeMillis();  // 업로드 완료 시간 기록
        long duration = endTime - startTime;  // 소요 시간 계산

        // 소요 시간 출력
        System.out.println("파일 업로드 소요 시간: " + duration + " 밀리초");

        return chk;
    }
}
