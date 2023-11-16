<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GoCart-All in one place</title>
    <link rel="stylesheet" href="css/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<%@include file="WEB-INF/partials/header.jsp"%>
    <main class="d-flex">
        <div class="catetory_container d-flex mt-5">
            <a class="text-decoration-none link-dark" href="/app/products?category1=category1&max-price=&min-price=">
                <div class="category d-flex">
                    <div class="image-container">
                        <img src="image/electronic.png" alt="" width="140px">
                    </div>
                    <div><h5>Electronics</h5></div>
                </div>
            </a>
            <a class="text-decoration-none link-dark" href="/app/products?category2=category2&max-price=&min-price=">
            <div class="category d-flex">
                <div class="image-container">
                    <img src="image/vr.jpg" alt="" width="140px">
                </div>
                <div><h5>Sports</h5></div>
            </div>
            </a>
            <a class="text-decoration-none link-dark" href="/app/products?category3=category3&max-price=&min-price=">
            <div class="category d-flex">
                <div class="image-container">
                    <img src="image/smart-watch.jpg" alt="" width="140px">
                </div>
                <div><h5>Fashion</h5></div>
            </div>
            </a>
            <a class="text-decoration-none link-dark" href="/app/products?category4=category4&max-price=&min-price=">
            <div class="category d-flex">
                <div class="image-container">
                    <img src="image/vr.jpg" alt="" width="140px">
                </div>
                <div><h5>Home & Garden</h5></div>
            </div>
            </a>
            <a class="text-decoration-none link-dark" href="/app/products?category5=category5&max-price=&min-price=">
            <div class="category d-flex">
                <div class="image-container">
                    <img src="image/earbuds.jpg" alt="" width="140px">
                </div>
                <h5>Kid's Item</h5>
            </div>
            </a>
        </div>
        <h5 class="fw-bold align-self-start mt-5">Recently Viewed & more</h5>
        <div class="recent-container d-flex mt-3">
            <c:forEach var="item" items="${recentList}">
                <div class="item">
                    <a class="text-decoration-none link-dark"  href="/app/item?itemid=${item.itemid}">
                        <div class="item_image mb-2">
                            <div class="favorite-cont m-2"><i class="bi bi-heart mt-1"></i></div>
                            <img src=${empty item.path ? 'img/avatar.png': item.path} alt="" width="220px">
                        </div>
                        <h6>${item.title}</h6>
                    </a>
                    <div class="d-flex">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-half"></i>
                    </div>
                    <h6>$${item.price}</h6>
                </div>
            </c:forEach>

        </div>
        <h5 class="fw-bold align-self-start mt-5">Featured Products</h5>
        <div class="recent-container d-flex mt-3">
            <c:forEach var="item" items="${featuredList}">
                <div class="item">
                    <a class="text-decoration-none link-dark"  href="/app/item?itemid=${item.itemid}">
                        <div class="item_image mb-2">
                            <div class="favorite-cont m-2"><i class="bi bi-heart mt-1"></i></div>
                            <img src=${empty item.path ? 'img/avatar.png': item.path} alt="" width="220px">
                        </div>
                        <h6>${item.title}</h6>
                    </a>
                    <div class="d-flex">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-half"></i>
                    </div>
                    <h6>$${item.price}</h6>
                </div>
            </c:forEach>

        </div>
        <h5 class="fw-bold align-self-start mt-5">Latest Products</h5>
        <div class="recent-container d-flex mt-3">
            <c:forEach var="item" items="${latestList}">
                <div class="item">
                    <a class="text-decoration-none link-dark"  href="/app/item?itemid=${item.itemid}">
                        <div class="item_image mb-2">
                            <div class="favorite-cont m-2"><i class="bi bi-heart mt-1"></i></div>
                            <img src=${empty item.path ? 'img/avatar.png': item.path} alt="" width="220px">
                        </div>
                        <h6>${item.title}</h6>
                    </a>
                    <div class="d-flex">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-half"></i>
                    </div>
                    <h6>$${item.price}</h6>
                </div>
            </c:forEach>

        </div>
    </main>
<%@include file="WEB-INF/partials/footer.jsp"%>

</body>
</html>