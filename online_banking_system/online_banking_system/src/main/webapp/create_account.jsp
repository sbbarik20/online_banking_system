<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bank Current Account Registration</title>
  <link rel="stylesheet" href="css2/create_account.css">
  <link rel="stylesheet" href="css2/create_account2.css">
</head>

<body>
  <div class="navbar">
    <div class="nav-logo">
      <a href="/">MY<span class="text-primary">BANK</span>
    </div>
    <div class="nav-items">
      <ul>
        <li><a href="/"> Home </a></li>
        <li><a href="/login"> LogIn </a></li>
        <li><a href="/register"> Register </a></li>
      </ul>
    </div>
    <!-- <div class="nav-button">
      <div class="anim-layer"></div>
      <a href="#">Sign Up</a>
    </div> -->
    <div id="hamburger-menu">&#9776;</div>
  </div>

  <div id="mobile-menu">
    <div class="mobile-nav-items">
      <ul>
        <li><a href="/"> Home </a></li>
        <li><a href="/login"> LogIn </a></li>
        <li><a href="/register"> Register </a></li>
      </ul>
    </div>
    <!-- <div class="mobile-nav-button">
      <div class="anim-layer"></div>
      <a href="#">Sign Up</a>
    </div> -->
    <div id="hamburger-cross">&#10006;</div>
  </div>




  <div class="container_form">
    <div class="row">
      <div class="col-75">
        <div class="container">
          <form action="/create_account" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
            <div class="row">
              <div class="col-50">
                <h1>Open Account With MYBANK</h1>
                <div class="msg">
                  ${sms}
                </div>
                <div class="msg">
                  ${accountNo}
                </div>
                <div class="row">
                  <div class="col-50">
                    <label for="name">Customer Name</label>
                    <input type="text" id="name" name="name" placeholder="Customer Name">
                  </div>
                  <div class="col-50">
                    <label for="gender">Account Type</label>
                    <select id="account_type" name="account_type">
                      <option hidden="hidden">--Choose--</option>
                      <option value="saving">Saving</option>
                      <option value="current">Current</option>
                    </select>
                  </div>

                  <div class="col-50">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="email">
                  </div>
                  <div class="col-50">
                    <label for="faname">Father's Name</label>
                    <input type="text" id="fathers_name	" name="fathers_name	" placeholder="Father's Name">
                  </div>
                </div>
                <div class="row">

                  <div class="col-50">
                    <label for="mname">Mother's Name</label>
                    <input type="text" id="mothers_name" name="mothers_name" placeholder="Mother's Name">
                  </div>
                  <div class="col-50">
                    <label for="dob">Date Of Birth</label>
                    <input type="date" id="dob" name="dob">
                  </div>
                </div>
                <div class="row">

                  <div class="col-50">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                      <option hidden="hidden">--Choose--</option>
                      <option value="male">Male</option>
                      <option value="female">Female</option>
                      <option value="other">Other</option>
                    </select>
                  </div>
                  <div class="col-50">
                    <label for="occupation">Occupation</label>
                    <select id="occupation" name="occupation">
                      <option hidden="hidden">--Choose--</option>
                      <option value="mployed">Employed</option>
                      <option value="semployed">Self-employed</option>
                      <option value="student">Student</option>
                      <option value="business">Business</option>
                      <option value="homemaker">Home Maker</option>
                    </select>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-50">
                    <label for="adhar">Aadhaar No</label>
                    <input type="text" id="aadhar_no" name="aadhar_no" placeholder="Aadhaar No">
                  </div>
                  <div class="col-50">
                    <label for="mno">Mobile No</label>
                    <input type="text" id="mobile_no" name="mobile_no" placeholder="Mobile No">
                  </div>
                </div>
                <div class="row">
                  <div class="col-50">
                    <label for="marital_status">Marital Status</label>
                    <select id="marital_status" name="marital_status">
                      <option hidden="hidden">--Choose--</option>
                      <option value="single">Single</option>
                      <option value="married">Married</option>
                      <option value="widowed">Widowed</option>
                    </select>
                  </div>
                  <div class="col-50">
                    <label for="panno">Pan Card No</label>
                    <input type="text" id="pan_no" name="pan_no" placeholder="Pan No">
                  </div>
                </div>
                <div class="row">
                  <div class="col-50">
                    <label for="nationality">Nationality</label>
                    <select id="nationality	" name="nationality	">
                      <option hidden="hidden">--Choose--</option>
                      <option value="indian">Indian</option>
                      <option value="other">Other</option>
                    </select>
                  </div>
                  <div class="col-50">
                    <label for="religion">Religion</label>
                    <select id="religion" name="religion">
                      <option hidden="hidden">--Choose--</option>
                      <option value="hinduism">Hinduism</option>
                      <option value="muslim">Muslim</option>
                      <option value="buddhism">Buddhism</option>
                      <option value="chirstian">Chirstian</option>
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="col-50">
                    <label for="gualification">Qualification</label>
                    <select id="qualification" name="qualification">
                      <option hidden="hidden">--Choose--</option>
                      <option value="matric">Matriculation</option>
                      <option value="Graduate">Graduate</option>
                      <option value="Under-graduate">Under Graduate</option>
                      <option value="Post-graduate">Post Graduate</option>
                    </select>
                  </div>
                  <div class="col-50">
                    <label for="gender">Category</label>
                    <select id="category" name="category">
                      <option hidden="hidden">--Choose--</option>
                      <option value="male">General</option>
                      <option value="female">OBC</option>
                      <option value="other">SC</option>
                      <option value="other">ST</option>
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="col-50">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" placeholder="Enter Address">
                  </div>
                  <div class="col-50">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" placeholder="Enter City">
                  </div>
                  <div class="col-50">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" placeholder="Enter State">
                  </div>

                  <div class="col-50">
                    <label for="zip">Pincode</label>
                    <input type="text" id="pin" name="pin" placeholder="Pincode">

                  </div>
                  <div class="col-50">
                    <label for="photo">Photo</label>
                    <input type="file" id="photo" name="photo">
                  </div>

                </div>
              </div>
            </div>
            <input type="submit" value="Submit" class="btn">
          </form>
        </div>
      </div>
    </div>
  </div>


  <script>
    function checkform() {
      var name = document.getElementById("name").value;
      var account_type = document.getElementById("account_type").value;
      var email = document.getElementById("email").value;
      // var fathers_name = document.getElementById("fathers_name").value;
      // var mothers_name = document.getElementById("mothers_name").value;
      var dob = document.getElementById("dob").value;
      var gender = document.getElementById("gender").value;
      var occupation = document.getElementById("occupation").value;
      var aadhar_no = document.getElementById("aadhar_no").value;
      var mobile_no = document.getElementById("mobile_no").value;
      var marital_status = document.getElementById("marital_status").value;
      var pan_no = document.getElementById("pan_no").value;
      // var nationality = document.getElementById("nationality").value;
      var religion = document.getElementById("religion").value;
      var qualification = document.getElementById("qualification").value;
      var category = document.getElementById("category").value;
      var address = document.getElementById("address").value;
      var city = document.getElementById("city").value;
      var state = document.getElementById("state").value;
      var pin = document.getElementById("pin").value;
      var photo = document.getElementById("photo").value;

      if (name == null || name == "") {
        alert("Name can't be blank");
        return false;
      }
      if (account_type == "--Choose--") {
        alert("Choose Account Type");
        return false;
      }
      if (email == null || email == "") {
        alert("Email can't be blank");
        return false;
      }
      // if (fathers_name == "") {
      //   alert("Father's can't be blank");
      //   return false;
      // }
      // if (mothers_name == "") {
      //   alert("Mother's can't be blank");
      //   return false;
      // }
      if (dob == "") {
        alert("DOB can't be blank");
        return false;
      }
      if (gender == "--Choose--") {
        alert("Choose Gender");
        return false;
      }
      if (occupation == "--Choose--") {
        alert("Choose Occupation");
        return false;
      }
      if (aadhar_no == "" || aadhar_no.length != 12) {
        alert("Addhar Number must be 12 digit");
        return false;
      }
      if (mobile_no == "" || mobile_no.length != 10) {
        alert("Mobile Number must be 10 digit");
        return false;
      }
      if (marital_status == "--Choose--") {
        alert("Choose  Maritial Status");
        return false;
      }
      if (pan_no == "" || pan_no.length != 10) {
        alert("Pan Number must be 10 digit");
        return false;
      }
      // if (nationality == "--Choose--") {
      //   alert("Choose  Nationality");
      //   return false;
      // }
      if (religion == "--Choose--") {
        alert("Choose  Religion");
        return false;
      }
      if (qualification == "--Choose--") {
        alert("Choose  Qualification");
        return false;
      }
      if (category == "--Choose--") {
        alert("Choose  Category");
        return false;
      }
      if (address == "") {
        alert("Address can't be blank");
        return false;
      }
      if (city == "") {
        alert("City can't be blank");
        return false;
      }
      if (state == "") {
        alert("State can't be blank");
        return false;
      }
      if (pin == "" || pin.length != 6) {
        alert("PIN Code must be 6 digit");
        return false;
      }

    }
  </script>


</body>

</html>