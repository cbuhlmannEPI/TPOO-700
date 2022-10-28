<script lang="ts" setup></script>

<template>
    <img width=200 src="../assets/logo-epitech.png" alt="">
  <!-- <div>{{ $route.params }}</div> -->

  <div class="workTable">
    <table>
      <tr>
        <th>Start</th>
        <th>End</th>
        <th></th>
      </tr>
      <tr v-for="workingtime in workingtimes" :key="workingtime.id">
        <td>{{formatDate(workingtime.start)}}</td>
        <td>{{formatDate(workingtime.end)}}</td>
        <td>
          <button class="seeDetails"> <a v-bind:href="'/workingTimes/' + $route.params['userI'] +'/'+workingtime.id "> Voir détails</a></button>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';
import moment from 'moment';


export default {
  data() {
    return {
      show: true,
      workingtimes: [],
      user: {
        username: '',
        email: '',
        id: ''
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
          this.user.username = '';
          this.user.email = '';
          this.users.push(response.data.data)
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    updateUser() { //fonction mettre à jour un User
      // var split = this.selected.split(" ");
      axios.put(`http://localhost:4000/api/users/` + this.user.id, {
        user: {
          username: this.user.username,
          email: this.user.email
        }
      })
        .then((response) => {
          this.show = true;
          this.user.username = '';
          this.user.email = '';
          this.users[this.selected]['username'] = response.data.data.username;
          this.users[this.selected]['email'] = response.data.data.email;
        })
    },
    deleteUser(id, index) { // sup un User
      // var split = this.selected.split(" ");
      axios.delete(`http://localhost:4000/api/users/` + id)
        .then(() => {
          this.users.splice(index, 1);
        })
        .catch(error => {
          console.error('There was an error!', error);
        });
    },
    getValue(id, index) {
      this.selected = index
      this.user.id = id
      axios
        .get(`http://localhost:4000/api/users/` + id)
        .then((response) => {
          this.show = false;
          this.user.username = response.data.data.username;
          this.user.email = response.data.data.email;
        })
        .catch((errors) => {
          console.log(errors)
        });
    },
    formatDate(value) {
      return moment(String(value)).format('YYYY-MM-DD hh:mm:ss')
    }
  },
  created() {
    axios
      .get(`http://localhost:4000/api/workingtimes/`+this.$route.params['userI'])
      .then((response) => {
        this.workingtimes = response.data.data;
      })
      .catch((errors) => {
        console.log(errors)
      });
  }
}

</script>
<style>
.workTable {
  display: flex;
  flex-direction: column;

}

table {
  border: solid 1px black;
  border-collapse: collapse;
}

td {
  padding: 10px;

  border: solid 1px black;
}

.seeDetails {
  background-color: rgb(44, 20, 182);

}
</style>

 