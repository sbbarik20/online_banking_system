<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
Welcome<%=session.getAttribute("name")%>
<hr>
<table class="table" border="1px" width="100%" >
<tr>
    <th>Name</th>
    <th>Email</th>
    <th>Role</th>
    <th>Status</th>
    <th>Action</th>
</tr>
<c:forEach var="user" items="${usermaster}">
    <tr>
        <td>${user.name}</td>
        <td>${user.user_id}</td>
        <td>${user.role}</td>
        <td>${user.status}</td>
  
    <td>
    <form action="manageuser" method="post">
        <input type="hidden" name="user_id" value="${user.user_id}">
        <input type="submit" value="Delete" name="btn">
        <input type="submit" value="Update" name="btn">
    </form>
</td>
    </tr>
</c:forEach>
</table>
