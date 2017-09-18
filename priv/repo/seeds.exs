# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todoxir.Repo.insert!(%Todoxir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Todoxir.Repo
alias Todoxir.Todos.Todo

todos = [
  %Todo{
    name: "Create the project",
    complete: true
  },
  %Todo{
    name: "Read the Vue docs",
    complete: true
  },
  %Todo{
    name: "Make this work",
    complete: false
  },
  %Todo{
    name: "Open Source all the things",
    complete: false
  },
  %Todo{
    name: "Visit Trelixir",
    complete: false
  }
]

for todo <- todos  do
  Repo.insert! todo
end
