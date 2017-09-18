<template>
  <section>

    <div class="c-todo-items">
      <transition-group name="fade">
          <todo-item
             v-for="(todo, index) in sortedTodos"
             :todo="todo"
             v-bind:key="todo.name"
             v-on:delete-todo="deleteThisTodo(index)">
          </todo-item>
      </transition-group>
    </div>

    <div class="c-add-item">
      <input v-model="newTodo" type="text" placeholder="New todo" @keyup.enter="addTodo">
      <button v-on:click="addTodo">Add Todo</button>
    </div>

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
        error: null,
        todoItems: this.todos
      }
    },

    computed: {
      sortedTodos() {
        return this.todoItems.slice().sort(function(a, b){
            var nameorder = a.name === b.name ? 0 : (a.name < b.name ? -1 : 1);
            if(
                (a.complete && b.complete) ||
                (!a.complete && !b.complete)
            ) {
                return nameorder;
            } else if(a.complete) {
                return 1;
            } else {
                return -1;
            }

        })
      }
    },

    methods: {
      addTodo () {
        // Add todo
        this.$http.post(`todos`, {
          todo: { name: this.newTodo, complete: false }
        }).then((response) => {
          // Success
          this.todoItems.push({ name: this.newTodo, complete: false })
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
      },

      deleteThisTodo: function(index) {
        console.log("Received index: " + index)
        this.todoItems.splice(index, 1);
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

  .c-add-item {
    display: flex;
    width: 100%;

    input {
      width: 65%;
    }
    button {
      width: 35%;
    }
  }
</style>
