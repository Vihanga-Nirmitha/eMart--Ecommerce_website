<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Products</title>
    <link rel="stylesheet" href="css/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/product.css">
    <script defer src="js/product.js" ></script>
</head>
<body>
<%@include file="WEB-INF/partials/header.jsp"%>
    <main class="d-flex flex-row">
        <form action="products" method="GET" class="mt-5 d-flex flex-column align-self-start filter" id="filterForm">
            <div class = "bot-border p-3"><h5 class="fw-bold">Categories</h5>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="category1" name="category1" id="flexCheckDefault" ${param.get("category1").equals("category1")? "checked": ""}>
                <label class="form-check-label" for="flexCheckDefault">
                    Electronics
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="category2" name="category2" id="flexCheckDefault2" ${param.get("category2").equals("category2")? "checked": ""}>
                <label class="form-check-label" for="flexCheckDefault2">
                    Sports
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="category3" name="category3" id="flexCheckDefault3" ${param.get("category3").equals("category3")? "checked": ""}>
                <label class="form-check-label" for="flexCheckDefault3">
                    Fashion
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="category4" name="category4" id="flexCheckDefault4" ${param.get("category4").equals("category4")? "checked": ""}>
                <label class="form-check-label" for="flexCheckDefault4">
                    Home & Garden
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="category5" name="category5" id="flexCheckDefault5" ${param.get("category5").equals("category5")? "checked": ""}>
                <label class="form-check-label" for="flexCheckDefault5">
                    Kid's Items
                </label>
            </div>
            </div>
            <div class="price mt-3 align-self-end" >Max Price: $<input type="text" value="${param.get("max-price")}" name="max-price" pattern="^[0-9]+$">.00</div>
            <div class="price bot-border align-self-end" >Min Price: $<input type="text" value="${param.get("min-price")}" name="min-price" pattern="^[0-9]+$">.00</div>
            <button class="btn btn-primary mt-3 align-self-center" type="submit">Apply</button>
        </form>
        <div class="content align-self-start flex-grow-1 d-flex flex-column">
            <div class="dropdown d-flex flex-row-reverse justify-content-between">
                <form action="products" method="GET">
                    <select class="form-select sort" aria-label="Default select example" id="myDropdown" onchange="showSelected()">
                            <option ${param.sort == 'Best match'? 'selected': ''}>Best match</option>
                            <option ${param.sort == 'Newest'? 'selected': ''}>Newest</option>
                            <option ${param.sort == 'Oldest'? 'selected': ''}>Oldest</option>
                            <option ${param.sort == 'Price :low first'? 'selected': ''}>Price :low first</option>
                            <option ${param.sort == 'Price :high first'? 'selected': ''}>Price :high first</option>
                            <option ${param.sort == 'Most Popular'? 'selected': ''}>Most Popular</option>
                    </select>
                </form>
                <div class="d-flex flex-column gap-2">
                    <div class="tag-container d-flex gap-3" id="tag1">

                    </div>
                    <div class="tag-container d-flex gap-3" id="tag2">

                    </div>
                </div>

            </div>
            <div class="container-md m-5">
                <div class="row">
                    <c:forEach var="item" items="${itemList}">
                    <div class="col-3">
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
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </main>
<%@include file="WEB-INF/partials/footer.jsp"%>
</body>
</html>