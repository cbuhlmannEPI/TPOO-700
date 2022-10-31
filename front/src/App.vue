<!-- eslint-disable no-unused-vars -->
<template>
  <NavBarComponent />
  <User />
  <RouterView />
</template>

<script>

// import User from "../src/components/User.vue";
import NavBarComponent from "./components/NavBarComponent.vue";
import User from "../src/components/User.vue";

export default {
  name: 'App',
  components: {
    User,
    NavBarComponent
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
