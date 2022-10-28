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

      <label>Email <input class="email" type="email" v-model="user.email"></label>
      <div class="buttons">
        <button @click="createUser" class="create">Créer</button>

      </div>
    </div>
    <!-- btn CRUD -->

  </div>


  <div class="userTable">
    <table>
      <tr>
        <th>Username</th>
        <th>Email</th>
        <th>Accès détails</th>
      </tr>
      <tr v-for="(name, index) in users" :key="name.id" :value="name.id + ' ' + index">
        <td> {{ name.username }}</td>
        <td>{{ name.email }}</td>
        <td><button class="userDetail"> <a v-bind:href="'/WorkingTimes/' + name.id"> Voir détails</a></button> <button
            @click="updateUser" class="update">Modifier</button>
          <button @click="deleteUser" class="delete">Supprimer</button>
        </td>
      </tr>
    </table>
  </div>
  <!-- <select size="5" v-model="selected" @change="getValue">
      <option v-for="(name, index) in users" :key="name.id" :value="name.id + ' ' + index">{{ name.username }}
      </option>
    </select> -->

</template>


<script>

import axios from 'axios';

export default {
  data() {
    return {
      // names: ['Test, test', 'zest,zest'], //mettre data
      selected: '',
      prefix: '',
      users: [],
      user: {
        username: '',
        email: ''
      }
    }
  },
  computed: {
    filteredNames() { // filtre (miniscule to majuscule comprise )
      return this.names.filter((n) =>
        n.toLowerCase().startsWith(this.prefix.toLowerCase())
      )
    }
  },
  watch: {
    // selected(name) {
    //   [this.last, this.first] = name.split(', ')
    // }
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
          this.users.push(response.data.data)
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    updateUser() { //fonction mettre à jour un User
      var split = this.selected.split(" ");
      axios.put(`http://localhost:4000/api/users/` + split[0], {
        user: {
          username: this.user.username,
          email: this.user.email
        }
      })
        .then((response) => {
          console.log(response.data.data)
          this.users[split[1]]['username'] = this.user.username;
          this.users[split[1]]['email'] = this.user.email;
        })
    },
    deleteUser() { // sup un User
      var split = this.selected.split(" ");
      axios.delete(`http://localhost:4000/api/users/` + split[0])
        .then((response) => {
          console.log(response.data.data)
          this.users.splice(split[1]);
          this.user.username = "";
          this.user.email = "";
        })
        .catch(error => {
          console.error('There was an error!', error);
        });
    },
    getValue() {
      var split = this.selected.split(" ");
      axios
        .get(`http://localhost:4000/api/users/` + split[0])
        .then((response) => {
          this.user.username = response.data.data.username;
          this.user.email = response.data.data.email;
        })
        .catch((errors) => {
          console.log(errors)
        });
    }
  },
  created() {
    axios
      .get(`http://localhost:4000/api/users`)
      .then((response) => {
        this.users = response.data.data;
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
  justify-content: center;
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

a {
  text-decoration: none;
  color: white;
}
</style>
