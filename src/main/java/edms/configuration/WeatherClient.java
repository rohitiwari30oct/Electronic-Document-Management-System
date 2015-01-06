package edms.configuration;

import java.text.SimpleDateFormat;

import org.springframework.ws.client.core.support.WebServiceGatewaySupport;
import org.springframework.ws.soap.client.core.SoapActionCallback;

import edms.wsdl.Country;
import edms.wsdl.GetCountryRequest;
import edms.wsdl.GetCountryResponse;

public class WeatherClient extends WebServiceGatewaySupport {

	public GetCountryResponse getCountryByName(String countryName) {
		GetCountryRequest request = new GetCountryRequest();
		request.setName(countryName);

		System.out.println();
		System.out.println("Requesting forecast for " + countryName);

		GetCountryResponse response = (GetCountryResponse) getWebServiceTemplate().marshalSendAndReceive(
				request,
				new SoapActionCallback(
						"http://localhost:8080/ws/getCountry"));

		return response;
	}

	public void printResponse(GetCountryResponse response) {
		Country country = response.getCountry();

			System.out.println();

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				System.out.print(country.getCurrency());
				System.out.print(" ");
				System.out.print(country.getName());
				System.out.print(" ");
				System.out.println();
	}

}
