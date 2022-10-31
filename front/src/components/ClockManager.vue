<script lang="ts" setup></script>

<template>
    <div class="inputs">



      <label>Time</label> <input class="name" v-model="clock.time">

      <label>Status </label><input class="email" type="email" v-model="clock.status">
    <button @click="createClock" class="create">Créer</button>
</div>
  <div class="workTable">
    <table>
      <tr>
        <th>time</th>
        <th>status</th>
      </tr>
      <tr v-for="clock in clocks" :key="clock.id">
        <td>{{ formatDate(clock.time) }}</td>
        <td>{{ clock.status }}</td>
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
      clocks:[],
      clock: {
        time: '',
        status:'',
        username: this.$route.params['username']
      },
    }
  },
  methods: {
    createClock() {
      axios.post(`http://localhost:4000/api/clocks/`+this.$route.params['userID'], {
        workingtime: {
          time: this.clock.time,
          status: this.clock.status
        }
      })
        .then((response) => {
          this.clock.push(response.data.data)
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
      .get(`http://localhost:4000/api/clocks/`+sessionStorage['userID'])
      .then((response) => {
        this.clocks = response.data.data;
      })
      .catch((errors) => {
        console.log(errors)
      });
  }
}
</script>
<style scoped></style>
