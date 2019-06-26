<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          @click="leftDrawerOpen = !leftDrawerOpen"
          aria-label="Menu"
        >
          <q-icon name="menu" />
        </q-btn>

        <q-toolbar-title>
          Comunidade VueJS de BH
        </q-toolbar-title>

        <div>v 1.0.0</div>
      </q-toolbar>
    </q-header>

    <q-drawer
      v-model="leftDrawerOpen"
      bordered
      content-class="bg-grey-2"
    >
      <q-list>
        <q-item-label header>Links Principais</q-item-label>
        <q-item clickable tag="a" target="_self" href="https://vuejsbh.dev">
          <q-item-section avatar>
            <q-icon name="home" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Home</q-item-label>
            <q-item-label caption>vuejsbh.dev</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable to="/blog">
          <q-item-section avatar>
            <q-icon name="book" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Blog</q-item-label>
            <q-item-label caption>vuejsbh.dev/blog</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="a" target="_blank" href="https://github.com/vuebh/site/issues">
          <q-item-section avatar>
            <q-icon name="work" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Vagas</q-item-label>
            <q-item-label caption>vuejsbh.dev/vagas</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="a" target="_blank" href="https://github.com/vuebh">
          <q-item-section avatar>
            <q-icon name="code" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Github</q-item-label>
            <q-item-label caption>github.com/vuebh</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="a" target="_blank" href="https://t.me/vuejsbh">
          <q-item-section avatar>
            <q-icon name="chat" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Telegram</q-item-label>
            <q-item-label caption>t.me/vuejsbh</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable tag="a" target="_blank" href="https://www.meetup.com/pt-BR/Vuejs-at-BH/">
          <q-item-section avatar>
            <q-icon name="people" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Meetup</q-item-label>
            <q-item-label caption>meetup.com/pt-BR/Vuejs-at-BH/</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable to="/sobre">
          <q-item-section avatar>
            <q-icon name="info" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Sobre</q-item-label>
            <q-item-label caption>vuejsbh.dev/sobre</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { openURL } from 'quasar'

export default {
  name: 'MyLayout',
  data () {
    return {
      leftDrawerOpen: this.$q.platform.is.desktop
    }
  },
  methods: {
    openURL
  }
}
</script>

<style>
</style>
