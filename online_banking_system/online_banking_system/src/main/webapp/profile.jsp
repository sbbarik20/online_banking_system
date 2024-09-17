<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>Customer Dashboard</title>
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
                    <a href="/customerdashboard" class="active">
                        <i class='bx bx-grid-alt'></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="/profile">
                        <i class='bx bx-user'></i>
                        <span class="links_name">Profile</span>
                    </a>
                </li>
                <li>
                    <a href="/check_account">
                        <i class='bx bx-box'></i>
                        <span class="links_name">Check Account</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a class="dropbtn">
                        <i class='bx bx-list-ul'></i>
                        <span class="links_name">Transations</span>
                        <i class='bx bxs-chevron-down'></i>
                    </a>
                    <div class="dropdown-content">
                        <a href="/deposit">Deposite Money</a>
                        <a href="/withdraw">Fund Transfer</a>
                        <a href="/addbeneficiary">Add Beneficiary</a>
                        <a href="/ministatement">Mini Statement</a>
                    </div>
                </li>

                <li class="log_out">
                    <a href="index.jsp">
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
                    +++++++++ FOREACH IF WE WANT THE IMAGE IN TOP RIGHT CORNER+++++++++++++
                    <img src="data:image/jpeg;base64,${user.photoBase64}" alt="User Photo" width="100px" height="100px">
                    <span class="admin_name">${name}</span>
                </div> -->


            </nav>



            <div class="home-content">

                <div class="table-container">
                    <table class="table" border="1px" width="100%">
                        <c:forEach var="user" items="${usermaster}">
                            <tr>
                                <th>Account No.</th>
                                <td>${user.accountno}</td>
                                <th>Name</th>
                                <td>${user.name}</td>

                            </tr>
                            <tr>
                                <th>Account Type</th>
                                <td>${user.account_type}</td>
                                <th>Email</th>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <th>Father's Name</th>
                                <td>${user.fathers_name}</td>
                                <th>Mother's Name</th>
                                <td>${user.mothers_name}</td>
                            </tr>
                            <tr>
                                <th>Date of Birth</th>
                                <td>${user.dob}</td>
                                <th>Gender</th>
                                <td>${user.gender}</td>
                            </tr>
                            <tr>
                                <th>Occupation</th>
                                <td>${user.occupation}</td>
                                <th>Aadhar No</th>
                                <td>${user.aadhar_no}</td>
                            </tr>
                            <tr>
                                <th>Mobile No</th>
                                <td>${user.mobile_no}</td>
                                <th>Marital Status</th>
                                <td>${user.marital_status}</td>
                            </tr>
                            <tr>
                                <th>PAN No</th>
                                <td>${user.pan_no}</td>
                                <th>Nationality</th>
                                <td>${user.nationality}</td>
                            </tr>
                            <tr>
                                <th>Religion</th>
                                <td>${user.religion}</td>
                                <th>Qualification</th>
                                <td>${user.qualification}</td>
                            </tr>
                            <tr>
                                <th>Category</th>
                                <td>${user.category}</td>
                                <th>Address</th>
                                <td>${user.address}</td>
                            </tr>
                            <tr>
                                <th>City</th>
                                <td>${user.city}</td>
                                <th>State</th>
                                <td>${user.state}</td>
                            </tr>
                            <tr>
                                <th>Pin</th>
                                <td>${user.pin}</td>
                                <th>Photo</th>
                                <td><img src="data:image/jpeg;base64,${user.photoBase64}" alt="User Photo" width="100px"
                                        height="100px"></td>
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