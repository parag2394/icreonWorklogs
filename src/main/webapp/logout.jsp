<%
session.setAttribute("username", null);
session.invalidate();

response.sendRedirect("login.jsp");
%>