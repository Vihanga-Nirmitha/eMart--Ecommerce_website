<header>
    <div class="container-lg search-container d-flex align-items-center mt-3">
        <div><img src="image/logo.png" alt="" width="200px"></div>
        <form class="mainsearch d-flex" action="products" method="GET">

                <input type="text" class="flex-grow-1 border border-0 " name = "search">
                <button class="search btn" type="submit">
                    <i class="bi bi-search"></i>
                </button>


        </form>
        <div class="d-flex signin-container">
            <div class="signin rounded-pill">signin</div>
            <div class="favorite rounded-circle"><i class="bi bi-heart"></i></div>
            <div class="cart rounded-circle"><a href="/app/cart"><i class="bi bi-cart3"></i></a></div>
        </div>
    </div>
    <div class="menu-container d-flex  ">

        <div><a class="text-decoration-none link-dark" href="/app/"><h6>Home</h6></a></div>
        <div><a class="text-decoration-none link-dark" href="/app/products?category1=category1&category2=category2&category3=category3&category4=category4&category5=category5&max-price=&min-price="><h6>Products</h6></a></div>
        <div><h6>About</h6></div>
        <div><h6>Contact Us</h6></div>
        <div><h6>Account</h6></div>

    </div>
</header>
