<template>
  <ul>
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
