<template>
  <section>

    <div class="c-todo-items">
      <todo-item v-for="todo in todos" :todo="todo"></todo-item>
    </div>

    <input v-model="newTodo" type="text" placeholder="New todo">
    <button v-on:click="addTodo">Add Todo</button>

  </section>
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
    },

    data () {
      return {
        newTodo: "",
        error: null
      }
    },

    methods: {
      addTodo () {
        // Update todo
        this.$http.post(`todos`, {
          todo: { name: this.newTodo, complete: false }
        }).then((response) => {
          // Success
          this.error = null
          this.newTodo = ''
        }, (response) => {
          // Error
          return response.json()
        }).then((data) => {
          // Show error message
          if (data) {
            this.error = data.errors[0]
          }
        })
      }
    }
  }
</script>

<style lang="sass">
  .c-todo-items {
    padding-left: 0;
    margin: 20px 0;
    padding: 20px;
    border: 1px solid #f0f0f0;
    width: 100%;
  }
</style>
