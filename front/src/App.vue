<!-- eslint-disable no-unused-vars -->
<template>
  <User />

  <ChartComponents />
  <TestComponent />
</template>

<script>
import ChartComponents from "../src/components/ChartComponent.vue";
import User from "../src/components/User.vue";

export default {
  name: 'App',
  components: {
    ChartComponents,
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
