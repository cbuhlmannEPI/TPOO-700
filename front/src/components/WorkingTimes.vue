<script lang="ts" setup></script>

<template>
  <h3>Installed CLI Plugins</h3>
  <div>{{ $route.params }}</div>


  <div class="workTable">
    <table>
      <tr>
        <th>Test</th>
        <th>Test</th>
        <th>Test</th>
      </tr>
      <tr>
        <td> test</td>
        <td>test</td>
        <td><button class="seeDetails"> <a> Voir détails</a></button> </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {

  name: 'WorkingTimes'
}
</script>
<style>
.workTable {
  display: flex;
  flex-direction: column;

}

table {
  border: solid 1px black;
  border-collapse: collapse;
}

td {
  padding: 10px;

  border: solid 1px black;
}

.seeDetails {
  background-color: rgb(44, 20, 182);

}
</style>

 