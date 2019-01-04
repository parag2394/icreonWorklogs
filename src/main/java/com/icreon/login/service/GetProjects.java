package com.icreon.login.service;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import static com.icreon.util.ApplicationConstants.CONSTANT_PROJECT;
import static com.icreon.util.ApplicationConstants.ICREONJIRA_URL;

@Service
public class GetProjects {

	public JSONArray getProjectsInfo(String userName,String password) throws JSONException
	{

		/*String username = (String) request.getAttribute("username");
		String password = (String) request.getAttribute("password");*/

		final String projectUri = ICREONJIRA_URL + CONSTANT_PROJECT;
		RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(userName,password));
        String output=restTemplate.getForObject(projectUri,String.class);

        JSONArray projectResponse = new JSONArray(output);
	    return projectResponse;
	}

}
