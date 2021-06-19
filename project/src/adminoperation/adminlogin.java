package adminoperation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import adminoperation.adminbilgisi;
import project.ConnectionProvider;
public class adminlogin {

private String admin_mail, admin_sifre;
	
	public boolean adminlog(adminbilgisi cbilgi)
	{
	 int z=0;
	try
	{
		admin_mail= cbilgi.getadmin_mail();
		admin_sifre=cbilgi.getadmin_sifre();
		
		Connection con= ConnectionProvider.getCon();
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery("select * from admin where admin_mail='"+admin_mail+"' and admin_sifre='"+admin_sifre+"'");
		while (rs.next()){
			z=1;
			return true;
			
			
		}
		if (z==0)
			
		return false;
	}
	catch(Exception e)
	{
		System.out.println(e);
		
	
}
	return false;
}
	}