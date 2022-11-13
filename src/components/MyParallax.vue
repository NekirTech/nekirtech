<template>
  <q-parallax :src="background" class="window-height">
    <h4 class="text-white q-ma-sm">{{ headline }}</h4>
    <q-card class="bg-grey-9">
      <q-card-section class="text-white">
        <q-list dense padding class="rounded-borders">
          <q-item v-for="(item, index) in items" :key="index" class="q-pa-xs">
            <q-item-section>
              {{ item.entry }}
            </q-item-section>
          </q-item>
        </q-list>
      </q-card-section>
    </q-card>
  </q-parallax>
</template>
<script setup>
const myProps = defineProps({
  headline: { type: String, default: "abc" },
  background: { type: String, default: "" },
  //content: { type: String, default: "dummy.jpg" },
  items: {
    type: Array,
    default: () => [{ entry: "first" }, { entry: "second" }],
  },
});
</script>
<style></style>
