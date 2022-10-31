<template>
    <div class="navbar">
        <ul>
            <a v-bind:href="'/'">
                <i style="font-size:30px" class="fa fa-home"></i>
            </a>
            <a v-bind:href="'/clocks/'+username">
                <li>Clocks</li>
            </a>
            <li>
                <a v-bind:href="'/WorkingTimes/'+userID"> Working Times</a>
            </li>
        </ul>
        <div class="account">
            <p>John Doe</p>
            <div class="img-account"></div>

        </div>
    </div>
</template>

<script>
export default {
  data() {
    return {
      username: null,
      userID: null
    }
  },
  methods: {},
  created() {
    this.username = sessionStorage['username']
    this.userID = sessionStorage['userID']
  }
}
</script>

<style>
body {
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
    color: white;
}

.navbar {
    margin: 0;
    width: 100%;
    background-color: rgb(72, 63, 198);
    color: white;
    height: 100px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.account {
    display: flex;
    justify-content: center;
    align-items: center;
}

ul {
    display: flex;
    align-items: center;
    height: 100%;
    list-style-type: none;
    margin: 0;
}

ul li {
    display: inline;
    padding: 20px;

}

.img-account {
    margin: 20px;
    height: 50px;
    width: 50px;
    border-radius: 50%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url('https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80');
}
</style>


<script>
export default {
    name: 'NavBarComponent',

}
</script>