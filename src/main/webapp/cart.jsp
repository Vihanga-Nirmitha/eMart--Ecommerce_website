<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
  <link rel="stylesheet" href="css/reset.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script defer src="js/counter.js"></script>
    <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/counter.css">
</head>
<body>
<%@include file="WEB-INF/partials/header.jsp"%>
<main>
    <div class="d-flex gap-3 main">
        <div class="item-container d-flex flex-column">
            <div class="item d-flex flex-row gap-4">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="">
              </div>
              <div class="img">
                <img src="image/earbuds.jpg" width="100px">
              </div>
              <div class="flex-fill d-flex flex-column">
                  <a href="" class="link-dark link-offset-2 link-underline-opacity-0"><h4>Title here</h4></a>
                    <h6>barnd model</h6>
              </div>
              <div class="d-flex flex-column price-col">
                <h3>$23.4</h3>
                <h5>$ 3434.4</h5>
                <div class="d-flex flex-row gap-3">
                  <i class="bi bi-heart ico"></i>
                  <i class="bi bi-trash ico"></i>
                </div>
              </div>
                <div class="number-input d-flex align-self-start ">
                    <div  class="button d-flex justify-content-center align-items-center pt-1">
                        <h3>-</h3>
                    </div>
                    <input type="text" class="text-center count">
                    <div class="button d-flex justify-content-center align-items-center pt-1">
                        <h3>+</h3>
                    </div>
                </div>

            </div>
            <div class="item d-flex flex-row gap-4">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="">
                </div>
                <div class="img">
                    <img src="image/earbuds.jpg" width="100px">
                </div>
                <div class="flex-fill d-flex flex-column">
                    <a href="" class="link-dark link-offset-2 link-underline-opacity-0"><h4>Title here</h4></a>
                    <h6>barnd model</h6>
                </div>
                <div class="d-flex flex-column price-col">
                    <h3>$23.4</h3>
                    <h5>$ 3434.4</h5>
                    <div class="d-flex flex-row gap-3">
                        <i class="bi bi-heart ico"></i>
                        <i class="bi bi-trash ico"></i>
                    </div>
                </div>
                <div class="number-input d-flex align-self-start ">
                    <div  class="button d-flex justify-content-center align-items-center pt-1">
                        <h3>-</h3>
                    </div>
                    <input type="text" class="text-center count">
                    <div class="button d-flex justify-content-center align-items-center pt-1">
                        <h3>+</h3>
                    </div>
                </div>

            </div>
            <div class="item d-flex flex-row gap-4">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="">
                </div>
                <div class="img">
                    <img src="image/earbuds.jpg" width="100px">
                </div>
                <div class="flex-fill d-flex flex-column">
                    <a href="" class="link-dark link-offset-2 link-underline-opacity-0"><h4>Title here</h4></a>
                    <h6>barnd model</h6>
                </div>
                <div class="d-flex flex-column price-col">
                    <h3>$23.4</h3>
                    <h5>$ 3434.4</h5>
                    <div class="d-flex flex-row gap-3">
                        <i class="bi bi-heart ico"></i>
                        <i class="bi bi-trash ico"></i>
                    </div>
                </div>
                <div class="number-input d-flex align-self-start ">
                    <div  class="button d-flex justify-content-center align-items-center pt-1">
                        <h3>-</h3>
                    </div>
                    <input type="text" class="text-center count">
                    <div class="button d-flex justify-content-center align-items-center pt-1">
                        <h3>+</h3>
                    </div>
                </div>

            </div>
        </div>
        <div class="checkout-container d-flex flex-column gap-3 ">
            <h4>Order Summery</h4>
            <div class="d-flex justify-content-end">
                <h5>Subtotal (1 item) </h5>
                <h4>$34.00</h4>
            </div>
            <div class="d-flex justify-content-end">
                <h5>Shipping Fee </h5>
                <h4>$34.00</h4>
            </div>
            <div class="d-flex gap-2">
                <div>
                    <label for="inputPassword2" class="visually-hidden">Password</label>
                    <input type="text" class="form-control" id="inputPassword2" placeholder="Enter Voucher Code">
                </div>
                <div>
                    <button type="submit" class="btn btn-primary mb-3">Apply</button>
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <h5>Total </h5>
                <h4>$34.00</h4>
            </div>
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary mb-3">PROCEED TO CHECKOUT</button>
            </div>

        </div>
    </div>
</main>
<%@include file="WEB-INF/partials/footer.jsp"%>
</body>
</html>