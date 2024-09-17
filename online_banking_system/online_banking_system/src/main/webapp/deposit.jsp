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
        <style>
            form {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 20px;
                border-radius: 8px;
                font-family: Arial, sans-serif;
            }

            h3 {
                margin-bottom: 20px;
            }

            input[type="text"],
            input[type="number"],
            input[type="submit"] {
                padding: 10px 20px;
                margin: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            input[type="submit"] {
                background-color: #0A2558;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0A2558;
            }
        </style>
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
                    <img src="si.jpg" alt="">
                    <span class="admin_name">${name}</span>
                </div> -->
            </nav>


            <div class="home-content">
                <h2 style="text-align: center;"><u>DEPOSIT MONEY</u></h2>
                <form action="/deposit_money" method="post">
                    <input type="text" name="accountno" placeholder="Enter Account Number" value="${accountno}" readonly>
                    <input type="number" name="dep_money" placeholder="Enter Deposit Amount">
                    <input type="submit" value="Deposit">
                    ${sms}
                </form>


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