
<template>
  <h2>CHART</h2>
  <div class="chart">
    <Pie :chart-options="chartOptions" :chart-data="chartData" :chart-id="chartId" :dataset-id-key="datasetIdKey"
      :plugins="plugins" :css-classes="cssClasses" :styles="styles" :width="width" :height="height"></Pie>
    <Line :chart-options="chartOptions" :chart-data="chartData" :chart-id="chartId" :dataset-id-key="datasetIdKey"
      :plugins="plugins" :css-classes="cssClasses" :styles="styles" :width="width" :height="height"></Line>
    <Bar :chart-options="chartOptions" :chart-data="chartData" :chart-id="chartId" :dataset-id-key="datasetIdKey"
      :plugins="plugins" :css-classes="cssClasses" :styles="styles" :width="width" :height="height"></bar>
  </div>
</template>


<script>


import {
  defineComponent,
} from 'vue'

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
      default: 450
    },
    height: {
      type: Number,
      default: 400
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

            backgroundColor: ['red', 'blue', 'orange', 'purple', 'green'],

            data: [6, 7, 6, 8, 9]

          }]

      },

      chartOptions: {

        responsive: false,

      },



    }

  }
})
</script>

<style>
@import '../assets/styles/chart.css';
</style>