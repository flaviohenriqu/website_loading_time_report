<!DOCTYPE html>
<html>
<head>
    <title>Website Loading Time Report</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Website Loading Time Report</h1>

        <h2>Ranked by Load Time</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Website</th>
                    <th>Load Time (seconds)</th>
                    <th>Page Size (KB)</th>
                </tr>
            </thead>
            <tbody>
                %for report in sorted_by_time:
                    <tr>
                        <td>{{ report['website'] }}</td>
                        <td>{{ report['load_time'] }}</td>
                        <td>{{ report['page_size'] }}</td>
                    </tr>
                %end
            </tbody>
        </table>

        <h2>Ranked by Page Size</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Website</th>
                    <th>Load Time (seconds)</th>
                    <th>Page Size (KB)</th>
                </tr>
            </thead>
            <tbody>
                %for report in sorted_by_size:
                    <tr>
                        <td>{{ report['website'] }}</td>
                        <td>{{ report['load_time'] }}</td>
                        <td>{{ report['page_size'] }}</td>
                    </tr>
                %end
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
