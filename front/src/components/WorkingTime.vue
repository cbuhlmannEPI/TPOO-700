
<template>
  <div class="container">

    <!-- champs pour nom et prenom de l'user -->

    <label>Start</label> <input class="name" type="datetime" v-model="workingtime.start">

    <label>End </label><input class="email" type="datetime" v-model="workingtime.end">

    <div class="buttons">
      <button @click="updatedWorkingtime" class="update">Modifier</button>
      <!-- <button @click="updateWorkingtimke" class="delete">Supprimer</button> -->
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
          start: this.workingtime.start,
          end: this.workingtime.end
        }
      })
        .then((response) => {
          // this.workingtime.start = '';
          // this.workingtime.end = '';
          console.log(response.data.data)
        })
    },
    // deleteWorkingtime() { // sup un User
    //   // var split = this.selected.split(" ");
    //   axios.delete(`http://localhost:4000/api/users/` + id)
    //     .then(() => {
    //       // this.users.splice(index, 1);
    //     })
    //     .catch(error => {
    //       console.error('There was an error!', error);
    //     });
    // },
    // formatDate(value) {
    //   return moment(String(value)).format('YYYY-MM-DD hh:mm:ss')
    // }
  },
  created() {
    axios
      .get(`http://localhost:4000/api/workingtimes/` + this.$route.params['userid'] + '/' + this.$route.params['id'])
      .then((response) => {
        this.workingtime.start = response.data.data[0].start
        this.workingtime.end = response.data.data[0].end
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
