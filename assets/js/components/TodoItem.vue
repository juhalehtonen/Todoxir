<template>
  <article class="c-todo-items__item" v-bind:class="{ complete: complete }">

    <input
         v-if="is_editing"
         v-model.trim="name"
         @keyup.enter="submit"
         type="text"
         class="c-todo-items__item__input"
         placeholder="Todo"
    />
    <p v-else class="c-todo-items__item__title" v-bind:class="{ complete: complete }">
      {{name}}
    </p>

    <!-- Buttons -->
    <div class="c-todo-items__item__buttons">
      <button v-if="is_editing" v-on:click="submit">Save</button>
      <button v-on:click="toggleEdit">Toggle edit</button>
    </div>

    <!-- Errors -->
    <aside v-show="error">{{error}}</aside>

  </article>
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

    methods: {
      // Toggle Edit mode of a todo item
      toggleEdit () {
        this.error = null
        this.is_editing = !this.is_editing
      },

      submit () {
        // Update todo
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
          }
        })
      }

    }
  }
</script>

<style lang="sass">
  .c-todo-items__item {
    display: flex;

    &__input,
    &__title {
      width: 65%;
    }

    &__buttons {
      width: 35%;
      text-align: right;
    }

    &.complete {
      opacity: 0.75;
    }
  }
</style>
