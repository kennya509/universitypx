@import com.example.demo.entity.Student
@import java.util.List
@import java.lang.String
@param String title
@param List<Student> students

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
            font-size: 2.5em;
            font-weight: 300;
        }

        .table-container {
            padding: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        th {
            padding: 20px 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9em;
        }

        tbody tr {
            transition: all 0.3s ease;
        }

        tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tbody tr:hover {
            background-color: #e3f2fd;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 18px 15px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }

        .student-name {
            font-weight: 600;
            color: #2c3e50;
            font-size: 1.1em;
        }

        .faculty-id {
            background: #667eea;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
            display: inline-block;
            min-width: 40px;
            text-align: center;
        }

        .faculty-name {
            color: #5a6c7d;
            font-style: italic;
        }

        .no-data {
            text-align: center;
            padding: 50px;
            color: #7f8c8d;
            font-size: 1.2em;
        }

        .student-count {
            background: rgba(255, 255, 255, 0.2);
            padding: 8px 16px;
            border-radius: 20px;
            display: inline-block;
            margin-top: 10px;
            font-size: 0.9em;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
            }

            .header {
                padding: 20px;
            }

            .header h1 {
                font-size: 2em;
            }

            th, td {
                padding: 12px 8px;
                font-size: 0.9em;
            }

            .student-name {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>${title}</h1>
        <div class="student-count">
            Всього студентів: ${students.size()}
        </div>
    </div>

    <div class="table-container">
        @if(students != null && !students.isEmpty())
            <table>
                <thead>
                <tr>
                    <th>#</th>
                    <th>Ім'я студента</th>
                    <th>ID факультету</th>
                    <th>Назва факультету</th>
                </tr>
                </thead>
                <tbody>
                @for(int i = 0; i < students.size(); i++)
                    <tr>
                        <td>${i + 1}</td>
                        <td class="student-name">${students.get(i).getName()}</td>
                        <td>
                            <span class="faculty-id">${students.get(i).getFaculty().getId()}</span>
                        </td>
                        <td class="faculty-name">${students.get(i).getFaculty().getName()}</td>
                    </tr>
                @endfor
                </tbody>
            </table>
        @else
            <div class="no-data">
                Немає даних для відображення
            </div>
        @endif
    </div>
</div>
</body>
</html>