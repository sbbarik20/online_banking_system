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
            .sp{
                color: red;
            }
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
                <h2 style="text-align: center;"><u>TRANSFER MONEY</u></h2>
                <!-- <form action="/withdraw_money" method="post">
                    <input type="text" name="accountno" placeholder="Enter Account Number">
                    <input type="number" name="withdraw_amount" placeholder="Enter Withdrawal Amount">
                    <input type="submit" value="Withdraw">
                    ${sms}
                </form> -->
                <form action="/transferMoney" method="post" name="Form" onsubmit="return validateForm()">

                    <label for="fromAccount">From Account Number:</label>
                    <input type="number" name="fromAccount" id="fromAccount" value="${accountno}" readonly>
                  
            
                    <label for="toAccount">To Account Number:</label>
                    <input type="number" id="toAccount" name="toAccount" placeholder="Account Number" >

                    <label for="ahname">Account Holder Name:</label>
                    <input type="text" id="ahname" name="ahname" readonly >

                    <label for="toAccount">Confirm Account Number:</label>
                    <input type="number" id="ctoAccount" name="ctoAccount" placeholder="Confirm Account Number" >
            
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" step="0.01" placeholder="0.00" >
                    <!-- <span class="sp">Minimum Transations: Rs.1.00</span> -->
            
                    <input type="submit" value="Transfer Money">
                    ${sms}
                    ${error}
                </form>
            </div>
        </section>



        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script>
             $(document).ready(function() {
            $('#toAccount').blur(function() {
                var accountNumber = $(this).val();
                $.ajax({
                    url: "/getaccountholdername",
                    method: "GET",
                    dataType: "JSON",
                    data: {baccount:$(this).val() },
                    success: function(res) {
                        console.log(res);
                        $("#ahname").val(res[0].ahname);
                    }
                });
            });
        });

        function validateForm() {
                let toAccount =document.forms["Form"]["toAccount"].value;
                let ctoAccount =document.forms["Form"]["ctoAccount"].value;
                let amount = document.forms["Form"]["amount"].value;

                if (toAccount == "") {
                    alert("Account No. must be filled out");
                    return false;
                }
                if (ctoAccount == "") {
                    alert("Confirm Account No. must be filled out");
                    return false;
                }
                if (amount == "") {
                    alert("Enter Minium Rs:1.0");
                    return false;
                }

               if (toAccount !== ctoAccount) {
                    alert("Account Number and Confirm Account Number Does Not Match");
                    return false;
                }
                return true;
            }

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