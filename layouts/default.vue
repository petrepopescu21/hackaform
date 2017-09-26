<template>
  <v-app light>

    <main>
      <v-container fluid>
          <v-layout center-page column align-center>
            
            <router-view></router-view>
          </v-layout>
      </v-container>
    </main>
  </v-app>
</template>


<style lang="stylus">
  .center-page {
    flex: none !important;
  }

  .fluid {
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
</style>

