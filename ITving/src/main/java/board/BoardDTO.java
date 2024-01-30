package board;

import java.sql.Date;

//	IDX         NOT NULL NUMBER         
//	PROGRAM_IDX NOT NULL NUMBER         
//	TITLE       NOT NULL VARCHAR2(1000) 
//	CONTENT     NOT NULL VARCHAR2(4000) 
//	WRITER      NOT NULL VARCHAR2(500)  
//	VIEWCOUNT            NUMBER         
//	WRITEDATE            DATE           
//	IMAGE                VARCHAR2(1000)

public class BoardDTO {
	
	private int idx;
	private int program_idx;
	private String title;
	private String content;
	private String writer;
	private int viewCount;
	private Date writeDate;
	private String image;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getProgram_idx() {
		return program_idx;
	}
	public void setProgram_idx(int program_idx) {
		this.program_idx = program_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	

}
