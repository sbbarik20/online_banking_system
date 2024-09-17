<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admindashboard.css">
    <style>
        #faq {
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: auto;
            background-color: #f9f9f9;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #0A2558;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0A2558;
        }

        #form {
            display: flex;
        }
    </style>
</head>

<body>
    <%@ page import="java.util.*" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <c:forEach var="pic" items="${photo}">
              <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(pic.photo)}" alt="photo">
            </c:forEach>
            <span class="admin_name">${name}</span>
          </div> -->
                </nav>

                <div class="home-content">
                    <U><h2 style="text-align: center;">ADD FAQS</h2></U>
                    <form action="addfaq" method="post" id="faq">
                        Question:<input type="text" name="question" placeholder="Enter Question">
                        Answer:<input type="text" name="answer" placeholder="Enter Answer">
                        <input type="submit" name="btn" value="Add">
                    </form>
                </div>



                <div class="home-content">
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <div class="table-container">
                            <table class="table" border="1px" width="100%">
                                <tr>
                                    <th>Serial No.</th>
                                    <th>Question</th>
                                    <th>Answer</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach var="user" items="${usermaster}">
                                    <tr>
                                        <td>${user.slno}</td>
                                        <td>${user.question}</td>
                                        <td>${user.answer}</td>
                                        <td>
                                            <form id="form" action="managefaq" method="post">
                                                <input type="hidden" name="slno" value="${user.slno}">
                                                <input type="submit" value="Delete" name="btn">
                                                <input type="submit" value="Update" name="btn">
                                            </form>
                                        </td>
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