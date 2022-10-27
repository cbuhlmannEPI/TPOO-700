<!-- eslint-disable vue/multi-word-component-names -->
<script lang="ts" setup>
</script>
<template>
  <div class="head">

    <!-- filtre -->
    <div><input v-model="prefix" placeholder="Filter prefix"></div>
    <!-- affichage user -->
    <select size="5" v-model="selected">
      <option v-for="name in filteredNames" :key="name">{{ name }}</option>
    </select>
    <!-- champs pour nom et prenom de l'user -->
   <div class="flex">
    <label>Nom: <input v-model="first"></label>
   </div>
   <div class="flex">
     <label>Prenom: <input v-model="last"></label>
   </div>
    <!-- btn CRUD -->
    <div class="buttons">
      <button @click="createUser">Créer</button>
      <button @click="updateUser">Modifier</button>
      <button @click="deleteUser">Sup</button>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      names: ['Test, test','zest,zest'], //mettre data
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
}

select {
  float: left;
  margin: 0 1em 1em 0;
  width: 14em;
}

.buttons {
  clear: both;
}

button + button {
  margin-left: 5px;
}
.head{
  background: rgb(202, 202, 202);
  margin-bottom: 5px;

}
.flex{
  display: flex;
  flex-wrap: nowrap;
}
</style>
