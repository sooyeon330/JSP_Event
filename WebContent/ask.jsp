<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.post {
    padding: 0 1.5% /* matches the column and -margin values */
}
.comment-form .form-control {
    border: 0px;
    background: #eee;
    min-height: 50px; /* make the .form-control taller */
}
.comment-form > .row {
    margin: 0 -1.5%; /* negative margin on row for new, fluid gutter */
}
.comment-form [class*="col-"] {
        padding: 0 1.5% /* new fluid gutter to tighten up the space between col-X-6 */
}


@media (min-width:992px) { 
    .post {
        width: 50%;
        max-width: 500px;
        margin: 0 auto;
    }
    .comment-form label {
        position: absolute;
        width: 200px;
    }
    .comment-form .name {
        left: -90%;
        top: 8px;
        text-align: right;
    }
    .comment-form .email {
        right: -90%;
        top: 8px;
    }
    .comment-form .message {
        left: -45%;
        top: 50%;
        margin-top: -16px;
        text-align: right;
    }
}


@media (min-width:1200px) { 
    .post {
        max-width: 525px;
    }
}

</style>
</head>
<body>
<div class="post">
 <div class="contact">
   <div class="title">
      <h2>Have a question?</h2>
   </div>
   <form class="comment-form">
      <div class="row">
         <div class="col-sm-6 form-group">
            <input type="text" class="form-control" placeholder="Name"/>
         </div>
         <div class="col-sm-6 form-group">
            <input type="text" class="form-control" placeholder="Email" />
         </div>
         <div class="clearfix"></div>
         <div class="col-md-12 form-group">
            <textarea name="" class="form-control" cols="47" rows="7" placeholder="Message"></textarea>
         </div>
         <div class="col-md-12 form-group">
           <button class="btn btn-block btn-lg btn-success">Button</button>
        </div>        

      </div>
   </form>
  </div>
</div>
</body>
</html>