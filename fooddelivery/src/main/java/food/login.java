package food;

public class login {
	
	private String name;
	private String password;
	
	public login() {
		// TODO Auto-generated constructor stub
	}

	public login(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "login [name=" + name + ", password=" + password + "]";
	}
	

}
