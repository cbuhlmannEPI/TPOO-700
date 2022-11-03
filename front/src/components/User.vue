<!-- eslint-disable vue/multi-word-component-names -->
<script lang="ts" setup>
</script>
<template>
  <img width=200 src="../assets/logo-epitech.png" alt="">

  <div class="head">

    <!-- filtre -->


    <!-- affichage user -->
    <div class="container">

      <!-- champs pour nom et prenom de l'user -->
      <label>ID <input class="name" v-model="user.id"></label>
      <button id="search" @click="getUserbyID" class="search">Search</button>

      <label>Username <input class="name" v-model="user.username"></label>

      <label>Email <input class="email" type="email" v-model="user.email"></label>
      <div class="buttons">
        <button @click="getUserbyUsernameAndEmail" class="search">Search</button>
        <button @click="updateUser" class="update">Modifier</button>
        <button @click="createUser" class="create">Créer</button>
        <button @click="deleteUser" class="delete">Supprimer</button>
        <button class="userDetail"> <a v-bind:href="'/WorkingTimes/' + user.id"> Voir détails</a></button>
      </div>
    </div>
  </div>
</template>


<script>

import axios from 'axios';
import Cookies from 'js-cookie';

export default {
  name: 'UserComponent',
  data() {
    return {
      show: false,
      user: {
        username: '',
        email: '',
        id: ''
      }
    }
  },
  methods: {
    createUser() { //fonction créer un User
      axios.post(`http://localhost:4000/api/users`, {
        user: {
          username: this.user.username,
          email: this.user.email
        }
      })
        .then((response) => {
          this.user.username = response.data.data.username;
          this.user.email = response.data.data.email;
          this.user.id = response.data.data.id;
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    updateUser() { //fonction mettre à jour un User
      axios.put(`http://localhost:4000/api/users/` + this.user.id, {
        user: {
          username: this.user.username,
          email: this.user.email
        }
      })
        .then((response) => {
          this.user.username = response.data.data.username;
          this.user.email = response.data.data.email;
          this.user.id = response.data.data.id;
        })
    },
    deleteUser() { // sup un User
      axios.delete(`http://localhost:4000/api/users/` + this.user.id)
        .then(() => {
          this.user.username = "";
          this.user.email = "";
          this.user.id = "";
        })
        .catch(error => {
          console.error('There was an error!', error);
        });
    },
    getUserbyID() {
      axios
        .get(`http://localhost:4000/api/users/` + this.user.id)
        .then((response) => {
          this.user.username = response.data.data.username;
          this.user.email = response.data.data.email;
          // sessionStorage.setItem("userID", response.data.data.id);
          // sessionStorage.setItem("username", response.data.data.username);
          Cookies.set('userID', response.data.data.id);
          Cookies.set('username', response.data.data.username);
        })
        .catch((errors) => {
          console.log(errors)
        });
    },
    getUserbyUsernameAndEmail() {
      axios
        .get(`http://localhost:4000/api/users?email=` + this.user.email + '&username=' + this.user.username)
        .then((response) => {
          this.user.username = response.data.data[0].username;
          this.user.email = response.data.data[0].email;
          this.user.id = response.data.data[0].id;
          // sessionStorage.setItem("userID", response.data.data.id);
          // sessionStorage.setItem("username", response.data.data.username);
          Cookies.set('userID', response.data.data.id);
          Cookies.set('username', response.data.data.username);
        })
        .catch((errors) => {
          console.log(errors)
        });
    },
  }
}

</script>
<style>
* {
  font-size: inherit;
}

input {
  display: block;
  padding: 10px;
  border-radius: 10px;
  border: solid 1px;
}

select {
  margin: 10px;
  padding: 10px;
  width: 14em;
  border-radius: 10px;
}

button#search {
  background-color: black;
}

button.search {
  background-color: black;
}

button {
  border-radius: 10px;
  padding: 10px;
  border: none;
  margin: 10px;
  color: white;
  transition: all ease 0.5s;

}

button:hover {
  transform: scale(1.1);
}




.head {
  margin-bottom: 5px;
  display: flex;

  padding: 10px;
}

.flex {

  display: flex;
  flex-wrap: nowrap;
}

#search {
  border: solid 1px black;
}

.create {

  background-color: rgb(53, 176, 53);
}

.update {
  background-color: orange;
}

.delete {
  background-color: #e63946;
}

.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 2em;

}

table {
  border: solid 1px black;
  border-collapse: collapse;
}

td {
  padding: 10px;

  border: solid 1px black;
}

.userDetail {
  background-color: rgb(44, 20, 182);

}

.userTable {
  display: flex;
  flex-direction: column;
  margin: 10px;
}
</style>
