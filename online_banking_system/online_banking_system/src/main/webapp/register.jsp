<link rel="stylesheet" href="css2/styles.css">
<div class="center">
  <h1>Registration</h1>
  <form method="post" action="register" name="reg" onsubmit="return chk()">

    <div class="txt_field">
      <input type="number" name="accountno" id="accountno" >
      <label>Account No</label>
    </div>

    <div class="txt_field">
      <input type="text" id="name" name="name">
      <label>Name</label>
    </div>

    <div class="txt_field">
      <input type="email" id="email" name="email" >
      <label>User Id</label>
    </div>

    <div class="txt_field">
      <input type="password" name="password" id="password" >
      <label>Password</label>
    </div>

    <div class="txt_field">
      <input type="password" name="cpassword" id="cpassword" >
      <label>Confirm Password</label>
    </div>

    <input type="submit" value="Register">
    <div class="signup_link">
      Already have an account? <a href="/login">Login</a>
    </div>

    <div class="msg">
      ${sms}
    </div>
  </form>
</div>

<script>
  function chk(){
    let accountno = document.forms["reg"]["accountno"].value;
    if (accountno == "") {
    alert("Accountno must be filled out");
    return false;
    }

    let name = document.forms["reg"]["name"].value;
    if (name == "") {
    alert("Name must be filled out");
    return false;
    }

    let email = document.forms["reg"]["email"].value;
    if (email == "") {
    alert("Email must be filled out");
    return false;
    }

    let password = document.forms["reg"]["password"].value;
    if (password == "") {
    alert("Please Your Enter Password");
    return false;
    }

    let cpassword = document.forms["reg"]["cpassword"].value;
    if (cpassword == "") {
    alert("Confirm Your Enter Password");
    return false;
    }
    
  }
</script>