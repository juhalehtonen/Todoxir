<template>
  <div>
    todoitems.vue
    <todo-item v-for="item in items">lol</todo-item>
  </div>
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
      items: {
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
