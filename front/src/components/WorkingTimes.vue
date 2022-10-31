<script lang="ts" setup></script>

<template>

  <!-- <div>{{ $route.params }}</div> -->
  <div class="inputs">



    <label>Start</label> <input class="name" v-model="workingtime.start">

    <label>End </label><input class="email" type="email" v-model="workingtime.end">
    <button @click="createWorkingtime" class="create">Créer</button>
  </div>
  <div class="workTable">
    <table>
      <tr>
        <th>Start</th>
        <th>End</th>
        <th></th>
      </tr>
      <tr v-for="workingtime in workingtimes" :key="workingtime.id">
        <td>{{ formatDate(workingtime.start) }}</td>
        <td>{{ formatDate(workingtime.end) }}</td>
        <td>
          <button class="seeDetails"> <a v-bind:href="'/workingTimes/' + $route.params['userI'] + '/' + workingtime.id">
              Voir détails</a></button>
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
      workingtime: {
        start: '',
        end: ''
      }
    }
  },
  methods: {
    createWorkingtime() { //fonction créer un User
      axios.post(`http://localhost:4000/api/workingtimes/`+this.$route.params['userID'], {
        workingtime: {
          start: this.workingtime.start,
          end: this.workingtime.end
        }
      })
        .then((response) => {
          this.workingtime.start = '';
          this.workingtime.end = '';
          this.workingtimes.push(response.data.data)
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    formatDate(value) {
      return moment(String(value)).format('YYYY-MM-DD hh:mm:ss')
    }
  },
  created() {
    axios
      .get(`http://localhost:4000/api/workingtimes/`+this.$route.params['userID'])
      .then((response) => {
        this.workingtimes = response.data.data;
      })
      .catch((errors) => {
        console.log(errors)
      });
    axios
      .get(`http://localhost:4000/api/users/` + this.user.id)
      .then((response) => {
        this.user.username = response.data.data.username;
        this.user.email = response.data.data.email;
      })
      .catch((errors) => {
        console.log(errors)
      });
  }
}

</script>
<style>
.inputs {
  padding: 10px;
  margin: 10px;
  display: flex;
  flex-direction: column;

}

.inputs input {
  font-size: 30px;
}

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

button.seeDetails {
  border: none;
  padding: 10px;
  font-size: 15px;
  border-radius: 10px;
  color: white;
}

.seeDetails {
  background-color: rgb(44, 20, 182);

}

button.create {
  padding: 10px;
  background-color: green;

  margin: 10px;
  border: none;
  border-radius: 10px;
  color: white;

}
</style>

 