package pro02;

public class Memberbean {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birthday;
	private String email;
	private String zipcode;
	private String address;
	private String hobby[];
	private String job;
	
	public String getId()
	{
		return id;
	}
	
	public String getPwd()
	{
		return pwd;
	}
	
	public String getName()
	{
		return name;
	}
	
	public String getGender()
	{
		return gender;
	}
	
	public String getBirthday()
	{
		return birthday;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public String getZipcode() {
		return zipcode;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String[] getHobby() {
		return hobby;
	}
	
	public String getJob()
	{
		return job;
	}
	
	public void setId(String id)
	{
		this.id = id;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	
	public void setJob(String job) {
		this.job = job;
	}
	
}
