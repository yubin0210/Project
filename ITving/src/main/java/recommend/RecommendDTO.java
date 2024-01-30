package recommend;

//	IDX          NOT NULL 	NUMBER(500) 
//	PERSON       NOT NULL 	VARCHAR2(500) 
//	CATEGORY              	VARCHAR2(500) 
//	CATEGORY_IDX NOT NULL 	NUMBER        
//	ISLIKE               	NUMBER

public class RecommendDTO {
	private int idx;
	private String person;
	private String category;
	private int category_idx;
	private int isLike;
	private int count;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCategory_idx() {
		return category_idx;
	}
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}
	public int getIsLike() {
		return isLike;
	}
	public void setIsLike(int isLike) {
		this.isLike = isLike;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
}
