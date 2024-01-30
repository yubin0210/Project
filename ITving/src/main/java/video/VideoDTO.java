package video;

//	PROGRAM_IDX NOT NULL NUMBER         
//	LINK        NOT NULL VARCHAR2(2000)

public class VideoDTO {
	
	private int program_idx;
	private String link;
	
	public int getProgram_idx() {
		return program_idx;
	}
	public void setProgram_idx(int program_idx) {
		this.program_idx = program_idx;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	

}
