import { createApp } from 'vue'
import './style.css'
import App from './App.vue'

// Font Awesome
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faHome, faCheck, faNetworkWired, faDatabase, faFont } from '@fortawesome/free-solid-svg-icons'

library.add(faHome, faCheck, faNetworkWired, faDatabase, faFont)

const app = createApp(App)
app.component('font-awesome-icon', FontAwesomeIcon)
app.mount('#app')
