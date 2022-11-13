<template>
  <q-parallax id="home" class="window-height">
    <q-img src="Wortbildbarke_weisse_schrift.svg" style="width: 50%"></q-img>
  </q-parallax>
  <MyParallax
    id="skills"
    headline="Skills"
    background="code.png"
    :items="skills"
  ></MyParallax>
  <MyParallax
    id="projects"
    headline="Projects"
    background="hardware.jpeg"
    :items="projects"
  ></MyParallax>
  <q-parallax src="grey-noise.png" id="consultation" class="window-height">
    <h4 class="text-white q-ma-sm">Free initial consultation</h4>
    <div class="q-pa-md" style="max-width: 400px">
      <q-form @submit="sendAxios" class="q-gutter-md" dark>
        <q-input
          dark
          filled
          v-model="name"
          label="Your full name"
          :rules="[(val) => !!val || 'Field is required']"
        />
        <q-input
          dark
          filled
          v-model="email"
          label="Your email adress"
          :rules="[
            (val) => !!val || 'Field is required',
            (val) => validateEmail(val) || 'Please enter a valid email adress',
          ]"
        />
        <q-input
          dark
          v-model="text"
          filled
          autogrow
          label="Your message"
          :rules="[(val) => !!val || 'Field is required']"
        />
        <div>
          <q-btn label="Submit" type="submit" color="" dark />
        </div>
      </q-form>
    </div>
  </q-parallax>
  <privacy></privacy>
  <br /><br /><br /><br /><br />
  <div id="imprint" class="text-white text-center">
    <h4 class="text-white q-ma-sm">Impressum - Legal Notice</h4>
    <p>
      <b>NekirTech UG (haftungsbeschränkt)</b>
      <br />
      Azenbergstraße 48
      <br />
      70174 Stuttgart
    </p>
    <p>E-Mail: nekirtech[AT]gmail[PUNKT]com</p>
    <p>Geschäftsführer: Felix-Nekir Frank</p>
    <p>
      Registergericht: Amtsgericht Stuttgart
      <br />
      Registernummer: HRB 785737
    </p>
  </div>
</template>
<script setup>
import { ref } from "vue";
import { useQuasar } from "quasar";
import MyParallax from "src/components/MyParallax.vue";
import privacy from "src/components/privacy_eng.vue";
import emailjs from "emailjs-com";
import { api } from "boot/axios";
import { skills, projects, api_data } from "stores/my_values";

const email = ref(null),
  name = ref(null),
  text = ref(null);

const sendAxios = () => {
  showSending();
  api
    .post("", {
      service_id: api_data.service_id,
      template_id: api_data.template_id,
      user_id: api_data.user_id,
      template_params: {
        from_name: name.value,
        from_mail: email.value,
        message: text.value,
      },
    })
    .then(function (response) {
      console.log(response);
      showSuccess();
    })
    .catch(function (error) {
      errorMessage.value = error.message;
      showError();
    });
};
const $q = useQuasar();
const showSending = () => {
  $q.notify({
    spinner: true,
    message: "Sending...",
    timeout: 1000,
  });
};
const errorMessage = ref(null);
const showError = (error) => {
  $q.notify({
    type: "negative",
    message: errorMessage.value,
    timeout: 2000,
  });
  errorMessage.value = "";
};
const showSuccess = () => {
  $q.notify({
    type: "positive",
    message: "Consultation inquiry sent successfully",
    timeout: 2000,
  });
};
function validateEmail(email) {
  return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(
    email
  );
}
</script>
