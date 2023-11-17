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
    <script defer src="js/item.js"></script>

</head>
<body>
<%@include file="WEB-INF/partials/header.jsp"%>
<main>
    <div class="top-main d-flex flex-row align-items-start gap-5 justify-content-around">
        <div class="image-container">
                <div id="corouselindicator" class="carousel carousel-dark slide">

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
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="1" aria-label="Slide 2">
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="2" aria-label="Slide 3">
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="3" aria-label="Slide 4">
                        </button>
                        <button type="button" data-bs-target="#corouselindicator"  data-bs-slide-to="4" aria-label="Slide 5">
                        </button>
                    </div>
                </div>
        </div>
        <div class="d-flex flex-column rest">

               <div class="fw-bold bot-border mt-5"><h2><p>${preview.brand} ${preview.model} ${preview.title}</p></h2></div>
                <div class="d-flex mt-5 mb-3 gap-3 align-items-center">
                    <label for="qty" class="form-label">Quantity: </label>
                   <input required pattern="^[0-9]+$" type="text" name="qty"class="form-control" id="qty"></span>
                    <h6>${preview.qty} Available / <span class="sold"> ${preview.sold} Sold</span></h6>
                </div>

                <div class ="d-flex gap-1 align-items-center bot-border">
                    <div class="spacer"></div>
                    <div>Price:</div>
                    <h3 class="m-3">$${preview.price}</h3>
                    <div class="mt-2"><h6>was</h6></div>
                    <div class="mt-2 text-decoration-line-through"><h5>$${String.format("%.2f",preview.price*1.2)}</h5></div>
                </div>
            <div class="d-flex flex-column align-items-center gap-3 mt-5 pb-4 btn-list">
                <button class="btn btn-primary" type="button">Buy it Now</button>
                <button class="btn" type="button">Add to Cart</button>
                <button class="btn btn-outline-info" type="button"><i class="bi bi-heart"></i> Add to Watch List</button>
            </div>
            <div class="invisible position-absolute get-rating">
                <c:forEach var="item" items="${feedbackList}">
                    <h5>${item.rating}</h5>
                </c:forEach>
            </div>

            <div class="d-flex gap-5 feedback align-items-center pt-5">
                <div class="rating">
                    <div class="d-flex ">
                        <h1></h1><h3>/5</h3>
                    </div>
                    <div class="d-flex fs-3 gap-1" id="star-list">
                        <i class="shine-star"></i>
                        <i class="shine-star"></i>
                        <i class="shine-star"></i>
                        <i class="shine-star"></i>
                        <i class="shine-star"></i>
                    </div>
                    <h6></h6>

                </div>
                <div>
                    <div id="bar1" class="star-row d-flex gap-3 align-items-center" shine-star>
                        <div class="d-flex gap-1">
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                        </div>
<%--                        <div class="progress" role="progressbar" aria-label="Warning example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">--%>
<%--                            <div class="progress-bar bg-warning" style="width: 75%"></div>--%>
<%--                        </div>--%>
                        <div class="bar progress" role="progressbar">

                        </div>
                        <div class="mt-2"><h6> 12</h6></div>

                    </div>
                    <div id="bar2" class="star-row d-flex gap-3 align-items-center">
                        <div class="d-flex gap-1">
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                        </div>
                        <div class="bar progress" role="progressbar">

                        </div>
                        <div class="mt-2"><h6> 12</h6></div>

                    </div>
                    <div id="bar3" class="star-row d-flex gap-3 align-items-center">
                        <div class="d-flex gap-1">
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                        </div>
                        <div class="bar progress" role="progressbar">

                        </div>
                        <div class="mt-2"><h6> 12</h6></div>

                    </div>
                    <div id="bar4" class="star-row d-flex gap-3 align-items-center">
                        <div class="d-flex gap-1">
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                        </div>
                        <div class="bar progress" role="progressbar">

                        </div>
                        <div class="mt-2"><h6> 12</h6></div>

                    </div>
                    <div id="bar5" class="star-row d-flex gap-3 align-items-center">
                        <div class="d-flex gap-1">
                            <i class="bi bi-star-fill shine-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                            <i class="bi bi-star-fill dark-star"></i>
                        </div>
                        <div class="bar progress" role="progressbar">

                        </div>
                        <div class="mt-2"><h6> 12</h6></div>

                    </div>
                </div>

            </div>


        </div>
    </div>
    <div class="description mt-5">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Description</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Feedback</button>
            </li>

        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active lh-lg pt-4" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">${preview.description}</div>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                <c:forEach var="feedback" items="${feedbackList}">
                <div class="feedback-container mt-4 mb-1">
                    <div class="d-flex gap-1">
                        <i class="${feedback.rating >= 1? "bi bi-star-fill": "bi bi-star"} shine-star"></i>
                        <i class="${feedback.rating >= 2? "bi bi-star-fill": "bi bi-star"} shine-star"></i>
                        <i class="${feedback.rating >= 3? "bi bi-star-fill": "bi bi-star"} shine-star"></i>
                        <i class="${feedback.rating >= 4? "bi bi-star-fill": "bi bi-star"} shine-star"></i>
                        <i class="${feedback.rating >= 5? "bi bi-star-fill": "bi bi-star"} shine-star"></i>
                        <div class="ml-3"><h6>on ${feedback.date}</h6></div>
                    </div>
                    <div><h6>${feedback.username}</h6></div>
                    <div class="mt-2"><h5>${feedback.comment}</h5></div>
                </div>
                </c:forEach>
            </div>

        </div>
    </div>
</main>
<%@include file="WEB-INF/partials/footer.jsp"%>
</body>
</html>