<template>
  <ul class="c-todo-items">
    <todo-item v-for="todo in todos" :todo="todo"></todo-item>
  </ul>
</template>

<script>
  /*
  Every component instance has its own isolated scope. This means you cannot
  (and should not) directly reference parent data in a child component’s template.
  Data can be passed down to child components using props.
  */
  import TodoItem from './TodoItem.vue'
  export default {
    props: {
      todos: {
        type: Array,
        default () {
          return []
        }
      }
    },
    components: {
      TodoItem
    }
  }
</script>

<style lang="sass">
  .c-todo-items {
    padding-left: 0;
    margin: 20px 0;
    padding: 20px;
    border: 1px solid #f0f0f0;
  }
</style>
