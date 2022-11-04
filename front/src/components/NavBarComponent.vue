<template>
    <header>
        <div id="header" class="navbar">
            <a v-bind:href="'/'">
                <div class="logo-navbar"></div>
            </a>
            <ul>

                <a v-bind:href="'/clocks/' + username">
                    <li>Clocks</li>
                </a>
                <li>
                    <a v-bind:href="'/WorkingTimes/' + userID"> Working Times</a>
                </li>
                <li>
                    <a v-bind:href="'/chartManager/' + userID">Charts</a>

                </li>
            </ul>
            <div class="account">
                <p>{{ username }}</p>
                <div id="account" class="img-account"></div>

            </div>
        </div>
        <div class="account-content">
            <div class="links d-flex flex-column m-2">
                <a href="">Se déconnecter</a>
                <a href="">Paramètres</a>
                <a href="">Mes informations</a>
            </div>

        </div>
    </header>
</template>

<script>

import Cookies from 'js-cookie';
import $ from 'jquery';

$(document).ready(function () {

    $("#account").click(function () {
        if (!$(".account-content").hasClass("display-account")) {

            $(".account-content").addClass("display-account");
            $(".account-content").show("fast");
        } else {
            $(".account-content").removeClass("display-account");
            $(".account-content").hide("fast");

        }

    });
});
export default {
    data() {
        return {
            username: null,
            userID: null
        }
    },
    methods: {},
    created() {
        this.username = Cookies.get('username')
        this.userID = Cookies.get('userID')
    },
    scroll() {

    }
}





</script>

<style>
.sticky {
    position: fixed;
    top: 0;
    width: 100%
}

* {
    font-family: 'Montserrat', sans-serif;
}

body {
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
    color: white;
    letter-spacing: 1.5px;
}

a:hover {
    text-decoration: none;
    color: white;
}



.navbar {
    padding: 0;
    margin: 0;
    width: 100%;
    color: white;
    height: auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: 700;
}

.account {
    display: flex;
    justify-content: center;
    align-items: center;
}

ul {
    display: flex;
    align-items: center;
    height: 100%;
    list-style-type: none;
    margin: 0;
}

ul li {
    display: inline;
    padding: 20px;

}

.img-account {
    margin: 20px;
    height: 50px;
    width: 50px;
    border-radius: 50%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url('https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80');
}

.logo-navbar {
    background-image: url(../assets/check-time.png);
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    height: 90px;
    width: 120px;
    float: left;

}

body {
    background: linear-gradient(11deg, rgba(255, 255, 255, 1) 1%, rgba(252, 176, 69, 1) 100%);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    min-height: 100vh;
}

.account-content {
    display: none;
    background-color: white;
    border-radius: 30px;
    position: absolute;
    right: 0px;
    min-height: 70%;
    margin-right: 15px;
    z-index: 9999;
}

.display-account {
    padding: 10px;
    position: absolute;
    right: 0px;
    min-height: 70%;
}


.account-content a {
    color: black;
}
</style>
green;