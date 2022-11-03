<script lang="ts" setup></script>

<template>
  <div class="fond">
    <!-- <div>{{ $route.params }}</div> -->
    <div class="inputs">

      <label>Start</label> <input placeholder="2022-01-02 12:00:00" class="name" v-model="workingtime.start">

      <label>End </label><input class="email" placeholder="2022-01-02 14:00:00" type="email" v-model="workingtime.end">

      <div class="create"><button @click="createWorkingtime" class="create">Créer</button></div>
    </div>
    <div class="workTable">
      <table>
        <tr>
          <th>Start</th>
          <th>End</th>
          <th></th>
        </tr>
        <tr v-for="wtime in workingtimes" :key="wtime.id">
          <td>{{ formatDate(wtime.start) }}</td>
          <td>{{ formatDate(wtime.end) }}</td>
          <td>
            <button class="seeDetails"> <a v-bind:href="'/workingTimes/' + $route.params['userID'] + '/' + wtime.id">
                Voir détails</a></button>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Cookies from 'js-cookie';

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
      axios.post(`http://localhost:4000/api/workingtimes/` + this.$route.params['userID'], {
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
  created() {
    if(!Cookies.get('userID')){
      window.location.replace('/login');
      return true;
    }

    axios
      .get(`http://localhost:4000/api/workingtimes/` + this.$route.params['userID'])
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
.inputs {
  margin: 0px 40px;
  display: flex;
  flex-direction: column;
  width: 30%;

}

.inputs input {
  padding: 10px;
  background: transparent;
  font-size: 20px;
  border: solid 2px black;
}

.workTable {
  display: flex;
  flex-direction: column;

}

table {
  border: solid 1px black;
  border-collapse: collapse;
  margin: 20px 40px;
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
  margin-top: 10px;
  border: none;
  border-radius: 10px;
  color: white;

}
</style>

 