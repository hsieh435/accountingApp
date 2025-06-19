// https://nuxt.com/docs/api/configuration/nuxt-config
import { defineNuxtConfig } from "nuxt/config";

export default defineNuxtConfig({
  compatibilityDate: "2025-05-15",
  devtools: { enabled: true },
  vite: {
    resolve: {
      alias: {
        "@": "/src",
        "@components": "/src/components",
        "@views": "/src/views",
      }
    }
  }
})
