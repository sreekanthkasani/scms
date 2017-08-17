<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Export to Excel - Demo</title>
</head>
<body>
    <%
        String exportToExcel = request.getParameter("exportToExcel");
        if (exportToExcel != null
                && exportToExcel.toString().equalsIgnoreCase("YES")) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "excel.xls");
 
        }
    %>
    <table align="left" border="2">
        <thead>
            <tr bgcolor="lightgreen">
                <th>Sr. No.</th>
                <th>Text Data</th>
                <th>Number Data</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < 1000; i++) {
            %>
            <tr bgcolor="lightblue">
                <td align="center"><%=i + 1%></td>
                <td align="center">This is text data <%=i%></td>
                <td align="center"><%=i * i%></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%
        if (exportToExcel == null) {
    %>
    <a href="excel.jsp?exportToExcel=YES">Export to Excel</a>
    <%
        }
    %>
</body>
</html>