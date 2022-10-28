import { createRouter, createWebHistory } from 'vue-router';

import  WorkingTimes  from "../components/WorkingTimes.vue";
import  WorkingTime  from "../components/WorkingTime.vue";
import  ChartManager  from "../components/ChartManager.vue";
import  ClockManager  from "../components/ClockManager.vue";
import  User  from "../components/User.vue";

const routes = [
  
  {
    path: '/', 
    name: 'Users',
    component: User
  },
  {
    path: '/workingTime/:userid', 
    name: 'workingTimeUser',
    component: WorkingTime
  },
  {
    path: '/clock/:username', 
    name: 'clockUser',
    component: ClockManager
  },
  {
    path: '/workingTime/:userid/:workingtimeid', 
    name: 'workingTimeTime',
    component: WorkingTime
  },
  {
    path: '/chartManager/:userid', 
    name: 'clockUser',
    component: ChartManager
  },
  {
    path: '/WorkingTimes/:userI',
    name: 'WorkingTimes',
    component: WorkingTimes
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
 