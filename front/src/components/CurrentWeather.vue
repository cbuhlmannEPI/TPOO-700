<template>
    <div class="top-div">

        <h2>Où ? </h2>
        <select name="" id="" v-model="selected">
            <option v-for="ville in ville" :key="ville">{{ ville }}</option>
        </select>
        <button @click="refreshCurrentWeather"> Search</button>

    </div>
    <div class="rectangle">
        <div class="container">
            <h2>Météo Actuelle à {{ city }}</h2>

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
        },
        refreshCurrentWeather: function () {
            this.weather.temperature = (Math.random() * 40).toFixed();
            this.city = this.selected;
        }
    }, data() {

        return {
            city: 'Lille',
            selected: "Lille",
            ville: [
                'Lille',
                'Roubaix',
                'Tourcoing',
            ],
            weather: {
                temperature: 15
            }
        }
    }
}



</script>

<style>
@import '../assets/styles/weather.css';
</style>