package com.icreon.worklogs.boImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.icreon.worklogs.bo.WorkLogsBo;
import com.icreon.worklogs.daoImpl.WorklogsDaoImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class WorkLogBoImpl implements WorkLogsBo{
    List<Object[]> obj=null;


    @Override
    public List getSelectedWorklogs(String issue, String user, String fromDate, String toDate, int status) {


        if(!issue.equals("0"))
        {
            //   Only issue is selected without user,dates and status

            if(user.equals("0") && fromDate=="" && toDate =="" && status==-1 ){
                System.out.println("only issue is selected");
                WorklogsDaoImpl wd=new WorklogsDaoImpl();
                obj=wd.showSelectedWorklogs(issue);
            }
            //   Only issue with two dates without user and status

            else if(user.equals("0") && status==-1 && fromDate!="" && toDate!="" ){
                System.out.println("issue with only two dates without status");
                WorklogsDaoImpl wd=new WorklogsDaoImpl();
                obj=wd.WorklogIssueWithTwoDates(issue,fromDate,toDate);
            }
            else if(user.equals("0") && status==-1 && fromDate!="" && toDate =="" ){
                System.out.println("issue with only from dates without user ,without status");
                WorklogsDaoImpl wd=new WorklogsDaoImpl();
                obj=wd.WorklogIssueWithOnlyFromDate(issue,fromDate);
            }
            //Need to add two conditions for single dates
            else if(user.equals("0") && status==-1 && fromDate=="" && toDate !="" ){
                System.out.println("issue with only to date without user ,without status");
                WorklogsDaoImpl wd=new WorklogsDaoImpl();
                obj=wd.WorklogIssueWithOnlyToDate(issue,toDate);
            }
            else{
                if((status==0) || (status==1) || (status==2) ){
                    //   Only issue without two dates without user, only with status

                    if(user.equals("0") &&  fromDate =="" && toDate =="" ){
                        System.out.println("issue without user and dates,only with status");
                        WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                        obj=wd1. worklogWithOnlyStatus(issue,status);
                    }
                    //  Only issue with two dates and status without user

                    if(user.equals("0") && fromDate !=null && fromDate!="" && toDate !=null && toDate !=""){
                        System.out.println("issue without user,but with dates and status");
                        WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                        obj=wd1. worklogWithStatusDates(issue,fromDate,toDate,status);
                    }
                }

            }

            if(!user.equals("0")){
                // User with only issue

                if(fromDate=="" && toDate ==""&& status==-1){
                    System.out.println("issue with user only");
                    WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                    obj=wd1.showSelectedWorklogsWrtUser(issue,user);
                }
                // User with issue and from date

                else if (toDate ==""&& status==-1) {
                    System.out.println("issue with user and from date");
                    WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                    obj=wd1. worklogWithUserFromDate(issue,user,fromDate);
                }

                // User with issue and to date

                else if (fromDate=="" && status==-1) {
                    System.out.println("issue with user and to date");
                    WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                    obj=wd1. worklogWithUserToDate(issue,user,toDate);
                }

			     		/*else if (fromDate=="" && (status==0 || status==1 || status==2 )) {
			     			System.out.println("issue with user and to date");
			     			 WorklogsDaoImpl wd1=new WorklogsDaoImpl();
			     			 obj=wd1. worklogWithUserToDateAndStatus(issue,user,toDate,status);
						}*/
                // User with issue, from date and to date

                else if (status==-1) {
                    System.out.println("issue with user ,from date and to date without status");
                    WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                    obj=wd1. worklogWithUserFromToToDate(issue,user,fromDate,toDate);
                }

                //User with issue, from date,to date and status

                else if (!(status==-1) && fromDate=="" && toDate =="") {
                    System.out.println("issue with user ,from date and to date with status");
                    WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                    obj=wd1. worklogWithUserwithOnlyStatus(issue,user,status);
                }
                //User with issue with all fields
                else if (!(status==-1) && fromDate!="" && toDate !="") {
                    System.out.println("issue with all fields");
                    WorklogsDaoImpl wd1=new WorklogsDaoImpl();
                    obj=wd1. worklogWithAll(issue,user,fromDate,toDate,status);
                }




            }






        }
        return obj;

    }


    public void gotoWorklogMethod(HttpServletRequest request,HttpServletResponse response,
                                  String p_project_id, String p_worklog_id,String p_issue_id,
                                  String goToClass) throws IOException {

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        WorklogsDaoImpl wd=new WorklogsDaoImpl();

        if(goToClass.equals("updateSelectedWorklog")){
            wd.updateSelectedWorklog(p_project_id, p_worklog_id, p_issue_id);
        }
        else if(goToClass.equals("updateSelectedWorklogStatusTORejected")){
            wd.updateSelectedWorklogStatusTORejected(p_project_id, p_worklog_id, p_issue_id);
        }
        else if(goToClass.equals("updateRejectedWorklog")){
            wd.updateRejectedWorklog(p_project_id, p_worklog_id, p_issue_id);
        }

        Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(1);
        out.write(element.toString());
        out.flush();
        out.close();
    }

    public void gotoSingleParamWorklogMethod(HttpServletRequest request,HttpServletResponse response,
                                  String parameter, String goToClass) throws IOException {

        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
        WorklogsDaoImpl wd=new WorklogsDaoImpl();

        if(goToClass.equals("showSelectedAuthors")){
            List l=wd.showSelectedAuthors(parameter);
            JsonElement element = gson.toJsonTree(l);
            out.write(element.toString());
        }
        else if(goToClass.equals("approveAllWorklogs")){
            int approve_status=wd.approveAllWorklogs(parameter);
            JsonElement element = gson.toJsonTree(approve_status);
            out.write(element.toString());
        }

        out.flush();
        out.close();

    }



}
