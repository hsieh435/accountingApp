// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-05-15',
  devtools: { enabled: true }
})
function defineNuxtConfig(config: { compatibilityDate: string; devtools: { enabled: boolean; }; }) {
  return config;
}

