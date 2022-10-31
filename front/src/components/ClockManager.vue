<script lang="ts" setup></script>

<template>
  <div>
    Component: ClockManager
  </div>
  <h1>
    COOCUOCUOCUO
  </h1>
</template>
<script>
// import axios from 'axios';
import moment from 'moment';

export default {
  data() {
    return {
      clock: {
        time: '',
        status:'',
        username: this.$route.params['username']
      },
    }
  },
  props: ['test'],
  methods: {
    formatDate(value) {
      return moment(String(value)).format('YYYY-MM-DD hh:mm:ss')
    }
  },
  created() {
    // axios
    //   .get(`http://localhost:4000/api/clocks/`+this.$route.params['username'])
    //   .then((response) => {
    //     this.workingtime.start = this.formatDate(response.data.data[0].start)
    //     this.workingtime.end = this.formatDate(response.data.data[0].end)
    //   })
    //   .catch((errors) => {
    //     console.log(errors)
    //   });
    console.log(this.props);
  }
}
</script>
<style scoped></style>
