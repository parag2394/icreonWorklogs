package com.icreon.util;

import org.json.JSONObject;
import org.springframework.http.*;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.icreon.util.ApplicationConstants.ICREONJIRA_PASSWORD;
import static com.icreon.util.ApplicationConstants.ICREONJIRA_USERNAME;

@Service
public class CallApiService {


    public JSONObject callTempoAPI(String uri){

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer XHArc0TYGjXuNV1ElvLuA4XTnZ6T4F");

        HttpEntity entity = new HttpEntity(headers);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
        return new JSONObject(response.getBody());

      //  return myResponse;

    }

    public JSONObject callJiraAPI(String uri){

        String userName= ICREONJIRA_USERNAME;
        String password= ICREONJIRA_PASSWORD;

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(userName,password));
        String output= restTemplate.getForObject(uri,String.class);
        JSONObject myResponse = new JSONObject(output);

        return myResponse;
    }


    public int validateJiraUser(String uri,String username, String password){

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET,null,String.class);

        int myResponseCode = (response.getStatusCodeValue());

        return myResponseCode;
    }


}
