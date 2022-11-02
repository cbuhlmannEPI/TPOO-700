<template>

    <div id="app">

        <div class="login-page">
            <transition name="fade">
                <div v-if="!registerActive" class="wallpaper-login"></div>
            </transition>
            <div class="wallpaper-register"></div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mx-auto">
                        <div v-if="!registerActive" class="card login" v-bind:class="{ error: emptyFields }">
                            <h1>Se connecter</h1>
                            <!-- <form class="form-group"> -->
                                <input v-model="emailLogin" type="email" class="form-control" placeholder="Email"
                                    required>
                                <input v-model="passwordLogin" type="password" class="form-control"
                                    placeholder="Password" required>
                                <button class="btn btn-primary" @click="getUserbyUsernameAndEmail">Envoyer</button>
                                <p>Pas de compte? <a href="#"
                                        @click="registerActive = !registerActive, emptyFields = false">S'inscrire
                                        ici</a>
                                </p>
                                <p><a href="#">Mot de passe oublié ?</a></p>
                            <!-- </form> -->
                        </div>

                        <div v-else class="card register" v-bind:class="{ error: emptyFields }">
                            <h1>Sign Up</h1>
                            <form class="form-group">
                                <input v-model="emailReg" type="email" class="form-control" placeholder="Email"
                                    required>
                                <input v-model="passwordReg" type="password" class="form-control" placeholder="Password"
                                    required>
                                <input v-model="confirmReg" type="password" class="form-control"
                                    placeholder="Confirm Password" required>
                                <input type="submit" class="btn btn-primary" @click="getUserbyUsernameAndEmail">
                                <p>Already have an account? <a href="#"
                                        @click="registerActive = !registerActive, emptyFields = false">Sign in here</a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</template>
<script>
import axios from 'axios';

export default {
    data() {
        return {
            registerActive: false,
            emailLogin: "",
            passwordLogin: "",
            emailReg: "",
            passwordReg: "",
            confirmReg: "",
            emptyFields: false
        }
    },

    methods: {
        doLogin() {
            if (this.emailLogin === "" || this.passwordLogin === "") {
                this.emptyFields = true;
            } else {
                alert("You are now logged in");
            }
        },

        doRegister() {
            if (this.emailReg === "" || this.passwordReg === "" || this.confirmReg === "") {
                this.emptyFields = true;
            } else {
                alert("You are now registered");
            }
        },
        getUserbyUsernameAndEmail() {
            axios
                .get(`http://localhost:4000/api/users?email=` + this.emailLogin + '&username=' + this.passwordLogin)
                .then((response) => {
                    sessionStorage.setItem("userID", response.data.data[0].id);
                    sessionStorage.setItem("username", response.data.data[0].username);
                    window.location.replace('/')
                })
                .catch((errors) => {
                    console.log(errors)
                });
            },
    }
}
</script>

<style>
p {
    line-height: 1rem;
}

.card {
    padding: 20px;
}

.form-group input {
    margin-bottom: 20px;
}

.login-page {
    align-items: center;
    justify-content: center;
    display: flex;
    height: 100vh;
}

.login-page .wallpaper-login {
    background: url(https://images.unsplash.com/photo-1616198814651-e71f960c3180?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80) no-repeat center center;
    background-size: cover;
    height: 100%;
    position: absolute;
    width: 100%;
}

.login-page .fade-enter-active,
.login-page .fade-leave-active {
    transition: opacity 0.5s;
}

.login-page .fade-enter,
.login-page .fade-leave-to {
    opacity: 0;
}

.login-page .wallpaper-register {
    background: url(https://images.pexels.com/photos/533671/pexels-photo-533671.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260) no-repeat center center;
    background-size: cover;
    height: 100%;
    position: absolute;
    width: 100%;
    z-index: -1;
}

.login-page h1 {
    margin-bottom: 1.5rem;
}

.error {
    animation-name: errorShake;
    animation-duration: 0.3s;
}

@keyframes errorShake {
    0% {
        transform: translateX(-25px);
    }

    25% {
        transform: translateX(25px);
    }

    50% {
        transform: translateX(-25px);
    }

    75% {
        transform: translateX(25px);
    }

    100% {
        transform: translateX(0);
    }
}
</style>