import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// En producción (Docker+Nginx) las rutas /api/* son proxeadas por nginx.conf
// En desarrollo local, se puede usar el proxy de vite
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:8080',
        changeOrigin: true,
      }
    }
  }
})
