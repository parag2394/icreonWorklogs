package com.icreon.worklogs.bo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface WorkLogsBo {

    public List getSelectedWorklogs(String issue, String user, String fromDate, String toDate, int status);
    public void gotoWorklogMethod(HttpServletRequest request,HttpServletResponse response,
                                  String p_project_id, String p_worklog_id,String p_issue_id,
                                  String goToClass)  throws IOException;
    public void gotoSingleParamWorklogMethod(HttpServletRequest request, HttpServletResponse response,
                                             String parameter, String goToClass) throws IOException;
}

