
<template>
  <h2>CHART</h2>
  <div class="chart">
    <div class="card">
      <Pie :chart-options="chartOptions" :chart-data="chartData" :chart-id="chartId" :dataset-id-key="datasetIdKey"
        :plugins="plugins" :css-classes="cssClasses" :styles="styles" :width="width" :height="height"></Pie>
    </div>
    <div class="card">
      <Line :chart-options="chartOptions" :chart-data="chartData" :chart-id="chartId" :dataset-id-key="datasetIdKey"
        :plugins="plugins" :css-classes="cssClasses" :styles="styles" :width="width" :height="height"></Line>
    </div>
    <div class="card">
      <Bar :chart-options="chartOptions" :chart-data="chartData" :chart-id="chartId" :dataset-id-key="datasetIdKey"
        :plugins="plugins" :css-classes="cssClasses" :styles="styles" :width="width" :height="height"></bar>
    </div>
  </div>
</template>


<script>


import {
  defineComponent,
} from 'vue'
import axios from "axios";
import { Pie, Line, Bar } from 'vue-chartjs'
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  ArcElement,
  CategoryScale,
  LineElement,
  LinearScale,
  PointElement,
  BarElement

} from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, ArcElement, CategoryScale, LineElement, BarElement,
  LinearScale,
  PointElement)

export default defineComponent({
  name: 'PieChart',
  components: {
    Pie,
    Line,
    Bar
  },
  props: {
    chartId: {
      type: String,
      default: 'pie-chart'
    },
    lineId: {
      type: String,
      default: 'line-chart'
    },
    width: {
      type: Number,
      default: 290
    },
    height: {
      type: Number,
      default: 290
    },
    cssClasses: {
      default: '',
      type: String
    },
    styles: {
      default: () => { }
    },
    plugins: {
      type: Array,
      default: () => []
    }
  }, data() {

    return {

      chartData: {

        labels: ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi'],

        datasets: [

          {

            label: 'Working Time',

            backgroundColor: ['#1d3557', '#457b9d', '#a8dadc', '#f1faee', '#e63946'],

            data: [6, 7, 6, 8, 9]

          }]

      },

      chartOptions: {

        responsive: false,

      },



    }

  },

  // Pulls posts when the component is created.
  created() {
    axios
      .get(`http://localhost:4000/api/users`)
      .then((response) => {
        // JSON responses are automatically parsed.
        this.posts = response.data;
        console.log(response.data);
      })
      .catch((e) => {

        this.errors.push(e);
      });
  }
})
</script>

<style>
@import '../assets/styles/chart.css';
</style>