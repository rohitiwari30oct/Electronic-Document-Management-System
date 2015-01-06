package edms.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

public class DemoUser2ServiceImpl implements DemoUserService {
	
	@Override
	public String getEmpid() {
		return "mng2";
	}

	@Override
	public String getEmpname() {
		return "Smith";
	}

	@Override
	public String getDeptid() {
		return "manager2";
	}

	@Override
	public String getDeptname() {
		return "mng_development";
	}
}