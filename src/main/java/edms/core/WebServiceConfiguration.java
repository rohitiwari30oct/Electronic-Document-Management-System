package edms.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;

import edms.webservice.client.FolderClient;
import edms.webservice.client.WorkflowClient;
import edms.webservice.client.WorkflowHistoryClient;

@Configuration
public class WebServiceConfiguration {

	@Bean
	public Jaxb2Marshaller marshaller() {
		Jaxb2Marshaller marshaller = new Jaxb2Marshaller();
		marshaller.setContextPath("edms.wsdl");
		return marshaller;
	}

	@Bean
	public FolderClient folderClient(Jaxb2Marshaller marshaller) {
		FolderClient client = new FolderClient();
		client.setDefaultUri("http://localhost:8080/ws/documentFolder.wsdl");
		client.setMarshaller(marshaller);
		client.setUnmarshaller(marshaller);
		return client;
	}
	
	@Bean
	public WorkflowClient workflowClient(Jaxb2Marshaller marshaller) {
		WorkflowClient client = new WorkflowClient();
		client.setDefaultUri("http://localhost:8080/ws/workflow.wsdl");
		client.setMarshaller(marshaller);
		client.setUnmarshaller(marshaller);
		return client;
	}
	
	@Bean
	public WorkflowHistoryClient workflowHistoryClient(Jaxb2Marshaller marshaller) {
		WorkflowHistoryClient client = new WorkflowHistoryClient();
		client.setDefaultUri("http://localhost:8080/ws/workflowHistory.wsdl");
		client.setMarshaller(marshaller);
		client.setUnmarshaller(marshaller);
		return client;
	}


}