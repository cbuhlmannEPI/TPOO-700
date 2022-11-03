<script lang="ts" setup></script>

<template>
  <div class="chrono-container">
    <div class="card-clock">
      <div class="content-button">
        <div>
          <button class="refresh" @click="refresh">
            REFRESH
          </button>
        </div>
        <div>
          <button class="start" v-if="!start" @click="clockStart">
            START
          </button>
          <button class="end" v-else @click="clockEnd">
            END
          </button>
        </div>
      </div>

      <div class="chrono">

        <div class="chrono-content" v-if="secondes">
          {{ heures + ':' + minutes + ':' + secondes }}
        </div>
      </div>
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
      start: sessionStorage['start'],
      clock: {
        // time: '',
        // status:'',
        username: this.$route.params['username']
      },
    }
  },
  methods: {
    createClock(dateStart) {
      axios.post(`http://localhost:4000/api/clocks/` + sessionStorage['userID'], {
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
    clockStart() {
      const dateObj = new Date();

      let currentDate = this.addZero(dateObj.getFullYear()) + '-' + this.addZero(dateObj.getMonth() + 1) + '-' + this.addZero(dateObj.getDate()) + ' ' + this.addZero(dateObj.getHours()) + ':' + this.addZero(dateObj.getMinutes()) + ':' + this.addZero(dateObj.getSeconds());
      sessionStorage.setItem("start", currentDate);
      this.start = currentDate;
      this.createClock(currentDate);
    },
    clockEnd() {
      const dateObj = new Date();
      let currentDate = this.addZero(dateObj.getFullYear()) + '-' + this.addZero(dateObj.getMonth() + 1) + '-' + this.addZero(dateObj.getDate()) + ' ' + this.addZero(dateObj.getHours()) + ':' + this.addZero(dateObj.getMinutes()) + ':' + this.addZero(dateObj.getSeconds());


      axios.post(`http://localhost:4000/api/workingtimes/` + sessionStorage['userID'], {
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
    addZero(val) {
      if (String(val).length == 1) {
        return '0' + val;
      }
      return val;
    },
    refresh() {
      if (sessionStorage['start']) {
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
    if (!sessionStorage['userID']) {
      window.location.replace('/login');
      return true;
    }

    this.refresh();
  }
}
</script>
<style>
.content-button {
  height: 300px;
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  gap: 2em;
}

button.refresh {
  border: solid 1px black;
  font-size: 30px;
  border-radius: 30px;
  padding: 15px;
  color: white;
  background-color: blue;
}

button.start {
  border: solid 1px black;
  border-radius: 30px;
  font-size: 30px;
  padding: 15px;
  background-color: rgb(68, 141, 68);
  color: white;

}

.chrono {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-size: 40px;

}

.chrono button {
  border: solid 1px black;
  border-radius: 10px;
  padding: 10px;
}

button.end {
  border: solid 1px black;
  background-color: rgb(228, 174, 39);
  color: white;
  border-radius: 10px;
  padding: 10px;
}

.chrono-content {
  border: solid 1px black;
  padding: 10px;
}

.card-clock {
  border-radius: 20px;
  box-shadow: 1px 1px 8px 5px rgba(0, 0, 0, 0.37);
  margin-top: 20px;
  width: 50%;
}

.chrono-container {
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
