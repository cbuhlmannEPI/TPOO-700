<template>
    <div class="rectangle">
        <div class="container">
            <h2>Météo Actuelle à Lille</h2>
            <select name="" id=""></select>
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