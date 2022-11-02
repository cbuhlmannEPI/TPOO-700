<script lang="ts" setup></script>

<template>
  <div>
    <button @click="refresh">
      REFRESH
    </button>
  </div>
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
        <th></th>
      </tr>
      <tr v-for="(clk, idx) in clocks" :key="clk.id">
        <td>{{ formatDate(clk.time) }}</td>
        <td>{{ clk.status }}</td>
        <td>
          <button @click="clockIn(clk, idx)">active/inactive</button>
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
      axios.post(`http://localhost:4000/api/clocks/`+sessionStorage['userID'], {
        clock: {
          time: this.clock.time,
          status: (this.clock.status === "true") 
        }
      })
        .then((response) => {
          this.clocks.push(response.data.data)
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    formatDate(value) {
      return moment(String(value)).format('YYYY-MM-DD hh:mm:ss')
    },
    refresh() {
      window.location.reload()
    },
    clockIn(clk, idx){
      axios.put(`http://localhost:4000/api/clocks/`+clk.id, {
        clock: {
          status: (clk.status) ? false : true
        }
      })
        .then((response) => {
          this.clocks[idx].status = response.data.data.status
        })
        .catch(function (error) {
          console.log(error);
        });

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
