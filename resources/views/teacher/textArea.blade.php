<!-- .row -->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="summernote">
                <h3>Description of the course ...</h3>
            </div>
        </div>
    </div>
</div>
<!-- /.row -->




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>bootstrap4</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
  </head>
  <body>
    <div id="summernote"></div>
    <script>
      $('#summernote').summernote({
        placeholder: 'Description of the course ...',
        tabsize: 2,
        height: 100
      });
    </script>
  </body>
</html>