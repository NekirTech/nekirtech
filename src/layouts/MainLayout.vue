<template>
  <q-layout view="lHh Lpr lFf">
    <q-header class="bg-transparent">
      <q-btn
        dense
        round
        icon="menu"
        aria-label="Menu"
        @click="toggleLeftDrawer"
        color="black"
        size="lg"
        class="q-ma-md"
      />
    </q-header>
    <q-drawer v-model="leftDrawerOpen" show-if bordered dark>
      <q-list>
        <EssentialLink
          v-for="link in linksList"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import { defineComponent, ref } from "vue";
import EssentialLink from "components/EssentialLink.vue";
import { linksList } from "stores/my_values";

const leftDrawerOpen = ref(false);

const toggleLeftDrawer = () => {
  leftDrawerOpen.value = !leftDrawerOpen.value;
};
</script>
