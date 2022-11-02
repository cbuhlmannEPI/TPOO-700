import { createRouter, createWebHistory } from "vue-router";

import WorkingTimes from "../components/WorkingTimes.vue";
import WorkingTime from "../components/WorkingTime.vue";
import ChartManager from "../components/ChartManager.vue";
import ClockManager from "../components/ClockManager.vue";
import LoginView from "../views/LoginView.vue";

const routes = [
  // {
  //   path: '/',
  //   name: 'app',
  //   component: App
  // },
  {
    path: "/WorkingTimes/:userID",
    name: "workingTimesUser",
    component: WorkingTimes,
  },
  {
    path: "/workingTimes/:userID/:id",
    name: "workingTimeUser",
    component: WorkingTime,
  },
  {
    path: "/clocks/:username",
    name: "clocks",
    component: ClockManager,
  },
  {
    path: "/chartManager/:userID",
    name: "charts",
    component: ChartManager,
  },
  {
    path: "/login/",
    name: "login",
    component: LoginView,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
