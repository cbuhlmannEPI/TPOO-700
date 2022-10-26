<template>
    <div class="top-div">

        <h2>Où ? </h2>
        <select name="" id="">
            <option v-for="ville in ville" :key="ville">{{ ville }}</option>
        </select>
        <button>Search</button>
    </div>
    <div class="rectangle">
        <div class="container">
            <h2>Météo Actuelle à Lille</h2>

            <p>Temperature : {{ weather.temperature }}℃ </p>
            <p>Date du jour : {{ moment().format('DD/MM/YYYY hh:mm') }}</p>

        </div>

    </div>
</template>

<script>
var moment = require('moment');// in my gulp file

export default {
    name: 'CurrentWeather',
    props: {
        msg: String,
    },
    methods: {
        moment: function () {
            return moment();
        }
    },
    data() {

        return {
            ville: [
                'Lille',
                'Roubaix',
                'Tourcoing',
            ],
            weather: {
                temperature: '15'
            }
        }
    }
}


</script>

<style>
@import '../assets/styles/weather.css';
</style>