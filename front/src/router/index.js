import { createRouter, createWebHistory } from "vue-router";

import WorkingTimes from "../components/WorkingTimes.vue";
import WorkingTime from "../components/WorkingTime.vue";
import ChartManager from "../components/ChartManager.vue";
import ClockManager from "../components/ClockManager.vue";
import LoginView from "../views/LoginView.vue";
import Home from "../components/HomeComponent";
import AdminComponent from "../components/AdminComponent";
import User from "../components/User";

const routes = [
  {
    path: "/",
    name: "app",
    component: Home,
  },
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
  {
    path: "/admin/users",
    name: "users",
    component: AdminComponent,
  },
  {
    path: "/user/:userID",
    name: "user",
    component: User,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
