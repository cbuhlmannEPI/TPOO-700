<!-- eslint-disable vue/multi-word-component-names -->
<script lang="ts" setup>
</script>
<template>
  <img width=200 src="../assets/logo-epitech.png" alt="">

  <div class="head">

    <!-- filtre -->
    <input id="search" v-model="prefix" placeholder="Filter prefix">

    <div class="container">
      <select size="5" v-model="selected">
        <option v-for="name in filteredNames" :key="name">{{ name }}</option>
      </select>
    </div>
    <!-- affichage user -->
    <div class="container">

      <!-- champs pour nom et prenom de l'user -->
      <div class="flex">
        <label>Nom: <input class="name" v-model="first"></label>
      </div>
      <div class="flex">
        <label>Email <input class="email" v-model="last"></label>
      </div>
    </div>
    <!-- btn CRUD -->
    <div class="buttons">
      <button @click="createUser" class="create">Créer</button>
      <button @click="updateUser" class="update">Modifier</button>
      <button @click="deleteUser" class="delete">Supprimer</button>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      names: ['Test, test', 'zest,zest'], //mettre data
      selected: '',
      prefix: '',
      first: '',
      last: ''
    }
  },
  computed: {
    filteredNames() { // filtre (miniscule to majuscule comprise )
      return this.names.filter((n) =>
        n.toLowerCase().startsWith(this.prefix.toLowerCase())
      )
    }
  },
  watch: {
    selected(name) {
      [this.last, this.first] = name.split(', ')
    }
  },
  methods: {
    createUser() { //fonction créer un User
      if (this.hasValidInput()) {
        const fullName = `${this.last}, ${this.first}`
        if (!this.names.includes(fullName)) {
          this.names.push(fullName)
          this.first = this.last = ''
        }
      }
    },
    updateUser() { //fonction mettre à jour un User
      if (this.hasValidInput() && this.selected) {
        const i = this.names.indexOf(this.selected)
        this.names[i] = this.selected = `${this.last}, ${this.first}`
      }
    },
    deleteUser() { // sup un User
      if (this.selected) {
        const i = this.names.indexOf(this.selected)
        this.names.splice(i, 1)
        this.selected = this.first = this.last = ''
      }
    },
    hasValidInput() {
      return this.first.trim() && this.last.trim()
    }
  }
}
</script>
<style>
* {
  font-size: inherit;
}

input {
  display: block;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 10px;
  border: solid 1px;
}

select {
  margin: 10px;
  padding: 10px;
  width: 14em;
  border-radius: 10px;
}

button {
  border-radius: 10px;
  padding: 10px;
  border: none;
  margin: 10px;
  color: white;
  transition: all ease 0.5s;

}

button:hover {
  transform: scale(1.1);
}




.head {
  margin-bottom: 5px;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 10px;
}

.flex {

  display: flex;
  flex-wrap: nowrap;
}

#search {
  border: solid 1px black;
}

.create {

  background-color: rgb(53, 176, 53);
}

.update {
  background-color: orange;
}

.delete {
  background-color: #e63946;
}

.container {
  display: flex;
  gap: 2em;

}
</style>
