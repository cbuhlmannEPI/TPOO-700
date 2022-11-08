<script lang="ts" setup></script>

<template>
  <div class="fond">
    <div class="container-center">
      <div class="inputs">
        <label>Start</label> <input placeholder="2022-01-02 12:00:00" class="name" v-model="workingtime.start">

        <label>End </label><input class="email" placeholder="2022-01-02 14:00:00" type="email"
          v-model="workingtime.end">

        <div><button @click="createWorkingtime" class="create">Créer</button></div>
      </div>
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
      },
    }
  },
  methods: {
    createWorkingtime() { //fonction créer un User
      axios.post(`http://localhost:4000/api/workingtimes/` + Cookies.get('userID'), {
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
    if (!Cookies.get('userID')) {
      window.location.replace('/login');
      return true;
    }

    axios
      .get(`http://localhost:4000/api/allworkingtimes/` + Cookies.get('userID'))
      .then((response) => {
        console.log(response);
        this.workingtimes = response.data.data;
      })
      .catch((errors) => {
        console.log(errors)
      });
  }
}

</script>
<style>
a {
  text-decoration: none;
  color: white;
}

.container-center {
  display: flex;
  justify-content: center;
  align-items: center;
}

.inputs {
  margin: 0px 40px;
  display: flex;
  flex-direction: column;

}

.inputs label {
  margin: 15px 0px;
  font-size: 19px;
  font-weight: bold;
}

.inputs input {
  padding: 15px;
  background-color: white;
  font-size: 20px;
  border: none;
  border-radius: 10px;
}

.workTable {
  display: flex;
  flex-direction: column;

}

table {
  color: black;
  border-collapse: collapse;
  margin: 20px 40px;
  background-color: white;
}

td {
  padding: 10px;

  border-top: solid 1px;
}

th {
  padding: 10px;
  color: black;
  background-color: rgb(255, 254, 253);

}

tr:nth-child(even) {
  background-color: rgb(225, 229, 225);
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
  margin-top: 20px;
  border: none;
  border-radius: 10px;
  color: white;
  width: 100%;
  font-weight: bold;
  letter-spacing: 1px;
  transition: all ease 0.5s;

}

button.create:hover {
  background-color: white;
  color: black;
}
</style>

 