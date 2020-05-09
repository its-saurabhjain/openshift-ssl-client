package com.example.sslclient;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.URI;
import org.apache.commons.httpclient.methods.GetMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class SslClientApplication {

    public static void main(String[] args) throws IOException, InterruptedException {

	HttpClient client = new HttpClient();
	GetMethod method = new GetMethod();
	//String uri = "https://localhost:8443/secured";
	String uri = "https://ssl-server." + System.getenv("POD_NAMESPACE") + ".svc:8443/secured";
	//String uri = "https://http2server." + System.getenv("POD_NAMESPACE") + ".svc:8443/secured";
	method.setURI(new URI(uri, false));
	while(true) {
		System.out.println("uri:-" + uri);
	    client.executeMethod(method);
	    Thread.sleep(5000);
	}

   }
}
