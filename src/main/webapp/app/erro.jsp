<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erro no Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body, html {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8d7da; /* Cor de erro suave */
        }

        .error-container {
            text-align: center;
            padding: 3rem;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .error-icon {
            font-size: 3rem;
            color: #f44336;
            margin-bottom: 1rem;
        }

        .error-message {
            color: #f44336;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .btn {
            margin-top: 2rem;
            background-color: #f44336;
            color: white;
        }
    </style>

    <!-- Redirecionamento automático para a página de login em 5 segundos -->
    <meta http-equiv="refresh" content="15;url=autentica.jsp">
</head>
<body>

    <div class="error-container">
        <div class="error-icon">⚠️</div>
        <div class="error-message">
            <% 
            String msg = request.getParameter("msg"); // Captura a variável 'msg' da URL ou request
                if ("login_incorreto".equals(msg)) {
                    out.println("Login ou senha incorretos!");
                } else if ("id_invalido".equals(msg)) {
                    out.println("ID do funcionário inválido!");
                } else {
                    out.println("Ocorreu um erro desconhecido.");
                }
            %>
        </div>
        <p>Você será redirecionado para a página de login em alguns segundos.</p>
        <a href="autentica.jsp" class="btn">Voltar para Login</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

