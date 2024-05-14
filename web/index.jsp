
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Index - Projeto POO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <%@ include file="WEB-INF/jspf/html-head-libs.jspf" %>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
  <body>
    <%@include file="WEB-INF/jspf/navbar.jspf" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        async function request (url ="", methd, data) {
            const response = await fetch(url, {
            method: methd,
            body: JSON.stringify(data)
        });
        return response.json();
    }

        function tasks() {
            return {
              newTaskTitle: '',
              list: [],
              async loadTask() {
                request("/Projeto%20POO/tasks:", "GET").then((data) => {
                  this.list = data.list;
                });
              },
              async addTask() {
                request("/Projeto%20POO/tasks", "POST", {title: this.newTaskTitle}).then((data) => {
                  title: this.newTaskTitle;
                  this.list = data.list;
                });
              },
                async removeTask(taskTitle) {
                request("/Projeto%20POO/tasks?title="+taskTitle, 'DELETE').then((data) => {
                  title: this.newTaskTitle;
                  this.list = data.list;
                });
        }}};
    </script>
    <% if(session.getAttribute("name") != null) 
    { %>
      <nav class="navbar navbar-expand-lg" style="background-color: rgb(238, 238, 238);font-weight: 500">
        <div class="container-fluid">
          <span class="navbar-brand mb-0 h1">MyTasks</span>
        </div>
      </nav>

      <div class="container-fluid m-2" x-data="tasks()" x-init="loadTask()">
        <div class="input-group mb-3">
          <input type="text" class="form-control" x-model="newTaskTitle" placeholder="New Task">
          <button class="btn btn-primary" type="button" x-on:click="addTask()">+</button>
        </div>
        <table class="table">
          <template x-for="task in list">
              <tr>
                  <td>
                      <button type="button" x-on:click="removeTask(task.title)" class="btn btn-danger btn-sm">✓ Done</button>
                      <span x-text="task.title"></span>
                  </td>
              </tr>
          </template>
      </table>
      </div>
      
    <% } 
    %>


<%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
</body>
</html>
