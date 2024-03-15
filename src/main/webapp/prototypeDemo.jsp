<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.prototype.ex2.Circle"%>
<%@ page import="com.prototype.ex2.Rectangle"%>
<%@ page import="com.prototype.ex2.Shape"%>
<%@ page import=" java.util.ArrayList"%> 
<%@ page import=" java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prototype Pattern Demo</title>
<style>
    .shape {
        border: 2px solid black;
        margin: 10px;
        padding: 10px;
        display: inline-block;
    }
    .circle {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background-color: red; /* Default color for circles */
    }
    .rectangle {
        width: 100px;
        height: 60px;
        background-color: blue; /* Default color for rectangles */
    }
</style>
</head>
<body>

<h1>Prototype Pattern Demo</h1>

<%
    // Create shapes list and a copy list
    List<Shape> shapes = new ArrayList<>();
    List<Shape> shapesCopy = new ArrayList<>();

    // Create and add a circle to shapes list
    Circle circle = new Circle();
    circle.x = 10;
    circle.y = 20;
    circle.radius = 15;
    circle.color = "red";
    shapes.add(circle);

    // Clone the circle and add to shapes list
    Circle anotherCircle = (Circle) circle.clone();
    shapes.add(anotherCircle);

    // Create and add a rectangle to shapes list
    Rectangle rectangle = new Rectangle();
    rectangle.x = 30;
    rectangle.y = 40;
    rectangle.width = 100;
    rectangle.height = 60;
    rectangle.color = "blue";
    shapes.add(rectangle);

    // Clone all shapes and add to shapesCopy list
    for (Shape shape : shapes) {
        shapesCopy.add(shape.clone());
    }
%>

<h2>Original Shapes</h2>
<div>
    <% for (Shape shape : shapes) { %>
        <div class="shape">
            <% if (shape instanceof Circle) { %>
                <div class="circle"></div>
            <% } else if (shape instanceof Rectangle) { %>
                <div class="rectangle"></div>
            <% } %>
            <p><strong>Color:</strong> <%= shape.color %></p>
        </div>
    <% } %>
</div>

<h2>Cloned Shapes</h2>
<div>
    <% for (Shape shape : shapesCopy) { %>
        <div class="shape">
            <% if (shape instanceof Circle) { %>
                <div class="circle"></div>
            <% } else if (shape instanceof Rectangle) { %>
                <div class="rectangle"></div>
            <% } %>
            <p><strong>Color:</strong> <%= shape.color %></p>
        </div>
    <% } %>
</div>

</body>
</html>
