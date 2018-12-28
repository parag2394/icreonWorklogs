<%
session.setAttribute("username", null);
//session.setAttribute("JSON_RESULT", null);
request.removeAttribute("JSON_RESULT");
session.invalidate();

response.sendRedirect("login");
%>