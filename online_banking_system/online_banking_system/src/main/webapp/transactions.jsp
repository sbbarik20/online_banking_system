<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .buttons_transactions .overview-boxes button {
            /* padding: 0px 150px; */

            background-color: #0A2558;
        }

        .buttons_transactions .overview-boxes button a {
            text-decoration: none;
            color: white;
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
            <li>
                <a href="/transactions">
                    <i class='bx bx-list-ul'></i>
                    <span class="links_name">Transactions</span>
                </a>
            </li>
            <!-- <li>
        <a href="#">
          <i class='bx bx-pie-chart-alt-2'></i>
          <span class="links_name">Analytics</span>
        </a>
      </li>

      
      <li>
        <a href="/message">
          <i class='bx bx-message'></i>
          <span class="links_name">Messages</span>
        </a>
      </li>

      <li>
        <a href="#">
          <i class='bx bx-cog'></i>
          <span class="links_name">Setting</span>
        </a>
      </li> -->
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
            <div class="search-box">
                <input type="text" placeholder="Search...">
                <i class='bx bx-search'></i>
            </div>
            <div class="profile-details">
                <img src="si.jpg" alt="">
                <span class="admin_name">${name}</span>
            </div>
        </nav>



        <div class="home-content">
            <div class="buttons_transactions">
                <div class="overview-boxes">
                    <button class="box">
                        <a href="deposit">
                            <div class="right-side">
                                <div class="box-topic">Deposit Money</div>
                            </div>
                        </a>
                    </button>
                    <button class="box">
                        <a href="withdraw">
                            <div class="right-side">
                                <div class="box-topic">Fund Transfer</div>
                            </div>
                        </a>
                    </button>
                    <button class="box">
                        <a href="ministatement">
                            <div class="right-side">
                                <div class="box-topic">Mini Statement</div>
                            </div>
                        </a>
                    </button>

                </div>
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