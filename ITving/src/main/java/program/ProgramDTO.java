package program;

//	IDX      NOT NULL NUMBER         
//	TITLE    NOT NULL VARCHAR2(500)  
//	CATEGORY NOT NULL VARCHAR2(500)  
//	IMAGE    NOT NULL VARCHAR2(1000) 
//	CONTENT  NOT NULL VARCHAR2(2000)

public class ProgramDTO {
	private int idx;
	private String title;
	private String category;
	private String image;
	private String content;
	private int likeCount;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
	

}
