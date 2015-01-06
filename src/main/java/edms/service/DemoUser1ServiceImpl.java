package edms.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

public class DemoUser1ServiceImpl implements DemoUserService {
	
	@Override
	public String getEmpid() {
		return "mng1";
	}

	@Override
	public String getEmpname() {
		return "George";
	}

	@Override
	public String getDeptid() {
		return "manager1";
	}

	@Override
	public String getDeptname() {
		return "mng_java";
	}
}