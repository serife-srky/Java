
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AracGiris List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        @import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css');
        @media(min-width:768px) {
            body {
                margin-top: 50px;
            }
            /*html, body, #wrapper, #page-wrapper {height: 100%; overflow: hidden;}*/
        }

        #wrapper {
            padding-left: 0;
        }

        #page-wrapper {
            width: 100%;
            padding: 0;
            background-color: #fff;
        }

        @media(min-width:768px) {
            #wrapper {
                padding-left: 225px;
            }

            #page-wrapper {
                padding: 22px 10px;
            }
        }

        /* Top Navigation */

        .top-nav {
            padding: 0 15px;
        }

        .top-nav>li {
            display: inline-block;
            float: left;
        }

        .top-nav>li>a {
            padding-top: 20px;
            padding-bottom: 20px;
            line-height: 20px;
            color: #fff;
        }

        .top-nav>li>a:hover,
        .top-nav>li>a:focus,
        .top-nav>.open>a,
        .top-nav>.open>a:hover,
        .top-nav>.open>a:focus {
            color: #fff;
            background-color: #1a242f;
        }

        .top-nav>.open>.dropdown-menu {
            float: left;
            position: absolute;
            margin-top: 0;
            /*border: 1px solid rgba(0,0,0,.15);*/
            border-top-left-radius: 0;
            border-top-right-radius: 0;
            background-color: #fff;
            -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
            box-shadow: 0 6px 12px rgba(0,0,0,.175);
        }

        .top-nav>.open>.dropdown-menu>li>a {
            white-space: normal;
        }

        /* Side Navigation */

        @media(min-width:768px) {
            .side-nav {
                position: fixed;
                top: 60px;
                left: 225px;
                width: 225px;
                margin-left: -225px;
                border: none;
                border-radius: 0;
                border-top: 1px rgba(0,0,0,.5) solid;
                overflow-y: auto;
                background-color: #222;
                /*background-color: #5A6B7D;*/
                bottom: 0;
                overflow-x: hidden;
                padding-bottom: 40px;
            }

            .side-nav>li>a {
                width: 225px;
                border-bottom: 1px rgba(0,0,0,.3) solid;
            }

            .side-nav li a:hover,
            .side-nav li a:focus {
                outline: none;
                background-color: #1a242f !important;
            }
        }

        .side-nav>li>ul {
            padding: 0;
            border-bottom: 1px rgba(0,0,0,.3) solid;
        }

        .side-nav>li>ul>li>a {
            display: block;
            padding: 10px 15px 10px 38px;
            text-decoration: none;
            /*color: #999;*/
            color: #fff;
        }

        .side-nav>li>ul>li>a:hover {
            color: #fff;
        }

        .navbar .nav > li > a > .label {
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            border-radius: 50%;
            position: absolute;
            top: 14px;
            right: 6px;
            font-size: 10px;
            font-weight: normal;
            min-width: 15px;
            min-height: 15px;
            line-height: 1.0em;
            text-align: center;
            padding: 2px;
        }

        .navbar .nav > li > a:hover > .label {
            top: 10px;
        }

        .navbar-brand {
            padding: 5px 15px;
        }
    </style>
</head>
<body>

<div class="col-sm-2 sidenav hidden-xl">
    <div id="throbber" style="display:none; min-height:120px;">     </div>
    <div id="noty-holder">   </div>
    <div id="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav" style="top: 50px;">
                    <li>
                        <a href="/abone/list2" style="text-align: center">ABONE BİLGİLERİ</a>
                    </li>
                    <li  class="active" style="text-align: center">
                        <a href="/aracGiris/list2">ARAÇ GİRİŞ</a>
                    </li>
                    <li>
                        <a href="/aracCikis/list2" style="text-align: center">ARAÇ ÇIKIŞ</a>
                    </li>
                    <li>
                        <a href="/parkAlani/list2" style="text-align: center">PARK ALANI</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>


<%--<div class="container">--%>
<div class="container-fluid">
    <div class="row content">

        <div class="col-sm-10">
            <div class="well">
                <table class="table table-bordered">
                    <th scope="row">ID</th>
                    <th scope="row">TC</th>
                    <th scope="row">Konum</th>
                    <th scope="row">Geliş Tarihi</th>
                    <th scope="row">Plaka</th>
                    <th scope="row">Araç Giriş Güncelle</th>
                    <th scope="row">Araç Giriş Sil</th>

                    </thead>
                    <tbody>
                    <c:forEach items="${aracGirisList}" var="aracgiris" >
                        <tr>
                            <td>${aracgiris.id}</td>
                            <td>${aracgiris.tc}</td>
                            <td><fmt:formatDate value="${aracgiris.geliszamani}" pattern="dd/MM/yyyy" /></td>
                            <td>${aracgiris.konum}</td>
                            <td>${aracgiris.plaka}</td>
                            <td>
                                <spring:url value="/aracGiris/editAracGiris/${aracgiris.id}" var="editURL" />
                                <a class="btn btn-info"style="background: royalblue" href="${editURL}" role="button" >Araç Giriş Güncelle</a>
                            </td>
                            <td>
                                <spring:url value="/aracGiris/deleteAracGiris/${aracgiris.id}" var="deleteURL" />
                                <a class="btn btn-danger"style="background: red" href="${deleteURL}" role="button" >Araç Giriş Sil</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <spring:url value="/aracGiris/addAracGiris/" var="addURL" />
                <a class="btn btn-success" style="background: green" href="${addURL}" role="button" >Yeni Arac Giriş Ekle</a>
            </div>
</body>

</html>