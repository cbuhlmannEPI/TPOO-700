<template>

    <v-card style="height:100%">
        <v-layout style="height:100%">
            <v-navigation-drawer expand-on-hover rail>
                <v-list>
                    <v-list-item prepend-avatar="https://randomuser.me/api/portraits/women/85.jpg" title="Sandra Adams"
                        subtitle="sandra_a88@gmailcom"></v-list-item>
                </v-list>

                <v-divider></v-divider>

                <v-list density="compact" nav v-for="menu in menus" :key="menu.title">
                    <v-list-item :prepend-icon="'.'" :title="menu.title" v-on:click="changeComponent(menu.component)">
                    </v-list-item>
                </v-list>
            </v-navigation-drawer>

            <v-main style="height: 250px">
                <component :is="dynamicComponent"></component>
            </v-main>
        </v-layout>
    </v-card>
</template>
  
<script>


import ClockManager from "../components/ClockManager.vue"
import ChartComponent from "../components/ChartComponent.vue"
import Worktimes from "../components/WorkingTimes.vue"
export default {
    name: 'DashboardView',

    components: {
        ClockManager,
        ChartComponent,
        Worktimes

    },
    data() {
        return {
            dynamicComponent: 'ClockManager',
            menus: [
                {
                    title: 'Clocks',
                    icon: 'mdi-clock',
                    component: 'ClockManager'
                },
                {
                    title: 'ChartComponenent',
                    icon: 'mdi-clock',
                    component: 'ChartComponent'
                },
                {
                    title: 'Worktimes',
                    icon: 'mdi-clock',
                    component: 'Worktimes'
                },
            ],

        }

    },
    methods: {
        changeComponent(component) {
            this.dynamicComponent = component;
        }
    },

}


</script>
  