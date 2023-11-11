<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Item</title>
    <link rel="stylesheet" href="css/reset.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
    <h1>List New Item</h1>
    <form action="list" method="POST" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input required type="text" class="form-control" name="title" id="title">
        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="category1" value="option1">
                            <label class="form-check-label" for="category1">Earphones </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="category2" value="option2">
                            <label class="form-check-label" for="category2">Headset</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="category3" value="option3">
                            <label class="form-check-label" for="category3">Smart Watch</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="category4" value="option2">
                            <label class="form-check-label" for="category4">Vr Box</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="category5" value="option3">
                            <label class="form-check-label" for="category5">Power Banks</label>
                        </div>
        <div class="mb-3">
            <label for="brand" class="form-label">Brand</label>
            <input required type="text" name="brand" class="form-control" id="brand">
        </div>
        <div class="mb-3">
            <label for="model" class="form-label">Model</label>
            <input required type="text" name="model" class="form-control" id="model">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input required pattern="\'$'\d+\.\d\d" type="text" name="price" class="form-control" id="price">
        </div>
        <div class="mb-3">
            <label for="qty" class="form-label">Available quantity</label>
            <input required  pattern="^[0-9]+$" type="text" name="qty" class="form-control" id="qty">
        </div>
        <div class="mb-3">
            <label for="image1" class="form-label">Choose an image</label>
            <input required class="form-control" name="image1" type="file" id="image1"  accept="image/*" >
        </div>
        <div class="mb-3">
            <label for="image2" class="form-label">Choose an image</label>
            <input required class="form-control" name="image2" type="file" id="image2"  accept="image/*" >
        </div>
        <div class="mb-3">
            <label for="image3" class="form-label">Choose an image</label>
            <input required class="form-control" name="image3" type="file" id="image3"  accept="image/*" >
        </div>
        <div class="mb-3">
            <label for="image4" class="form-label">Choose an image</label>
            <input required class="form-control" name="image4" type="file" id="image4"  accept="image/*" >
        </div>
        <div class="mb-3">
            <label for="image5" class="form-label">Choose an image</label>
            <input required class="form-control" name="image5" type="file" id="image5"  accept="image/*" >
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea required class="form-control" name="description" id="description" rows="5"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</body>
</html>