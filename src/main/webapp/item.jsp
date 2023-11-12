<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Item</title>
    <link rel="stylesheet" href="css/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/item.css">
    <link rel="stylesheet" href="css/index.css">

</head>
<body>
<%@include file="WEB-INF/partials/header.jsp"%>
    <main class="d-flex flex-row align-items-start gap-5 justify-content-around">
        <div class="image-container">
                <div id="corouselindicator" class="carousel slide carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${empty preview.path1 ? 'img/avatar.png': preview.path1}" class="d-block w-100"  alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${empty preview.path2 ? 'img/avatar.png': preview.path2}" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${empty preview.path3 ? 'img/avatar.png': preview.path3}" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${empty preview.path4 ? 'img/avatar.png': preview.path4}" class="d-block w-100" w alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${empty preview.path5 ? 'img/avatar.png': preview.path5}" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#corouselindicator" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#corouselindicator" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                    <div class="carousel-indicators d-flex">

                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="0" class="active " aria-current="true" aria-label="Slide 1">
                            <div class="img-btn"><img src="${empty preview.path1 ? 'img/avatar.png': preview.path1}" class="d-block w-100" ></div>
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="1" aria-label="Slide 2">
                            <div class="img-btn"><img src="${empty preview.path2 ? 'img/avatar.png': preview.path2}" class="d-block w-100" ></div>
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="2" aria-label="Slide 3">
                            <div class="img-btn"><img src="${empty preview.path3 ? 'img/avatar.png': preview.path3}" class="d-block w-100" ></div>
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="3" aria-label="Slide 4">
                            <div class="img-btn"><img src="${empty preview.path4 ? 'img/avatar.png': preview.path4}" class="d-block w-100" ></div>
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="4" aria-label="Slide 5">
                            <div class="img-btn"><img src="${empty preview.path5 ? 'img/avatar.png': preview.path5}" class="d-block w-100" ></div>
                        </button>
                    </div>
                </div>
        </div>
        <div class="d-flex flex-column rest">

               <div class="fw-bold bot-border"><h2><p>${preview.brand} ${preview.model} ${preview.title}</p></h2></div>
                <div class="d-flex mt-5 mb-3 gap-3 align-items-center">
                    <label for="qty" class="form-label">Quantity: </label>
                   <input required pattern="^[0-9]+$" type="text" name="qty"class="form-control" id="qty"></span>
                    <h6>${preview.qty} Available / <span class="sold"> ${preview.sold} Sold</span></h6>
                </div>

                <div class ="d-flex gap-1 align-items-center bot-border">
                    <div class="spacer"></div>
                    <div>Price:</div>
                    <h3 class="m-3">${preview.price}</h3>
                    <div class="mt-2"><h6>was</h6></div>
                    <div class="mt-2 text-decoration-line-through"><h5>$50.00</h5></div>
                </div>
            <div class="d-flex flex-column align-items-center gap-3 mt-4 pb-4 btn-list bot-border">
                <button class="btn btn-primary" type="button">Buy it Now</button>
                <button class="btn" type="button">Add to Cart</button>
                <button class="btn btn-outline-info" type="button"><i class="bi bi-heart"></i> Add to Watch List</button>
            </div>


        </div>
    </main>
<%@include file="WEB-INF/partials/footer.jsp"%>
</body>
</html>