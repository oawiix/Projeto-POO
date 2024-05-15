<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="WEB-INF/jspf/html-head-libs.jspf" %>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <title>Painel | Projeto POO</title>
</head>

<body>
    <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <script>
            async function request(url = "", methd, data) {
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
                    async loadTasks() {
                        request("/Projeto%20POO/tasks", "GET").then((data) => {
                            this.list = data.list;
                        });
                    }, async addTask() {
                        request("/Projeto%20POO/tasks", "POST", { title: this.newTaskTitle }).then((data) => {
                            this.newTaskTitle = '';
                            this.list = data.list;
                        });
                    }, async removeTask(taskTitle) {
                        request("/Projeto%20POO/tasks?title=" + taskTitle, "DELETE").then((data) => {
                            this.list = data.list
                        });
                    }
                }
            };
        </script>
        <% if(session.getAttribute("name") !=null) { %>
            <div class="containeer">
                <!-- Sidebar Section -->
                <aside>
                    <div class="toggle">
                        <div class="logo">
                            </svg> <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                class="bi bi-wrench-adjustable-circle-fill" viewBox="0 0 16 16">
                                <path
                                    d="M6.705 8.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 0-.288-.376l-.808.27z" />
                                <path
                                    d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m-6.202-4.751 1.988-1.657a4.5 4.5 0 0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.5 4.5 0 0 1-1.592-.29L4.747 14.2a7.03 7.03 0 0 1-2.949-2.951M12.496 8a4.5 4.5 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11q.04.3.04.61" />
                            </svg>
                            <h2>Projeto<span class="primary">POO</span></h2>
                        </div>
                        <div class="close" id="close-btn">
                            <span class="material-icons-sharp">
                                close
                            </span>
                        </div>
                    </div>

                    <div class="sidebar">
                        <a>
                            <h1><b>Painel</b></h1>
                        </a>
                        <a href="${pageContext.request.contextPath}/users.jsp">
                            <span class="material-icons-sharp">
                                person_outline
                            </span>
                            <h3>Usuarios</h3>
                        </a>
                        <a href="#">
                            <span class="material-icons-sharp">
                                receipt_long
                            </span>
                            <h3>Historico</h3>
                        </a>
                        <a href="${pageContext.request.contextPath}/index.jsp" class="active">
                            <span class="material-icons-sharp">
                                insights
                            </span>
                            <h3>Geral</h3>
                        </a>
                        <a href="#">
                            <span class="message-count">0</span>
                            <h3>Mensagens</h3>
                        </a>
                        <a href="#">
                            <span class="material-icons-sharp">
                                inventory
                            </span>
                            <h3>Vendas</h3>
                        </a>
                        <a href="#">
                            <span class="material-icons-sharp">
                                report_gmailerrorred
                            </span>
                            <h3>Relatorios</h3>
                        </a>
                        <a href="#">
                            <span class="material-icons-sharp">
                                settings
                            </span>
                            <h3>Config</h3>
                        </a>
                        <a href="#">
                            <span class="material-icons-sharp">
                                add
                            </span>
                            <h3>Adicionar<br>Usuario</h3>
                        </a>
                        <a href="#">
                            <span class="material-icons-sharp">
                                logout
                            </span>
                            <h3>Sair</h3>
                        </a>
                    </div>
                </aside>
                <!-- End of Sidebar Section -->

                <!-- Main Content -->
                <main>
                    <h1>Analise</h1>
                    <!-- Analyses -->
                    <div class="analyse">
                        <div class="sales">
                            <div class="status">
                                <div class="info">
                                    <h3>Vendas</h3>
                                    <h1>R$ 1.234,00</h1>
                                </div>
                            </div>
                        </div>
                        <div class="visits">
                            <div class="status">
                                <div class="info">
                                    <h3>Pedidos Concluidos</h3>
                                    <h1>123</h1>
                                </div>
                            </div>
                        </div>
                        <div class="searches">
                            <div class="status">
                                <div class="info">
                                    <h3>Pedidos em Andamento</h3>
                                    <h1>6</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Analyses -->

                    <!-- New Users Section -->
                    <div class="new-users">
                        <h2>Funcionarios</h2>
                        <div class="user-list">
                            <div class="user">
                                <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor"
                                    class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                    <path fill-rule="evenodd"
                                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
                                    </s< /div>vg>
                                    <h2>Exemplo #1</h2>
                                    <p>Cargo/Setor</p>
                            </div>
                            <div class="user"></svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor"
                                    class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                    <path fill-rule="evenodd"
                                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
                                </svg>
                                <h2>Exemplo #2</h2>
                                <p>Cargo/Setor</p>
                            </div>
                        </div>
                    </div>
                    <!-- End of New Users Section -->

                    <!-- Recent Orders Table -->

                    <div class="recent-orders" x-data="tasks()" x-init="loadTasks()">
                        <!-- Botão para abrir o pop-up -->
                        <h2>Pedidos Recentes<button id="openFormButton" class="btn btn-outline-primary" type="button"
                                style="margin-left: 15px; margin-bottom: 2px;">Adicionar</button></h2>

                        <!-- O pop-up (inicialmente oculto com display: none) -->
                        <div id="formPopup" class="popup" style="display: none;
                    position: fixed;
                    width: 425px;
                    box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
                    height: 425px;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    padding: 25px;
                    border-radius: 25px;
                    background-color: #fff;">
                            <div>
                                <div>
                                    <form action="/suaAcao" method="post">
                                        <h1>Adicionar um novo pedido</h1>
                                        <span style="margin-left: 25px;"><b>Cliente</b></span>
                                        <input type="text" x-model="newTaskTitle" placeholder="Nome do Cliente"
                                            style="padding: 15px;"><br>
                                        <span style="margin-left: 25px;"><b>Forma de Pagamento</b></span>
                                        <select id="menuOptions" name="menu-options" style="padding: 15px;">
                                            <option value="opcao1">Boleto</option>
                                            <option value="opcao2">PIX</option>
                                            <option value="opcao3">Credito</option>
                                            <option value="opcao4">Debito</option>
                                            <option value="opcao5">Transferencia</option>
                                            <option value="opcao6">Dinheiro</option>
                                        </select><br>
                                        <span style="margin-left: 25px;"><b>Valor</b></span><span
                                            style="margin-left: 25px;">R$</span>
                                        <input type="number" step="0.01" id="" name="" placeholder="0"
                                            style="padding: 15px;"><br>
                                        <span style="margin-left: 25px;"><b>Status inicial</b></span>
                                        <select id="menuOptions" name="menu-options" style="padding: 15px;">
                                            <option value="opcao1">Espera</option>
                                            <option value="opcao2">Producao</option>
                                            <option value="opcao3">Concluido</option>
                                        </select><br>
                                        <span style="margin-left: 25px;"><b>Observacoes</b></span><span
                                            style="margin-left: 25px;"></span>
                                        <input type="text" id="" name="" placeholder="..." style="padding: 15px;"><br>
                                    </form>
                                    <button class="btn btn-danger" id="closeFormButton" type="button"
                                        style="padding: 10px; margin-left: 25px; margin-top: 25px;">Cancelar</button>
                                    <button id="adicionarButton" class="btn btn-outline-primary" type="button"
                                        x-on:click="addTask()"
                                        style="padding:10px; margin-left: 25px; margin-top: 25px;">Adicionar</button>

                                </div>

                            </div>
                        </div>
                        <script>
                            document.getElementById('openFormButton').addEventListener('click', function () {
                                document.getElementById('formPopup').style.display = 'block'; // Mostra o pop-up
                            });

                            document.getElementById('closeFormButton').addEventListener('click', function () {
                                document.getElementById('formPopup').style.display = 'none'; // Esconde o pop-up
                            });
                            document.getElementById('adicionarButton').addEventListener('click', function () {
                                document.getElementById('formPopup').style.display = 'none'; // Esconde o pop-up
                            });
                        </script>

                        <table>
                            <thead>
                                <tr>
                                    <th> </th>
                                    <th>Cliente</th>
                                    <th>ID do Pedido</th>
                                    <th>Pagamento</th>
                                    <th>Valor</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <template x-for="task in list">
                                    <tr>
                                        <td>
                                            <button type="button" x-on:click="removeTask(task.title)"
                                                class="btn btn-outline-success btn-sm" style=""><i
                                                    class="bi bi-check2-square"></i></button>
                                                    <button type="button" x-on:click=""
                                                    class="btn btn-outline-primary btn-sm"></i>+</button>
                                        </td>
                                        <td>
                                            <span x-text="task.title" style=""></span>
                                        </td>
                                        </td>
                                        <td>#123</td>
                                        <td>Cartao</td>
                                        <td>R$ 123,00</td>
                                        <td style="color: rgb(5, 155, 0);">Concluido</td>
                                    </tr>
                                </template>
                                <tr>
                                    <td>[Config]</td>
                                    <td>Exemplo #2</td>
                                    <td>#124</td>
                                    <td>Boleto</td>
                                    <td>R$ 124,00</td>
                                    <td style="color: chocolate;">Producao</td>
                                </tr>
                                <tr>
                                    <td>[Config]</td>
                                    <td>Exemplo #3</td>
                                    <td>#125</td>
                                    <td>Cartao</td>
                                    <td>R$ 125,00</td>
                                    <td style="color: rgb(138, 3, 3);">Cancelado</td>
                                </tr>
                                <tr>
                                    <td>[Config]</td>
                                    <td>Exemplo #4</td>
                                    <td>#126</td>
                                    <td>PIX</td>
                                    <td>R$ 126,00</td>
                                    <td style="color: rgb(0, 74, 184);">Aguardando</td>
                                </tr>

                            </tbody>
                        </table>
                        <a href="#" style="text-decoration: none;">Mostrar tudo</a>
                    </div>
                    <!-- End of Recent Orders -->

                </main>
                <!-- End of Main Content -->

                <!-- Right Section -->
                <div class="right-section">
                    <div class="nav">
                        <div class="profile">
                            <div class="info">
                                <p>Ola, <b>
                                        <%= userName%>
                                    </b></p>
                                <small class="text-muted">[Administrador]</small>
                            </div>
                        </div>
                    </div>
                    <!-- End of Nav -->

                    <div class="user-profile">
                        <div class="usuario-logado">
                            <h2>
                                <%= userName%>
                            </h2>
                            <p>[Descricao]</p>
                            <form>
                                <button class="btn btn-outline-success" type="submit"
                                    name="session-logout">Sair</button>
                            </form>
                        </div>
                    </div>

                    <div class="reminders">
                        <div class="header">
                            <h2>Lembretes</h2>
                            <span class="material-icons-sharp">
                                notifications_none
                            </span>
                        </div>

                        <div class="notification">
                            <div class="icon">
                                <span class="material-icons-sharp">
                                    edit
                                </span>
                            </div>
                            <div class="content">
                                <div class="info">
                                    <h3>Exemplo #1</h3>
                                    <small class="text_muted">
                                        15/06/24 | 16:00 - 21:00
                                    </small>
                                </div>
                                <span class="material-icons-sharp">
                                    more_vert
                                </span>
                            </div>
                        </div>

                        <div class="notification deactive">
                            <div class="icon">
                                <span class="material-icons-sharp">
                                    edit
                                </span>
                            </div>
                            <div class="content">
                                <div class="info">
                                    <h3>Exemplo #2</h3>
                                    <small class="text_muted">
                                        15/06/24 | 08:00 - 12:00
                                    </small>
                                </div>
                                <span class="material-icons-sharp">
                                    more_vert
                                </span>
                            </div>
                        </div>

                        <div class="notification add-reminder">
                            <div>
                                <span class="material-icons-sharp">
                                    add
                                </span>
                                <h3>Adicionar Lembrete</h3>
                            </div>
                        </div>

                    </div>

                </div>


            </div>
            <% } %>
                <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
</body>

</html>