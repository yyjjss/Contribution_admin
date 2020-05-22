package admin.model;

import java.util.Date;

public class UserDto {
private String user_id;
private String name;
private String nickname;
private Date register_date;
private int user_type_id;
private int grade;

public int getUser_type_id() {
	return user_type_id;
}
public void setUser_type_id(int user_type_id) {
	this.user_type_id = user_type_id;
}
public int getGrade() {
	return grade;
}
public void setGrade(int grade) {
	this.grade = grade;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public Date getRegister_date() {
	return register_date;
}
public void setRegister_date(Date register_date) {
	this.register_date = register_date;
}

@Override
public String toString() {
	return "UserDto [user_id=" + user_id + ", name=" + name + ", nickname=" + nickname + ", register_date="
			+ register_date + ", user_type_id=" + user_type_id + ", grade=" + grade + "]";
}




}
