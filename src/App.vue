<template>
  <div id="app">

    <button @click="requestTest">{{ env }}</button>
    <img alt="Vue logo" src="./assets/logo.png" >
    <HelloWorld msg="Welcome to Your Vue.js App"/>
    你好世界
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

//安装axios：npm i axios

// 使用axios
// eslint-disable-next-line no-unused-vars

// eslint-disable-next-line no-unused-vars
import request from '@/request'

export default {
  name: 'App',
  components: {
    HelloWorld
  },
  data() {
    return {
      'env': process.env.VUE_APP_TITLE
    }
  },
  methods: {
    requestTest(){
      console.log('requestTest')
      request({
        method: 'get',
        // 没有代理的时候写的是5000，但是现在有代理了，直接写8080
        // url: 'http://127.0.0.1:5000/students'
        url: '/testCon/test1'
      }).then(function (response) {
        console.log(response);
        console.log(response.data)
      }).catch(function (error) {
        console.log('error', error);
      }).finally(response => {
        console.log('finally', response)
      });
    }
  },
  mounted() {
    this.requestTest()
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
<!--


//    "build:test": "vue-cli-service build --mode test",

//    "serve": "SET NODE_OPTIONS=--openssl-legacy-provider && vue-cli-service serve",
//    "build": "SET NODE_OPTIONS=--openssl-legacy-provider && vue-cli-service build",
//    "build:test": "SET NODE_OPTIONS=--openssl-legacy-provider && vue-cli-service build --mode test",
-->
