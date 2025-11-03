<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Acceso – Liga Femenina</title>
  <style>
    :root{--border:#e6e9ef;--panel:#fff;--bg:#f7f9fb;--accent:#2dd24c;--ink:#0f1220}
    *{box-sizing:border-box} body{margin:0;font-family:system-ui,Segoe UI,Roboto;background:var(--bg);color:var(--ink)}
    .wrap{min-height:100svh;display:grid;place-items:center;padding:24px}
    .card{background:var(--panel);border:1px solid var(--border);border-radius:16px;max-width:520px;width:100%;padding:28px;box-shadow:0 6px 28px rgba(16,24,40,.06)}
    h1{margin:0 0 8px} p{margin:0 0 16px;color:#5d667b}
    .btn{display:inline-flex;align-items:center;gap:10px;background:#fff;border:1px solid var(--border);border-radius:12px;padding:12px 16px;font-weight:600;cursor:pointer}
    .btn.primary{background:var(--accent);border-color:transparent;color:#0a1b10}
    .row{display:flex;gap:10px;flex-wrap:wrap;align-items:center}
    .muted{color:#5d667b;font-size:.9rem}
  </style>
</head>
<body>
  <div class="wrap">
    <div class="card">
      <h1>🏆 Liga Femenina</h1>
      <p>Inicia sesión para cargar resultados y ver los cruces.</p>
      <div class="row" style="margin:8px 0 16px">
        <button id="btnGoogle" class="btn">
          <img src="https://www.svgrepo.com/show/475656/google-color.svg" width="20" height="20" alt="">
          Iniciar sesión con Google
        </button>
        <button id="btnAnon" class="btn">Entrar como visita (solo lectura)</button>
      </div>
      <div class="muted">Serás redirigida a <code>liga.html</code> al completar el acceso.</div>
    </div>
  </div>

  <script type="module">
    // ======= TU PROYECTO SUPABASE =======
    const SUPABASE_URL = 'https://dyaptlmncbbmruyduerv.supabase.co';
    const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR5YXB0bG1uY2JibXJ1eWR1ZXJ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA1Nzc0MjgsImV4cCI6MjA3NjE1MzQyOH0.5bSZuq8G1XW3LYoM92J5skRuUpnUQYbd_oKT3toTSlA';
    import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
    const sb = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

    // Redirige si ya hay sesión
    const { data:{ session } } = await sb.auth.getSession();
    if(session){ location.href = 'liga-pade.html'; }

    // OAuth Google
    document.getElementById('btnGoogle').onclick = async ()=>{
      const { error } = await sb.auth.signInWithOAuth({
        provider:'google',
        options:{ redirectTo: location.origin + '/liga.html' }
      });
      if(error) alert('No se pudo iniciar sesión.');
    };

    // Modo visita
    document.getElementById('btnAnon').onclick = ()=>{
      sessionStorage.setItem('guest','1');
      location.href = 'liga.html';
    };
  </script>
</body>
</html>
