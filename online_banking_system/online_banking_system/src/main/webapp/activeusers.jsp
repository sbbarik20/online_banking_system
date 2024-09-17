<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="css/dash.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/admindashboard.css">
</head>

<body>
  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxs-user'></i>
      <span class="logo_name">${name}</span>
    </div>
    <ul class="nav-links">
      <li>
        <a href="/admindashboard" class="active">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Dashboard</span>
        </a>
      </li>
      <li>
        <a href="customeraccounts">
          <i class='bx bx-box'></i>
          <span class="links_name">Customer Accounts</span>
        </a>
      </li>
      <li>
        <a href="activeusers">
          <i class='bx bx-list-ul'></i>
          <span class="links_name">Active Users</span>
        </a>
      </li>

      <!-- <li>
        <a href="#">
          <i class='bx bx-pie-chart-alt-2'></i>
          <span class="links_name">Analytics</span>
        </a>
      </li> -->

      <li>
        <a href="/customer">
          <i class='bx bx-user'></i>
          <span class="links_name">Customers</span>
        </a>
      </li>
      <li>
        <a href="/message">
          <i class='bx bx-message'></i>
          <span class="links_name">Messages</span>
        </a>
      </li>
      <li>
        <a href="/faq_admin">
          <i class='bx bx-list-ul'></i>
          <span class="links_name">FAQ</span>
        </a>
      </li>

      <li class="log_out">
        <a href="/">
          <i class='bx bx-log-out'></i>
          <span class="links_name">Log out</span>
        </a>
      </li>
    </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
      <!-- <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search'></i>
      </div>
      <div class="profile-details">
        <img src="" alt="">
        <span class="admin_name">${name}</span>
      </div> -->
    </nav>


    <div class="home-content">
      <U><h2 style="text-align: center;">ACTIVE USERS</h2></U>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Welcome<%=session.getAttribute("name")%>
          <hr> -->
        <div class="table-container">
          <table class="table" border="1px" width="100%">
            <tr>
              <th>Account Number</th>
              <th>Name</th>
              <th>Email</th>
            </tr>
            <c:forEach var="user" items="${li}">
              <tr>
                <td>${user.accountno}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
              </tr>
            </c:forEach>
          </table>
        </div>
    </div>
  </section>


  <script>
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".sidebarBtn");
    sidebarBtn.onclick = function () {
      sidebar.classList.toggle("active");
      if (sidebar.classList.contains("active")) {
        sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
      } else
        sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
    }
  </script>

</body>

</html>