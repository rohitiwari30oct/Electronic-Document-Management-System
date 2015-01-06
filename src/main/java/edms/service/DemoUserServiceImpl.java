package edms.service;

public class DemoUserServiceImpl implements DemoUserService{

	@Override
	public String getEmpid() {
		return "emp1";
	}

	@Override
	public String getEmpname() {
		return "Tanvi";
	}

	@Override
	public String getDeptid() {
		return "dev_java";
	}

	@Override
	public String getDeptname() {
		return "Development";
	}

}
