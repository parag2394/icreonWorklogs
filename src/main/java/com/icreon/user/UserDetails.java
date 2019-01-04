package com.icreon.user;

import com.icreon.util.CallApiService;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

import static com.icreon.util.ApplicationConstants.CONSTANT_WORKLOGS;
import static com.icreon.util.ApplicationConstants.TEMPO_URL;
import static java.lang.Integer.parseInt;

@Component
public class UserDetails {

    /*@Autowired
    private GetUserDetails getUserDetails;*/

    public Map<String, String> getUserEmailId(String p_worklog_id){


        Map<String,String> issueMap = getUserLink(p_worklog_id);

        String uri =  issueMap.get("Link");

        System.out.println(uri);
        CallApiService callApiService = new CallApiService();
        JSONObject myResponse = callApiService.callJiraAPI(uri);

        String userEmailId = myResponse.getString("emailAddress");
        String userName = myResponse.getString("displayName");

        System.out.println(userEmailId);

        Map<String, String> userMap = new HashMap<String, String>();
        userMap.put("Email",userEmailId);
        userMap.put("Name",userName);
        userMap.put("Date",issueMap.get("Date"));
        userMap.put("Time",issueMap.get("Time"));
        userMap.put("Description",issueMap.get("Description"));

        return userMap;
    }

    public Map<String, String> getUserLink(String p_worklog_id){


        /*final String url="https://api.tempo.io/2/";
        final String worklogs="worklogs";*/

        final String uri = TEMPO_URL  + CONSTANT_WORKLOGS + "/" + p_worklog_id;
        System.out.println(uri);
        CallApiService callApiService = new CallApiService();
            JSONObject myResponse = callApiService.callTempoAPI(uri);

        String userLink = myResponse.getJSONObject("author").getString("self");
        String logDate = myResponse.getString("startDate");
        String timeSpent = Integer.toString(myResponse.getInt("timeSpentSeconds")/3600);
        String description = myResponse.getString("description");

        System.out.println(userLink);
        System.out.println(logDate);

        Map<String, String> issueMap = new HashMap<String, String>();
        issueMap.put("Link",userLink);
        issueMap.put("Date",logDate);
        issueMap.put("Time",timeSpent);
        issueMap.put("Description",description);

        return issueMap;
    }

}
