package food;

public class signUp {
    private String name;
    private String phoneNumber;
    private String emailId;
    private String password;

    public signUp() {
        // default constructor
    }

    public signUp(String name, String phoneNumber, String emailId, String password) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.emailId = emailId;
        this.password = password;
    }

    // Getters and setters

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	@Override
	public String toString() {
		return "signUp [name=" + name + ", phoneNumber=" + phoneNumber + ", emailId=" + emailId + ", password="
				+ password + "]";
	}
    
    
}
