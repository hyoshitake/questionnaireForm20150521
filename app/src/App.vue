<template>
  <div class="app-container">
    <header>
      <h1><font-awesome-icon icon="home" /> My Vue3 Application</h1>
    </header>
    <main>
      <div class="content">
        <h2>Welcome to the TOP Page</h2>
        <p>This is a sample Vue3 application with:</p>
        <ul>
          <li><font-awesome-icon icon="check" /> Vue 3</li>
          <li><font-awesome-icon icon="font-awesome" /> Font Awesome</li>
          <li><font-awesome-icon icon="network-wired" /> Axios for API requests</li>
          <li><font-awesome-icon icon="database" /> Supabase integration</li>
        </ul>
        <button @click="fetchData">Test API Connection</button>
        <div v-if="loading">Loading...</div>
        <div v-if="error" class="error">{{ error }}</div>
        <pre v-if="data">{{ data }}</pre>
      </div>
    </main>
    <footer>
      <p>&copy; 2025 My Vue3 Application</p>
    </footer>
  </div>
</template>

<script>
import { ref } from 'vue'
import axios from 'axios'
import { createClient } from '@supabase/supabase-js'

// Font Awesome設定
import { library } from '@fortawesome/fontawesome-svg-core'
import { faHome, faCheck, faNetworkWired, faDatabase, faFont } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faHome, faCheck, faNetworkWired, faDatabase, faFont)

export default {
  name: 'App',
  components: {
    FontAwesomeIcon
  },
  setup() {
    const data = ref(null)
    const loading = ref(false)
    const error = ref(null)

    // Supabaseクライアントの初期化（実際の値に置き換える必要があります）
    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'YOUR_SUPABASE_URL'
    const supabaseKey = import.meta.env.VITE_SUPABASE_KEY || 'YOUR_SUPABASE_KEY'
    const supabase = createClient(supabaseUrl, supabaseKey)

    const fetchData = async () => {
      loading.value = true
      error.value = null
      try {
        // デモ用にJSONPlaceholderからデータを取得
        const response = await axios.get('https://jsonplaceholder.typicode.com/posts/1')
        data.value = response.data
      } catch (err) {
        error.value = err.message
      } finally {
        loading.value = false
      }
    }

    return {
      data,
      loading,
      error,
      fetchData,
      supabase
    }
  }
}
</script>

<style>
.app-container {
  font-family: Arial, sans-serif;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

header {
  background-color: #4CAF50;
  color: white;
  padding: 1rem;
  border-radius: 5px;
  margin-bottom: 20px;
}

main {
  background-color: #f5f5f5;
  padding: 20px;
  border-radius: 5px;
  margin-bottom: 20px;
}

footer {
  text-align: center;
  color: #666;
  padding: 10px;
  font-size: 0.8rem;
}

button {
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 10px 15px;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 15px;
}

button:hover {
  background-color: #45a049;
}

ul {
  margin-top: 15px;
  margin-bottom: 15px;
}

li {
  margin-bottom: 8px;
}

.error {
  color: red;
  margin-top: 10px;
}

pre {
  background-color: #f0f0f0;
  padding: 10px;
  border-radius: 4px;
  overflow: auto;
  margin-top: 15px;
}
</style>
