<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>login</title>
  <link rel="stylesheet" href="css/reset.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/login.css">

</head>
<body>
<form action="" class="mt-5 p-5 d-flex gap-2" >
  <h2 class="fw-bolder align-self-center">Login</h2>
  <div class="mb-3">
    <label for="email" class="form-label">Username</label>
    <input required type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Type your username">
  </div>
  <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input required type="password" name="password"class="form-control" id="password" placeholder="Type your password">
  </div>
  <div class="d-flex justify-content-between">
    <div class="mb-3 text-center d-flex align-self-start" >
      <div class="form-check">
        <input class="form-check-input remember" name="remember" type="checkbox" value="" id="defaultCheck1">
        <label class="form-check-label remember" for="defaultCheck1">
          Remember me
        </label>
      </div>
    </div>
    <div class="forgot">
      <h4>
        Forgot password?
      </h4>
    </div>
  </div>
  <button type="submit" class="btn login-btn mt-3"><h5 class="fw-bolder mt-1">Login</h5></button>
  <div class="align-self-center mt-4">
    <label  >
      Or Sign up Using
    </label>
  </div>
  <div class="d-flex justify-content-center gap-4 mt-2">
    <i class="bi bi-facebook"></i>
    <i class="bi bi-twitter"></i>
    <i class="bi bi-google"></i>
  </div>
  <div class="align-self-center mt-4">
    <label  >
      Or Sign up Using
    </label>
  </div>
  <h5 class="align-self-center fw-bold"><a href="signup.jsp">SIGN UP</a></h5>
</form>

</body>
</html>