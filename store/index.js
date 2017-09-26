import Vuex from 'vuex'

const createStore = () => {
  return new Vuex.Store({
    state: {
      team: undefined
    },
    mutations: {
      setTeam(state,data) {
        state.team = data
      }
    },
    getters: {
      team(state) {
        return state.team
      }
    }
  })
}

export default createStore