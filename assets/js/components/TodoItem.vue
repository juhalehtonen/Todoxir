<template>
  <li class="c-todo-items__item" v-bind:class="{ complete: complete }">
    <p>{{name}}</p>
  </li>
</template>

<script>
  export default {
    data () {
      return {
        name: this.todo.name,
        id: this.todo.id,
        complete: this.todo.complete,
        is_editing: false
      }
    },

    props: ['todo'],

    computed: {

    },

    methods: {
    }
  }
</script>

<style lang="sass">
  .c-todo-items__item {
    list-style: none;
    &.complete {
      opacity: 0.5;
    }
  }
</style>
