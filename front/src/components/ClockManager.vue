<script lang="ts" setup></script>

<template>
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
      <button v-else @click="clockEnd">
        END
      </button>
    </div>
  </div>

</template>
<script>
import axios from 'axios';
// import moment from 'moment';

export default {
  data() {
    return {
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
      let currentDate = this.addZero(dateObj.getFullYear()) + '-' + this.addZero(dateObj.getMonth()) + '-' + this.addZero(dateObj.getDate()) + ' ' + this.addZero(dateObj.getHours()) + ':' + this.addZero(dateObj.getMinutes()) + ':' + this.addZero(dateObj.getSeconds());
      sessionStorage.setItem("start", currentDate);
      this.start = currentDate;
      this.createClock(currentDate);
    },
    clockEnd() {
      const dateObj = new Date();
      let currentDate = this.addZero(dateObj.getFullYear()) + '-' + this.addZero(dateObj.getMonth()) + '-' + this.addZero(dateObj.getDate()) + ' ' + this.addZero(dateObj.getHours()) + ':' + this.addZero(dateObj.getMinutes()) + ':' + this.addZero(dateObj.getSeconds());

      axios.post(`http://localhost:4000/api/workingtimes/` + sessionStorage['userID'], {
        workingtime: {
          start: String(sessionStorage['start']),
          end: String(currentDate)
        }
      })
        .then(() => {
          sessionStorage.removeItem('start');
          this.start = null;
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
      window.location.reload()
    },
  },
  created() {
    axios
      .get(`http://localhost:4000/api/clocks/` + sessionStorage['userID'])
      .then((response) => {
        this.clocks = response.data.data;
      })
      .catch((errors) => {
        console.log(errors)
      });
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
</style>
