<template>

  <v-card style="height:100%">
    <v-layout style="height:100%">
      <v-navigation-drawer v-if="$route.path !== '/login'" expand-on-hover rail>
        <v-list>
          <v-list-item
            prepend-avatar="https://media-exp1.licdn.com/dms/image/D4E03AQH4bwUJg-G-Eg/profile-displayphoto-shrink_100_100/0/1663869996632?e=1673481600&v=beta&t=tesJKFL5NscMkwfFkmmO4zV-5RxVsJXxXzZJSK8BzBw"
            title="Bulone Benjamin" subtitle="benjamin.bulone@epitech.eu"></v-list-item>
        </v-list>
        <v-divider></v-divider>

        <v-list density="compact" nav v-for="menu in menus" :key="menu.title">
          <v-list-item :prepend-icon="menu.icon" :title="menu.title" v-on:click="changeComponent(menu.url)">
          </v-list-item>
        </v-list>
      </v-navigation-drawer>

      <v-main>
        <router-view></router-view>
      </v-main>
    </v-layout>
  </v-card>
</template>

<script>
// import ClockManager from "./components/ClockManager.vue"
// import ChartComponent from "./components/ChartComponent.vue"
// import Worktimes from "./components/WorkingTimes.vue"
import Cookies from 'js-cookie';
export default {

  name: 'App',

  components: {
    // ClockManager,
    // ChartComponent,
    // Worktimes

  },
  data() {
    return {
      dynamicComponent: 'ClockManager',
      menus: [
        {
          title: 'Clocks',
          icon: 'mdi-clock',
          component: 'ClockManager',
          url: 'Clocks/' + Cookies.get('username')
        },
        {
          title: 'Charts',
          icon: 'mdi-chart-pie',
          component: 'ChartComponent',
          url: 'chartManager/' + Cookies.get('userID')

        },
        {
          title: 'Workingtimes',
          icon: 'mdi-clock',
          component: 'WorkingTimes',
          url: 'WorkingTimes/' + Cookies.get('userID')
        }
      ],

    }

  },
  methods: {
    changeComponent(url) {
      window.location.replace('/' + url);
      // this.dynamicComponent = component;

    }
  },
  created() {
    if (!Cookies.get('userID')) {
      if (!window.location.href.endsWith('/login')) {
        window.location.replace('/login');
      }
    }

    if(Cookies.get('role') == 'admin'){
      let menu = {
        title: 'Admin',
        icon: 'mdi-account',
        component: 'AdminComponent',
        url: 'admin/users'
      }

      this.menus.push(menu);
    }
  }

}


</script>
<style>
.v-main {
  height: auto !important
}

.v-list-item__content {
  cursor: pointer;
}
</style>