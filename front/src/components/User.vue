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
      <label>Username <input class="name" v-model="user.username"></label>
      <label>Role <input class="name" v-model="user.role"></label>

      <label>Email <input class="email" type="email" v-model="user.email"></label>
      <div class="buttons">
        <button @click="updateUser" class="update">Modifier</button>
      </div>
    </div>
  </div>
  <div>
    <table>
        <tr>
            <th>start</th>
            <th>end</th>
            <th></th>
        </tr>
        <tr v-for="(wtime, item) in workingtimes" :key="wtime.id">
            <td>{{ formatDate(wtime.start) }}</td>
            <td>{{formatDate(wtime.end) }}</td>
            <td>
            <button class="seeDetails" @click="deleteWorkingtime(wtime.id, item)">
                Supprimer
            </button>
          </td>
        </tr>
    </table>
  </div>
</template>


<script>

import axios from 'axios';

export default {
  name: 'UserComponent',
  data() {
    return {
      show: false,
      user: {
        username: '',
        email: '',
        id: '',
        role: ''
      },
      workingtimes: []
    }
  },
  methods: {
    deleteWorkingtime(id, idx) { // sup un User
      axios.delete(`http://localhost:4000/api/workingtimes/` + id)
        .then(() => {
          this.workingtimes.splice(idx, 1);
        })
        .catch(error => {
          console.error('There was an error!', error);
        });
    },
    updateUser() { //fonction mettre à jour un User
      axios.put(`http://localhost:4000/api/users/` + this.$route.params['userID'], {
        user: {
          username: this.user.username,
          email: this.user.email,
          role: this.user.role
        }
      })
        .then((response) => {
          this.user.username = response.data.data.username;
          this.user.email = response.data.data.email;
          this.user.id = response.data.data.id;
        })
    },
    formatDate(value) {
        const dateObj = new Date(value);
        let date = this.addZero(dateObj.getFullYear()) + '-' + this.addZero(dateObj.getMonth() + 1) + '-' + this.addZero(dateObj.getDate()) + ' ' + this.addZero(dateObj.getHours()) + ':' + this.addZero(dateObj.getMinutes()) + ':' + this.addZero(dateObj.getSeconds());
        return date;
      },
    addZero(val) {
    if (String(val).length == 1) {
        return '0' + val;
    }
    return val;
    }
  },
  created(){
      axios
        .get(`http://localhost:4000/api/users/` + this.$route.params['userID'])
        .then((response) => {
          this.user.username = response.data.data.username;
          this.user.email = response.data.data.email;
          this.user.role = response.data.data.role;
          this.workingtimes = response.data.data.workingtimes
        })
        .catch((errors) => {
          console.log(errors)
        });
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
