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
<form action="signup" method="POST" class="mt-5 p-5 d-flex gap-2" >
  <h2 class="fw-bolder align-self-center">Create New Account</h2>
  <div class="mb-3">
    <label for="name" class="form-label">Name</label>
    <input required type="text" name="name" value="${param.get("fullname")}" pattern="^[A-Za-z]+$" class="form-control" id="name" >
  </div>
  <div class="mb-3">
    <label for="email" class="form-label">Username</label>
    <input required value="${param.get("email")}" type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="">
  </div>
  <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input required type="password" name="password"class="form-control" id="password">
  </div>
  <div class="mb-3">
    <label for="confirm-password" class="form-label">Password</label>
    <input required type="password" name="conf-password" class="form-control ${mismatch? 'is-invalid': ''}" id="confirm-password" placeholder="Type your password">
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

  </div>
  <button type="submit" class="btn login-btn mt-3"><h5 class="fw-bolder mt-1">Sign Up</h5></button>
  <div class="align-self-center mt-4 d-flex gap-1 already " >
    <label  >
      Already have an Account ?
    </label>
    <h5 class="align-self-center fw-bold mt-1"><a href="login.jsp">Login</a></h5>
  </div>

</form>
<c:if test="${mismatch || error || duplicateemail}">
  <div class="position-fixed toast show align-items-center text-bg-warning border-0 top-0 start-50 translate-middle-x" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body">
        <c:choose>
          <c:when test="${mismatch}">
            The entered passwords are not matched
          </c:when>
          <c:when test="${error}">
            Something went wrong, try again!
          </c:when>
          <c:when test="${duplicateemail}">
            The email already exists!
          </c:when>
        </c:choose>
      </div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>
</c:if>
</body>
</html>