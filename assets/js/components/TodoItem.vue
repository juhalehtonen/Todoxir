<template>
  <li>{{name}}</li>
</template>

<script>
  export default {
    data () {
      return {
        name: this.todo.name
      }
    },

    props: ['todo'],

    computed: {

    },

    methods: {
    }
  }
</script>
