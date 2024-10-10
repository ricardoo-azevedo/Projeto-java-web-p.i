<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulário de Login</title>
  <!-- Link para o Bootstrap (opcional) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Estilos personalizados (opcional) -->
  <style>
    body {
	background: rgb(0,142,7);
	background: linear-gradient(328deg, rgba(0,142,7,1) 0%, rgba(237,237,237,1) 20%, rgba(157,157,157,1) 100%);
      padding: 50px;
      height: 100vh;
    }
    .login-form {
      max-width: 400px;
      margin: 0 auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="login-form">
      <h2 class="text-center mb-4">Sistema iMedic</h2>
      <form action="index.jsp" method="post">
        <div class="mb-3">
          <label for="login" class="form-label">Login</label>
          <input type="text" class="form-control" id="login" name="login" autocomplete="off">
        </div>
        <div class="mb-3">
          <label for="senha" class="form-label">Senha</label>
          <input type="password" class="form-control" id="senha" name="senha" autocomplete="off">
        </div>
        <div class="mb-3">
        	<button type="submit" class="btn btn-success btn-block w-100">Entrar</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
