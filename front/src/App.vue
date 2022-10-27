<template>
  <nav>
    <User/>
    <RouterLink to="/">Accueil</RouterLink> |
    <RouterLink to="/WorkingTimes/1">WorkingTimes</RouterLink>
  </nav>
  <RouterView/>
</template>

<script>
import User from './components/User.vue';

 

export default {
  name: 'App',
  components: {
    User
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;

}
</style>
