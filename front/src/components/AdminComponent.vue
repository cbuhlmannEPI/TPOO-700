
<template>
    <div>Admin</div>
    <table>
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th></th>
        </tr>
        <tr v-for="(user, item) in users" :key="user.id">
            <td>{{user.username}}</td>
            <td>{{user.email}}</td>
            <td>{{user.role}}</td>
            <td>
            <button class="seeDetails"> <a v-bind:href="'/user/' + user.id">
                Voir détails</a>
            </button>
            <button class="seeDetails" @click="deleteUser(user.id, item)">
                Supprimer
            </button>
          </td>
        </tr>
    </table>
</template>
  
  
<script>

import axios from 'axios';

export default {
    data() {
        return {
            users: []
        }
    },
    methods: {
        deleteUser(id, idx){
            axios
            .delete(`http://localhost:4000/api/users/`+id)
            .then(() => {
                this.users.splice(idx, 1);
            })
            .catch((errors) => {
                console.log(errors)
            });
        }
    },
    created() {
        axios
            .get(`http://localhost:4000/api/allUsers/`)
            .then((response) => {
                this.users = response.data.data
            })
            .catch((errors) => {
                console.log(errors)
            });
    }

}
</script>