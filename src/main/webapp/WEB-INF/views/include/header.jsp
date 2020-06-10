
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/a4b9f55ded.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Board</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing:border-box;
        }

        body {
            background-image: url(../resources/images/dive.png);
            background-size: cover;
            background-repeat: no-repeat;
        }

        /* navbar */
        .navbar a,
        .navbar h1,
        .navbar i {
            color: white;
        }

        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #263343;
            padding: 8px 12px;
        }

        .navbar_logo {
            display: flex;
            font-size: 24px;
            align-items: center;
            margin: 0px;
        }

        .navbar_logo i {
            padding: 0 10px;
        }

        .navbar_menu {
            display: flex;
            list-style: none;
            padding-left: 0px;
        }

        .navbar_menu li {
            padding: 8px 12px;
        }

        .navbar_menu li:hover {
            background-color: #4f5c6e;
            border-radius: 8px;
        }

        .navbar_icons {
            list-style: none;
            display: flex;
            padding-right: 50px;
        }

        .navbar_icons li {
            padding: 8px 12px;
        }

        .navbar_icons li:hover {
            background-color: #4f5c6e;
            border-radius: 8px;
        }

        .navbar_toggle_btn {
            display: none;
            position: absolute;
            right: 32px;
            font-size: 24px;
            color: skyblue;
        }

        i {
            font-size: 50px;
        }

        .search_bar_text {
            width: 300px;
            border: 0;
            border-bottom: 1px solid white;
            padding-bottom: 5px;
            outline: none;
            background-color: transparent;
            color: white;
        }

        .search_btn {
            width: 50px;
            height: 100%;
            border: 0;
            outline: none;
            color: #ffffff;
            background-color: transparent;
        }

        .fa-search {
            font-size: 30px;
        }

        @media screen and (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
                /* 로고를 왼쪽 상단에 놓기 위하여 */
                padding: 8px 24px;
            }

            .navbar_menu {
                display: none;
                /*javascript로 toggle버튼을 활성화할때만 사용하기위해서*/
                flex-direction: column;
                align-items: center;
                width: 100%;
                /*너비가 안먹어서 왼쪽으로 치우치기때문에 사용한다*/
            }

            .navbar_menu li {
                /*hover 효과를 꽉채우기위하여*/
                width: 100%;
                text-align: center;
                /*너비가 넓어졌을때 텍스트는 왼쪽으로 다시 가기때문 재지정해줘야한다*/
            }

            .navbar_icons {
                display: none;
                /*javascript로 toggle버튼을 활성화할때만 사용하기위해서*/
                justify-content: center;
                width: 100%;
                padding-left: 0;
            }

            .navbar_toggle_btn {
                display: block;
                /*화면이 줄어들었을때만 토글버튼이 나오도록 활성화*/
            }

            .navbar_menu.active,
            .navbar_icons.active {
                display: flex;
                /* 메뉴와 아이콘에 대하여
        javascript에서 클릭하면 active 하게한 내용을 토대로
        화면에 다시 보여지게 한다 */
            }
        }
    </style>
</head>

<body>
    <nav class="navbar">
        <div class="navbar_logo">
            <i class="fas fa-universal-access"></i>
            <h1>DIVE</h1>
        </div>
        <ul class="navbar_menu">
            <li><a href="/product/list">PRODUCT</a></li>
            <li><a href="/board/list">BOARD</a></li>
            <li><a
                    onclick="window.open ( '/chat/chatting', 'name', 'width = 400, height = 569, scrollbars=no, resizable=no, toolbars=no, menubar=no')">CHAT</a>
            </li>
            <li><a href="#">CORPORATION</a></li>
        </ul>
        <ul class="navbar_icons">
            <sec:authorize access="isAnonymous()">
                 <a href="/user/userLogin">
                <li>Log in</li>
            </a>
            <a href="/user/singUp">
                <li>Sign up</li>
            </a>
            </sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
            	<a class="nav-link" href="/user/userLogout">Logout</a>
            </sec:authorize>
        </ul>
        <a href="#" class="navbar_toggle_btn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>
<script>
        const togglebtn = document.querySelector('.navbar_toggle_btn');
        const menu = document.querySelector('.navbar_menu');
        const icon = document.querySelector('.navbar_icons');
 
        togglebtn.addEventListener('click', () => {
            menu.classList.toggle('active');
            icon.classList.toggle('active');
        });
</script>

