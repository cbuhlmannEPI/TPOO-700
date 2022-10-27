<script>
import ChartComponent from "./components/ChartComponent.vue"
import User from './components/User.vue';
</script>
<template>

  <nav>
    <User/>
    <RouterLink to="/">Accueil</RouterLink> |
    <RouterLink to="/WorkingTimes/1">WorkingTimes</RouterLink>
  </nav>
  <RouterView/>
  
  <ChartComponent />
</template>

<script>
export default {
  name: 'App',
  components: {
    ChartComponent,
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
