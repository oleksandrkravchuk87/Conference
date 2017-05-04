<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 21.04.2017
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Location</title>
    <%-- Interactive map--%>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css"/>
    <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"
            integrity="sha512-A7vV8IFfih/D732iSSKi20u/ooOfj/AGehOKq0f4vLT1Zr2Y+RX7C+w8A1gaSasGtRUZpF/NZgzSAu4/Gc41Lg=="
            crossorigin=""></script>
    <%--Loading of the map with a pointer--%>
    <script>
        $(window).ready(function () {

            var lmap = L.map('map').setView([49.83548, 24.01495], 16);
            var marker = L.marker([49.8349024, 24.01486]).addTo(lmap);
            //  marker.bindPopup("<b>Location</b>address<br>").openPopup();
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                maxZoom: 18,
                attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
                '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                'Imagery © <a href="http://mapbox.com">Mapbox</a>',
                id: 'mapbox.streets'
            }).addTo(lmap);
        })
    </script>


</head>
<body>
<div class="contentContainer">
<div class="location">
<img src="/resources/images/lviv-520x300.jpg" alt="Lviv" class="leftimg">
    <img width="50px" height="50px" src="/resources/images/locationPic.png">
<p id="p1">Lviv Polytechnic National University<br>
    12, Stepan Bandera street, 79013, Lviv, Ukraine</p>
</div>
<br>
<div class ="blueStripe">
</div>
    <%--block containing the map--%>
<div id="map">


</div>
</div>
</body>
</html>
