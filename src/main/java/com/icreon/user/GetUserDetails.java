package com.icreon.user;

import org.json.JSONObject;
import org.springframework.http.*;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class GetUserDetails {

    public Map<String, String> getUserEmailId(String p_worklog_id){

        Map<String,String> issueMap = getUserLink(p_worklog_id);

        String uri =  issueMap.get("Link");

        System.out.println(uri);
        JSONObject myResponse = callJiraAPI(uri);

        String userEmailId = myResponse.getString("emailAddress");
        String userName = myResponse.getString("displayName");

        System.out.println(userEmailId);

        Map<String, String> userMap = new HashMap<String, String>();
        userMap.put("Email",userEmailId);
        userMap.put("Name",userName);
        userMap.put("Date",issueMap.get("Date"));

        return userMap;
    }


    public Map<String, String> getUserLink(String p_worklog_id){

        final String url="https://api.tempo.io/2/";
        final String worklogs="worklogs";

        final String uri =url+worklogs+"/"+p_worklog_id;
        System.out.println(uri);
        JSONObject myResponse = callTempoAPI(uri);

        String userLink = myResponse.getJSONObject("author").getString("self");
        String logDate = myResponse.getString("startDate");
        System.out.println(userLink);
        System.out.println(logDate);

        Map<String, String> issueMap = new HashMap<String, String>();
        issueMap.put("Link",userLink);
        issueMap.put("Date",logDate);

        return issueMap;
    }

    private JSONObject callTempoAPI(String uri){

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer XHArc0TYGjXuNV1ElvLuA4XTnZ6T4F");

        HttpEntity entity = new HttpEntity(headers);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
        return new JSONObject(response.getBody());

      //  return myResponse;

    }

    private JSONObject callJiraAPI(String uri){

        String username="rohit@icreon.com";
        String password="*****";

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
        String output= restTemplate.getForObject(uri,String.class);
        JSONObject myresponse = new JSONObject(output);

        return myresponse;
    }




}
