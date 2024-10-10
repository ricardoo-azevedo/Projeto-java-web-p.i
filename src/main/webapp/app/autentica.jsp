<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Cadastro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/login.css">
    
</head>
<body class="d-flex align-items-center justify-content-center">
    <main class="form-container ">
        <!-- Formulário de Login -->
        <form action="./controle.jsp?op=21" method="post">
            <h1 class="title">Login iMedic</h1>
            
            <div class="form-floating mb-3">
            
                <input type="text" class="form-control" id="floatingEmailLogin" placeholder="idFuncionario" name="idFuncionario" aria-label="idFuncionario" required>
                <label for="floatingEmailLogin">Id</label>
            </div>

            <div class="form-floating mb-3">
                 <input type="password" class="form-control" id="floatingPasswordLogin" placeholder="Senha" name="senha" aria-label="Senha" required>
                <label for="floatingPasswordLogin">Senha</label>
            </div>

            <div class="form-check text-start my-3">
                <input type="checkbox" class="form-check-input" id="mostrarSenha" onclick="togglePasswordVisibility()">
                <label class="form-check-label" for="mostrarSenha">Mostrar senha</label>
            </div>

            <button class="btn btn-primary w-100" type="submit">Entrar</button>

            <p class="credits">© 2024. Todos os direitos reservados.</p>
        </form>
    </main>

    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('floatingPasswordLogin');
            const checkbox = document.getElementById('mostrarSenha');
            
            if (checkbox.checked) {
                passwordInput.type = 'text';  // Mostrar senha
            } else {
                passwordInput.type = 'password';  // Ocultar senha
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



