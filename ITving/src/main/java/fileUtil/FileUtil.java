package fileUtil;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.BoardDTO;
import member.MemberDTO;
import program.ProgramDTO;

public class FileUtil {
	private String saveDirectory = "C:\\upload";
	private static String encoding = "UTF-8";
	private static int maxPostSize = 1024*1024*20;
	private static FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	private static FileUtil instance = new FileUtil();
	private FileUtil() {}
	public static FileUtil getInstance() { return instance; }
	
	
	
	public ProgramDTO getProgramDTO(HttpServletRequest request) throws Exception {
		ProgramDTO dto = null;
		
//		if(saveDirectory == null) {
//			ServletContext application = request.getServletContext();
//			saveDirectory = application.getRealPath("/upload");
//			File dir = new File(saveDirectory);
//			dir.mkdirs();
//		}
		
		MultipartRequest mpRequest = new MultipartRequest (
				request, saveDirectory, maxPostSize,encoding, policy
		);
		
		String category = mpRequest.getParameter("category");
		String title = mpRequest.getParameter("title");
		File image = mpRequest.getFile("image");
		String content = mpRequest.getParameter("content");
		
		dto = new ProgramDTO();
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setImage(image.getName());
		dto.setContent(content);
		
		return dto;
	}
	
	public MemberDTO getMemberDTO(HttpServletRequest request) throws Exception {
		MemberDTO dto = null;
		
		MultipartRequest mpRequest = new MultipartRequest (
				request, saveDirectory, maxPostSize,encoding, policy
		);
		
		String userid = mpRequest.getParameter("userid");
		String userpw = mpRequest.getParameter("userpw");
		String nickname = mpRequest.getParameter("nickname");
		String pnum = mpRequest.getParameter("pnum");
		File image = null;
		if(mpRequest.getFile("image") != null) {
			image = mpRequest.getFile("image");
		}
		
		dto = new MemberDTO();
		dto.setUserid(userid);
		dto.setUserpw(userpw);
		dto.setNickname(nickname);
		dto.setPnum(pnum);
		if(image != null) {
			dto.setImage(image.getName());
		}else {
			String str = "default_profile.png";
			dto.setImage(str);
		}
		
		return dto;
	}
	
	public BoardDTO getBoardDTO(HttpServletRequest request) throws Exception {
		BoardDTO dto = null;
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		int program_idx = Integer.parseInt(mpRequest.getParameter("program_idx"));
		int idx = Integer.parseInt(mpRequest.getParameter("idx"));
		String title = mpRequest.getParameter("title");
		String content = mpRequest.getParameter("content");
		String writer = mpRequest.getParameter("writer");
		File uploadFile = mpRequest.getFile("uploadFile");
		dto = new BoardDTO();
		if(uploadFile != null) {
			dto.setImage(uploadFile.getName());
		}
		dto.setIdx(idx);
		dto.setProgram_idx(program_idx);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setWriter(writer);
		return dto;
	}

}
