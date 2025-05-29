@import com.example.demo.dto.UserRegistrationDto

@param UserRegistrationDto userDto = null
@param String error = null
@param String success = null

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Реєстрація - UniversityPX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Реєстрація</h3>
                </div>
                <div class="card-body">
                    @if(error != null)
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    @endif

                    @if(success != null)
                        <div class="alert alert-success" role="alert">
                            ${success}
                        </div>
                    @endif

                    <form action="/api/register" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Ім'я користувача</label>
                            <input type="text"
                                   class="form-control"
                                   id="username"
                                   name="username"
                                   value="${userDto != null ? userDto.getUsername() : ""}"
                                   required
                                   minlength="3"
                                   maxlength="50">
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Пароль</label>
                            <input type="password"
                                   class="form-control"
                                   id="password"
                                   name="password"
                                   required
                                   minlength="6">
                        </div>

                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Підтвердіть пароль</label>
                            <input type="password"
                                   class="form-control"
                                   id="confirmPassword"
                                   name="confirmPassword"
                                   required
                                   minlength="6">
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Зареєструватися</button>
                        </div>
                    </form>

                    <div class="text-center mt-3">
                        <a href="/login">Вже маєте акаунт? Увійти</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Проверка совпадения паролей
    document.getElementById('confirmPassword').addEventListener('input', function() {
        const password = document.getElementById('password').value;
        const confirmPassword = this.value;

        if (password !== confirmPassword) {
            this.setCustomValidity('Паролі не співпадають');
        } else {
            this.setCustomValidity('');
        }
    });
</script>
</body>
</html>