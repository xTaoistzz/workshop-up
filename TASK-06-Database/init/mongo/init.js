db = db.getSiblingDB('todo_app');

db.todos.insertMany([
  { title: 'Setup Database MongoDB', done: false },
]);
