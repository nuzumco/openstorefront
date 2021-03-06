<template lang="html">

  <div class="watches-page">

    <LoadingOverlay v-model="loading"></LoadingOverlay>

    <v-layout v-if="watches.length > 0" mt-3 mx-2>
    <v-flex xs12 md6 offset-md3>
      <v-expansion-panel popout>
        <v-expansion-panel-content v-for="item in watches" :key="item.componentName" :class="updateClasses(item)">
          <div slot="header">
            <strong>{{ item.componentName }}</strong>
          </div>
          <v-card class="grey lighten-5">
            <v-card-text>
              <p>
                <strong>Last update to entry: </strong>  {{ item.lastUpdateDts | formatDate('YYYY/MM/DD hh:mm') }}
              </p>
              <p>
                <strong>Last time viewed: </strong> {{ item.lastViewDts | formatDate}}
              </p>
            </v-card-text>
            <v-card-actions>
              <v-btn color="accent" @click="moreInformation(item.componentId)">More Information</v-btn>
            </v-card-actions>
          </v-card>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-flex>
    </v-layout>

    <v-container v-else-if="!loading" text-xs-center>
      <h2>You aren't watching any entries.</h2>
      <v-spacer style="height: 1.5em"></v-spacer>
      <v-btn class="primary" v-on:click="$router.push('/')">Return to Search</v-btn>
    </v-container>
  </div>

</template>

<script lang="js">
import router from '../router/index';
import LoadingOverlay from './subcomponents/LoadingOverlay';

export default {
  name: 'watches-page',
  props: [],
  components: {
    LoadingOverlay
  },
  mounted () {
    this.getWatches();
  },
  data () {
    return {
      watches: [],
      loading: false
    };
  },
  methods: {
    getWatches () {
      this.loading = true;
      this.$http.get('/openstorefront/api/v1/resource/userprofiles/' + this.$store.state.currentUser.username + '/watches')
        .then(response => {
          if (response.data && response.data.length > 0) {
            this.watches = response.data;
          }
          this.loading = false;
        });
    },
    moreInformation (componentId) {
      router.push({
        name: 'Entry Detail',
        params: {
          id: componentId
        }
      });
    },
    updateClasses (item) {
      return item.lastUpdateDts > item.lastViewDts ? 'light-green accent-1' : '';
    }
  }
};
</script>

<style scoped lang="scss">
  .centeralign {
    margin-right: auto;
    margin-left: auto;
  }
</style>
