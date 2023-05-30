package board;

public class reviewBean {
private String rid;
private String rname;
private String review;
private String rdate;

public reviewBean() {
	super();
}

public reviewBean(String rid, String rname, String review, String rdate) {
	super();
	this.rid = rid;
	this.rname = rname;
	this.review = review;
	this.rdate = rdate;
}

public String getRid() {
	return rid;
}
public void setRid(String rid) {
	this.rid = rid;
}
public String getRname() {
	return rname;
}
public void setRname(String rname) {
	this.rname = rname;
}
public String getReview() {
	return review;
}
public void setReview(String review) {
	this.review = review;
}
public String getRdate() {
	return rdate;
}
public void setRdate(String rdate) {
	this.rdate = rdate;
}
}
