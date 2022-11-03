
<template>
  <div class="container">

    <!-- champs pour nom et prenom de l'user -->

    <label>Start</label> <input class="name" type="datetime" v-model="workingtime.start">

    <label>End </label><input class="email" type="datetime" v-model="workingtime.end">

    <div class="buttons">
      <button @click="updatedWorkingtime" class="update">Modifier</button>
      <button @click="deleteWorkingtime" class="delete">Supprimer</button>
    </div>
  </div>
</template>
<script>
import axios from 'axios';
export default {

  data() {
    return {
      workingtime: {
        start: '',
        end: '',
        id: this.$route.params['id']
      },
    }
  },
  methods: {
    updatedWorkingtime() { //fonction mettre à jour un User
      axios.put(`http://localhost:4000/api/workingtimes/` + this.workingtime.id, {
        workingtime: {
          start: this.formatDate(this.workingtime.start),
          end: this.formatDate(this.workingtime.end)
        }
      })
        .then((response) => {
          console.log(response.data.data)
        })
        .catch(error => {
          console.error('There was an error!', error);
        });
    },
    deleteWorkingtime() { // sup un User
      axios.delete(`http://localhost:4000/api/workingtimes/` + this.workingtime.id)
        .then(() => {
          window.location.replace('/workingtimes/'+this.$route.params['userID'])
        })
        .catch(error => {
          console.error('There was an error!', error);
        });
    },
    formatDate(value) {
      const dateObj = new Date(value);
      let date = this.addZero(dateObj.getFullYear())+'-'+this.addZero(dateObj.getMonth()+1)+'-'+this.addZero(dateObj.getDate())+' '+this.addZero(dateObj.getHours())+':'+this.addZero(dateObj.getMinutes())+':'+this.addZero(dateObj.getSeconds());
      return date;
    },
    addZero(val){
      if(String(val).length == 1){
        return '0'+val;
      }
      return val;
    }
  },
  created() {
    if(sessionStorage['userID']){
      window.location.replace('/login');
      return true;
    }
    
    axios
      .get(`http://localhost:4000/api/workingtimes/` + this.$route.params['userID'] + '/' + this.$route.params['id'])
      .then((response) => {
        this.workingtime.start = this.formatDate(response.data.data[0].start)
        this.workingtime.end = this.formatDate(response.data.data[0].end)
      })
      .catch((errors) => {
        console.log(errors)
      });
  }
}
</script>
<style>
.container {
  display: flex;
  flex-direction: column;
  margin: 10px;
}

.container input {
  font-size: 25px;
}

button.update {
  margin-top: 30px;
  padding: 10px;
  border-radius: 10px;
  border: none;
  background-color: orange;
  color: white;
}
</style>
