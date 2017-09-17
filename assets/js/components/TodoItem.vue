<template>
  <div>
    <input
         v-if="is_editing"
         v-model.trim="name"
         @keyup.enter="submit"
         type="text"
         class="c-todo-items__item"
         v-bind:class="{ complete: complete }"
         placeholder="Todo"
    />
    <li  v-else class="c-todo-items__item" v-bind:class="{ complete: complete }">
      <p>{{name}}</p>
    </li>

    <!-- Edit buttons -->
    <nav v-if="is_editing">
      <!-- Save button -->
      <button v-on:click="submit">Save</button>
      <!-- Cancel button -->
      <button v-on:click="toggleEdit">Cancel</button>
    </nav>
    <div v-else>
      <!-- Enter to edit mode -->
      <button v-on:click="toggleEdit">Edit</button>
    </div>

    <!-- Errors -->
    <aside v-show="error">{{error}}</aside>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        name: this.todo.name,
        id: this.todo.id,
        complete: this.todo.complete,
        is_editing: false,
        error: null
      }
    },

    props: ['todo'],

    computed: {

    },

    methods: {
      // Toggle Edit mode of a todo item
      toggleEdit () {
        this.error = null
        this.is_editing = !this.is_editing
      },

      submit () {
        // Update link
        this.$http.patch(`todos/${this.todo.id}`, {
          todo: { name: this.name }
        }).then((response) => {
          // Success
          this.error = null
          this.toggleEdit()
        }, (response) => {
          // Error
          return response.json()
        }).then((data) => {
          // Show error message
          if (data) {
            this.error = data.errors[0]
            this.path = this.tempPath
          } else {
            this.tempPath = this.path
          }
        })
      }

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
