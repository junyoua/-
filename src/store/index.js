import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);

let search=sessionStorage.getItem("search");
const state={
  text:search
}
export default new Vuex.Store({
  state
})