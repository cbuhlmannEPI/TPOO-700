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
    <button v-if="!start" @click="clockStart">
      START
    </button>
    <button v-else @click="clockEnd">
      END
    </button>
    <div v-if="secondes">
      {{heures+':'+minutes+':'+secondes}}
    </div>
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
      secondes: '00',
      minutes: '00',
      heures: '00',
      start : sessionStorage['start'],
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
      let currentDate = this.addZero(dateObj.getFullYear())+'-'+this.addZero(dateObj.getMonth()+1)+'-'+this.addZero(dateObj.getDate())+' '+this.addZero(dateObj.getHours())+':'+this.addZero(dateObj.getMinutes())+':'+this.addZero(dateObj.getSeconds());
      sessionStorage.setItem("start", currentDate);
      this.start = currentDate;
      this.createClock(currentDate);
    },
    clockEnd(){
      const dateObj = new Date();
      let currentDate = this.addZero(dateObj.getFullYear())+'-'+this.addZero(dateObj.getMonth()+1)+'-'+this.addZero(dateObj.getDate())+' '+this.addZero(dateObj.getHours())+':'+this.addZero(dateObj.getMinutes())+':'+this.addZero(dateObj.getSeconds());

      axios.post(`http://localhost:4000/api/workingtimes/` +sessionStorage['userID'], {
        workingtime: {
          start: String(sessionStorage['start']),
          end: String(currentDate)
        }
      })
        .then(() => {
          sessionStorage.removeItem('start');
          this.start = null;
          this.heures = "00";
          this.minutes = "00";
          this.secondes = "00";
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
      if(sessionStorage['start']){
        let date1 = new Date(sessionStorage['start']);
        let date2 = new Date();

        let totalSeconds = Math.round(Math.abs(date2 - date1) / 1000);
        let seconds = Math.floor(totalSeconds % 60);
        let minutes = Math.floor((totalSeconds % 3600) / 60);
        let hours = Math.floor((totalSeconds % (3600 * 24)) / 3600);
        this.secondes = this.addZero(seconds);
        this.minutes = this.addZero(minutes);
        this.heures = this.addZero(hours);
      }
    },
  },
  created() {
    this.refresh();
  }
}
</script>
<style scoped></style>
