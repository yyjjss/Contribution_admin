package admin.model;

import java.util.Date;

public class OrganizationDto {
private String user_id;
private Date register_date;
private int user_type_id;
private String organization_id;
private String nanmmByNm;
private String rprsntvNm;
private String adres;
private String hmpadres;

public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public Date getRegister_date() {
	return register_date;
}
public void setRegister_date(Date register_date) {
	this.register_date = register_date;
}
public int getUser_type_id() {
	return user_type_id;
}
public void setUser_type_id(int user_type_id) {
	this.user_type_id = user_type_id;
}
public String getOrganization_id() {
	return organization_id;
}
public void setOrganization_id(String organization_id) {
	this.organization_id = organization_id;
}
public String getNanmmByNm() {
	return nanmmByNm;
}
public void setNanmmByNm(String nanmmByNm) {
	this.nanmmByNm = nanmmByNm;
}
public String getRprsntvNm() {
	return rprsntvNm;
}
public void setRprsntvNm(String rprsntvNm) {
	this.rprsntvNm = rprsntvNm;
}
public String getAdres() {
	return adres;
}
public void setAdres(String adres) {
	this.adres = adres;
}
public String getHmpadres() {
	return hmpadres;
}
public void setHmpadres(String hmpadres) {
	this.hmpadres = hmpadres;
}

}
