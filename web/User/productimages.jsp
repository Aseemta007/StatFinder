<%-- 
    Document   : newjspcarousel
    Created on : May 21, 2024, 7:14:35 PM
    Author     : ANANTHU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>.splide__slide img {
  width: 100%;
  height: auto;
}</style>
    </head>
    <body>
        <section id="image-carousel" class="splide">
  <div class="splide__track">
    <ul class="splide__list">
      <li class="splide__slide">
        <img src="../Assets/Files/UserPhoto/UserPhoto_1114.png" alt="">
        <div>Description 01</div>
      </li>
      <li class="splide__slide">
        <img src="../Assets/Files/UserPhoto/UserPhoto_1404.png" alt="">
        <div>Description 02</div>
      </li>
    </ul>
  </div>
</section>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script> <!--The jQuery (Javascript Library) file in the specified directory is being processed here-->         
    <script>
        document.addEventListener('DOMContentLoaded', function () {
  new Splide('#image-carousel', {
    perPage: 2,
    breakpoints: {
      640: {
        perPage: 1,
      },
    },
  }).mount();
});
</script>
</html>
