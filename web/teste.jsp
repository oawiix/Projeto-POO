<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TESTE</title>
</head>
<body>

<div class="card" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">teste</h5>
        <h6 class="card-subtitle mb-2 text-body-secondary">teste</h6>
     
        <form action="" method="POST">
            <div class="">
                <input type="text" class="form-control" id="formName" name="testeU">
                <br>
                <input type="submit" name="testeD" class="btn btn-primary">
                </form>
            </div>
    </div>
</div>

 <% String teste[] = new String[10];        
 if (request.getParameter("testeU") != null) {
     for (int i = 0; i < 10; i++) {
         teste[i] = request.getParameter("testeU");
         break;
     }
     for (int i = 0; i < 10; i++) {
         out.println(teste[i]);
     }
 }
%>


</body>
</html>