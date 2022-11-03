
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
import axios from 'axios';
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
        labels: [],
        datasets: [
          {
            label: 'Working Time',
            backgroundColor: ['#1d3557', '#457b9d', '#a8dadc', '#f1faee', '#e63946'],
            data: []
          }]
      },
      chartOptions: {
        responsive: false,
      },
    }
  },
  methods: {
    addZero(val) {
      if (String(val).length == 1) {
        return '0' + val;
      }
      return val;
    },
  },
  created() {
    axios
      .get(`http://localhost:4000/api/workingtimes/` + sessionStorage['userID'])
      .then((response) => {
        // console.log(response.data.data.sort());
        let array = response.data.data;
        array.sort(function (wTime1, wTime2) {
          if (wTime1.id > wTime2.id) return 1;
          if (wTime1.id < wTime2.id) return -1;
        });
        let secondes = [];
        let i = 0;

        response.data.data.forEach(wtime => {
          if (i == 5) {
            return false;
          }
          const dateObj = new Date(wtime.start);
          let date = this.addZero(dateObj.getFullYear()) + '-' + this.addZero(dateObj.getMonth() + 1) + '-' + this.addZero(dateObj.getDate());
          this.chartData.labels.push(date)
          let dateStart = new Date(wtime.start);
          let dateEnd = new Date(wtime.end);
          let totalSeconds = Math.round(Math.abs(dateEnd - dateStart) / 1000);
          secondes.push(totalSeconds);
          i = i + 1;
        });
        this.chartData.datasets[0].data = secondes;

      })
      .catch((errors) => {
        console.log(errors)
      });
  }
})
</script>

<style>
@import '../assets/styles/chart.css';
</style>