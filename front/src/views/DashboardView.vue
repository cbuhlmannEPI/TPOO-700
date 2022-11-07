<template>



    <div class="text-center">
        <h2>Welcome</h2>

        <div class="image-logo"></div>
    </div>
</template>
  
<script>


import Cookies from 'js-cookie';
export default {

    name: 'DashboardView',

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
                },
            ],

        }

    },
    methods: {
        changeComponent(url) {
            window.location.replace('/' + url);


            // this.dynamicComponent = component;

        }
    },


}


</script>
<style>
.v-main {
    height: auto !important
}

.v-list-item__content {
    cursor: pointer;
}

.image-logo {
    background-image: url(../assets/check-time.png);
    height: 400px;
    width: 100%;
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
}
</style>