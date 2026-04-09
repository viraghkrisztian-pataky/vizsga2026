<!DOCTYPE html>
<html lang="hu">
<head>
  <meta charset="UTF-8">
  <title>PHP ellenőrzés</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(135deg, #1e3c72, #2a5298);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: 'Segoe UI', sans-serif;
      color: white;
    }

    .card {
      background: rgba(255,255,255,0.1);
      backdrop-filter: blur(12px);
      border-radius: 20px;
      padding: 40px;
      text-align: center;
      box-shadow: 0 10px 40px rgba(0,0,0,0.3);
      width: 100%;
      max-width: 500px;
    }

    .status {
      font-size: 28px;
      font-weight: 600;
      margin-top: 20px;
    }

    .ok {
      color: #00ffae;
    }

    .error {
      color: #ff6b6b;
    }

    .time {
      margin-top: 15px;
      font-size: 14px;
      opacity: 0.8;
    }
  </style>
</head>

<body>

<div class="card">

  <h1>PHP ellenőrzés</h1>
  <p>Windows Server / Linux webszolgáltatás teszt</p>

  <!-- ALAP ÁLLAPOT (ha nincs PHP) -->
  <div class="status error">
    ❌ PHP NEM működik
  </div>

  <!-- EZ CSAK AKKOR FUT LE, HA VAN PHP -->
  <?php
    echo "<script>
      document.querySelector('.status').innerHTML = '✔ PHP működik';
      document.querySelector('.status').classList.remove('error');
      document.querySelector('.status').classList.add('ok');
    </script>";

    echo "<div class='time'>Szerver idő: " . date("Y-m-d H:i:s") . "</div>";
  ?>

</div>

</body>
</html>
