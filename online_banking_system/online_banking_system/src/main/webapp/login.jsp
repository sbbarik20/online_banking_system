
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Login Form</title>
  <link rel="stylesheet" href="css2/styles.css">
  <style>

  </style>
</head>

<body>
  <div class="center">
    <h1>Login</h1>
    <form action="login" method="post" name="login" onsubmit="return chk()">
      <div class="txt_field">
        <input type="email" name="email" id="email"><span></span>
        <label>User Id</label>
      </div>

      <div class="txt_field">
        <input type="password" name="password" id="password"><span></span>
        <label>Password</label>
      </div>

      <input type="submit" value="Login">
      <div class="signup_link">
        Don't have an account? <a href="/register">Signup</a>
      </div>
      <div class="signup_link">
        <a href="#">
          <div class="pass">Forgot Password?</div>
        </a>
      </div>
      <div class="msg">
        ${sms}
      </div>

    </form>
  </div>

</body>

</html>

<script>
  function chk(){
    let email = document.forms["login"]["email"].value;
    if (email == "") {
    alert("Email must be filled out");
    return false;
    }

    let password = document.forms["login"]["password"].value;
    if (password == "") {
    alert("Please Your Enter Password");
    return false;
    }
    
  }
</script>