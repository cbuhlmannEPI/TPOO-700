<script lang="ts" setup></script>

<template>
  <div>
    <button @click="refresh">
      REFRESH
    </button>
  </div>
  <!-- <div class="inputs">
    <label>Time</label> <input class="name" v-model="clock.time">

    <label>Status </label><input class="email" type="email" v-model="clock.status">
    <button @click="createClock" class="create">Créer</button>
  </div> -->
  <div>
    <button @click="clockStart">
      START
    </button>
    <button @click="clockEnd">
      END
    </button>
  </div>
  <!-- <div class="workTable">
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
  </div> -->
</template>
<script>
import axios from 'axios';
// import moment from 'moment';

export default {
  data() {
    return {
      start : '',
      clock: {
        // time: '',
        // status:'',
        username: this.$route.params['username']
      },
    }
  },
  methods: {
    createClock(dateStart) {
      axios.post(`http://localhost:4000/api/clocks/`+sessionStorage['userID'], {
        clock: {
          time: dateStart,
          status: true
        }
      })
        .then((response) => {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    clockStart(){
      const dateObj = new Date();
      let currentDate = this.addZero(dateObj.getFullYear())+'-'+this.addZero(dateObj.getMonth())+'-'+this.addZero(dateObj.getDate())+' '+this.addZero(dateObj.getHours())+':'+this.addZero(dateObj.getMinutes())+':'+this.addZero(dateObj.getSeconds());
      sessionStorage.setItem("start", currentDate);
      this.createClock(currentDate);
    },
    clockEnd(){
      const dateObj = new Date();
      let currentDate = this.addZero(dateObj.getFullYear())+'-'+this.addZero(dateObj.getMonth())+'-'+this.addZero(dateObj.getDate())+' '+this.addZero(dateObj.getHours())+':'+this.addZero(dateObj.getMinutes())+':'+this.addZero(dateObj.getSeconds());

      axios.post(`http://localhost:4000/api/workingtimes/` +sessionStorage['userID'], {
        workingtime: {
          start: String(sessionStorage['start']),
          end: String(currentDate)
        }
      })
        .then(() => {
          console.log('coucou')
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    addZero(val){
      if(String(val).length == 1){
        return '0'+val;
      }
      return val;
    },
    refresh() {
      window.location.reload()
    },
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
