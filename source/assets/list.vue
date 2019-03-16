<template>
  <div>
    <H1>Agendas</H1>

    <div class="controls">
      <div class="buttons"><button @click="createAgenda">Create New Agenda</button></div>
    </div>

    <Table :columns="tableColumns" :data="agendas" :linkResolver="getAgendaLink" sortable />
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex';
import { FETCH_AGENDAS } from 'store/types';
import { H1, Table } from 'style';
import { formatDate } from 'utils';

export default {
  name: 'AgendaList',
  components: {
    H1,
    Table,
  },
  computed: {
    ...mapState({
      agendas: store => store.agendas.all,
    }),
  },
  data() {
    return {
      tableColumns: [
        {
          headerText: 'Agenda Name',
          linkResolver: this.getAgendaLink,
          value: agenda => agenda.title,
          data: agenda => agenda.title,
        },
        {
          headerText: 'Number of Activities',
          label: 'Activities',
          value: agenda => agenda.activities.length,
          data: agenda => agenda.activities.length,
        },
        {
          headerText: 'Time Required',
          label: 'Length',
          value: agenda => agenda.activities.reduce((acc, activity) => acc + activity.time, 0),
          data: agenda => {
            const totalTime = agenda.activities.reduce((acc, activity) => acc + activity.time, 0);
            const hours = totalTime >= 60 ? `${Math.floor(totalTime / 60)}h` : '';
            const minutes = totalTime % 60 > 0 ? `${totalTime % 60}m` : '';
            return hours + (minutes.length > 0 ? ' ' : '') + minutes;
          },
        },
        {
          headerText: 'Last Updated',
          label: 'Last Updated',
          value: agenda => new Date(agenda.updatedAt),
          data: agenda => {
            return formatDate(agenda.updatedAt);
          },
        },
      ],
    };
  },
  mounted() {
    this.fetchAgendas();
  },
  methods: {
    ...mapActions({
      fetchAgendas: FETCH_AGENDAS,
    }),
    createAgenda() {
      this.$router.push('/agendas/new');
    },
    getAgendaLink(agenda) {
      return `/agendas/${agenda._id}`;
    },
  },
  head: {
    title: {
      inner: 'Agendas',
    },
  },
};
</script>
