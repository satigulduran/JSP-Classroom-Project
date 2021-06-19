package studentoperation;

public class studentbilgisi {

	private String student_name,student_mail,student_password,student_time;
	private int student_id;
		public int getstudent_id() {
			return student_id;
		}
	public void setstudent_id(int student_id) {
			this.student_id = student_id;
		}
	public String getstudent_name() {  
	    return student_name;  
	}  
	  
	public void setstudent_name(String student_name) {  
	    this.student_name = student_name;  
	}  
	public String getstudent_password() {  
	    return student_password;  
	}  
	  
	public void setstudent_password(String student_password) {  
	    this.student_password = student_password;  
	}  
		
	public String getstudent_mail() {  
	    return student_mail;  
	}  
	  
	public void setstudent_mail(String student_mail) {  
	    this.student_mail = student_mail;  
	} 
	public String getstudent_time() {  
	    return student_time;  
	}  
	  
	public void setstudent_time(String student_time) {  
	    this.student_time = student_time;  
	} 
}
