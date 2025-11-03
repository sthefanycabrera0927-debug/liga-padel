<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
<title>Liga Femenina – No puedo, tengo pádel</title>
<style>
/* ======= VARIABLES ======= */
:root{
 --bg:#f7f9fb; --panel:#fff; --text:#111; --muted:#6b7280; --border:#e6e9ef;
 --accent:#2dd24c; --accent-ink:#042c14; --danger:#ff4d67; --card:#ffffff;
}

/* ======= RESET ======= */
*{box-sizing:border-box;font-family:system-ui,Segoe UI,Roboto}
body{margin:0;background:var(--bg);color:var(--text)}
h1,h2{margin:.2rem 0}

/* ======= LAYOUT ======= */
.container{max-width:1100px;margin:auto;padding:16px}
.card{
 background:var(--panel);border:1px solid var(--border);border-radius:14px;
 box-shadow:0 4px 20px rgba(0,0,0,.05);margin-bottom:12px;
}
.card .hd{padding:12px 16px;border-bottom:1px solid var(--border);display:flex;justify-content:space-between}
.card .bd{padding:14px 16px}
.togglable .hd{cursor:pointer}
.is-collapsed .bd{display:none}

/* ====== BUTTONS ====== */
button,input,select{padding:8px 10px;border-radius:8px;border:1px solid var(--border)}
button{cursor:pointer;font-weight:600}
.primary{background:var(--accent);color:var(--accent-ink);border:none}
.danger{background:var(--danger);color:#fff;border:none}
.ghost{background:#fff}

/* ===== FIXTURE CARDS ===== */
.fixture-grid{
 display:grid;
 grid-template-columns:repeat(auto-fit,minmax(190px,1fr));
 gap:10px;
}
.fx-card{
 background:#fff;padding:10px;border:1px solid var(--border);
 border-radius:10px;text-align:center;font-size:.9rem;
 box-shadow:0 2px 10px rgba(0,0,0,.04)
}

/* ===== MATCH CARDS ===== */
.lanes{display:grid;gap:12px}
.lane{padding:0;border:1px solid var(--border);border-radius:12px;background:#fff}
.lane-title{padding:8px 12px;font-weight:700;border-bottom:1px solid var(--border)}
.lane-body{padding:10px}

.match{
 border:1px solid var(--border);border-radius:10px;
 margin-bottom:12px;padding:10px;background:#fff;
}

/* ===== SCORE ROWS ===== */
.row-score{
 display:grid;
 grid-template-columns:1fr 50px 50px 50px;
 gap:6px;
 align-items:center;
 margin-bottom:6px;
}
.setBox{
 width:50px;height:48px;text-align:center;font-size:22px;font-weight:700;
}

/* ===== TABLE ===== */
table{width:100%;border-collapse:collapse}
th,td{padding:6px;border-bottom:1px solid var(--border)}
th{background:#fff;position:sticky;top:0}
.small{font-size:.85rem;color:var(--muted)}
</style>
</head>
<body>
<div class="container">

<header style="margin-bottom:10px">
 <h1>🏆 Liga Femenina – <span style="color:#2dd24c">No puedo, tengo pádel</span></h1>
 <div class="small">Resultados, cruces y tabla en vivo (Supabase)</div>
</header>

<nav style="display:flex;gap:8px;flex-wrap:wrap;margin-bottom:8px">
 <label class="small">Filtrar pareja:
  <select id="filterTeam"></select>
 </label>
</nav>

<!-- 👉 PAREJAS -->
<div class="card togglable is-collapsed" id="pairsCard">
 <div class="hd"><strong>👥 Parejas</strong></div>
 <div class="bd"><div id="teamList"></div></div>
</div>

<!-- 👉 CRUCES -->
<div class="card togglable is-collapsed" id="fixtureCard">
 <div class="hd"><strong>🎾 Cruces</strong></div>
 <div class="bd">
   <h4>IDA</h4>
   <div class="fixture-grid" id="fixture-ida"></div>
   <br>
   <h4>VUELTA</h4>
   <div class="fixture-grid" id="fixture-vuelta"></div>
 </div>
</div>

<!-- 👉 JUEGOS -->
<div class="card togglable is-collapsed" id="gamesCard">
 <div class="hd"><strong>📝 Juegos (Cargar resultados)</strong></div>
 <div class="bd">
   <details id="block-ida"><summary><b>IDA</b></summary><div class="lanes" id="lanes-ida"></div></details><br>
   <details id="block-vuelta"><summary><b>VUELTA</b></summary><div class="lanes" id="lanes-vuelta"></div></details>
 </div>
</div>

<!-- 👉 TABLA -->
<div class="card">
 <div class="hd"><strong>📊 Tabla de posiciones</strong></div>
 <div class="bd"><table id="standings"><thead><tr>
 <th>#</th><th>Pareja</th><th>PJ</th><th>PG</th><th>PP</th>
 <th>GP</th><th>GC</th><th>Dif</th><th>Puntos</th>
 </tr></thead><tbody></tbody></table></div>
</div>

<a href="index.html" class="small">🔐 Salir</a>

</div><!-- container -->

<script type="module">
/* ========= SUPABASE ========= */
const URL='https://dyaptlmncbbmruyduerv.supabase.co';
const KEY='eyJhbGciOiJIUzI1NiIs...'; // 🔒 tu anon key (ya la tenías)
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
const sb = createClient(URL,KEY);
const LEAGUE='lfnpd-2025';

/* ========= STATE ========= */
let teams=[], matches=[], fixture={ida:[],vuelta:[]};

const $=q=>document.querySelector(q);

/* ========= LOAD FROM SUPABASE ========= */
async function loadData(){
 const {data:t}=await sb.from('teams').select('*').eq('league_id',LEAGUE).order('position');
 teams=t||[];
 const {data:m}=await sb.from('matches').select('*').eq('league_id',LEAGUE);
 matches=m||[];
 buildFixture(); renderTeams(); renderFixture(); renderMatches(); renderTable();
}

/* ========= BUILD FIXTURE RR ========= */
function buildFixture(){
 const ids=teams.map(t=>t.id);
 const r=[]; let arr=[...ids];
 if(arr.length%2===1)arr.push('B');
 const n=arr.length;
 for(let i=0;i<n-1;i++){
  const rd=[];
  for(let j=0;j<n/2;j++){ if(arr[j]!='B'&&arr[n-1-j]!='B') rd.push([arr[j],arr[n-1-j]]) }
  r.push(rd);
  arr.splice(1,0,arr.pop());
 }
 fixture.ida=r;
 fixture.vuelta=r.map(rd=>rd.map(([a,b])=>[b,a]));
}

/* ========= TEAMS ========= */
function renderTeams(){
 $('#teamList').innerHTML=teams.map((t,i)=>`<div>${i+1}. ${t.name}</div>`).join('');
 $('#filterTeam').innerHTML=`<option value="ALL">Todas</option>`+teams.map(t=>`<option value="${t.id}">${t.name}</option>`).join('');
}

/* ========= FIXTURE CARDS ========= */
function renderFixture(){
 const render = (div,leg)=>
  $(div).innerHTML = fixture[leg].flat()
   .map(([a,b])=>`<div class="fx-card">${nm(a)}<br><b>vs</b><br>${nm(b)}</div>`)
   .join('');

 render('#fixture-ida','ida');
 render('#fixture-vuelta','vuelta');
}

const nm=id=>teams.find(x=>x.id===id)?.name||"??";

/* ========= MATCH INPUT CARDS ========= */
function renderMatches(){
 const filter=$('#filterTeam').value;
 const make=(div,leg)=>{ 
   const html = fixture[leg].flat()
   .filter(([a,b])=>filter==="ALL"||a===filter||b===filter)
   .map(([a,b],i)=>matchCard(a,b,leg,i)).join('');
   $(div).innerHTML=html;
 };
 make('#lanes-ida','ida'); make('#lanes-vuelta','vuelta');
}

function matchCard(a,b,leg,i){
 const uniq=[a,b].sort().join('__')+leg+i;
 const m=matches.find(m=>m.uniq===uniq)||{};
 const val=(s,p)=>m.sets?.[s]?.[p]||"";
 const input=(s,p)=>`<input class="setBox" data-u="${uniq}" data-s="${s}" data-p="${p}" value="${val(s,p)}">`;
 return `<div class="match">
 <div class="small"><b>${nm(a)}</b> vs <b>${nm(b)}</b></div>
 <div class="row-score"><span>${nm(a)}</span>${input(0,0)}${input(1,0)}${input(2,0)}</div>
 <div class="row-score"><span>${nm(b)}</span>${input(0,1)}${input(1,1)}${input(2,1)}</div>
 <button class="primary" onclick="save('${uniq}','${a}','${b}','${leg}',${i})">Guardar</button>
 <button class="ghost" onclick="delMatch('${uniq}')">Borrar</button>
 </div>`;
}

/* ========= SAVE / DELETE ========= */
window.save=async(uniq,a,b,leg,i)=>{
 const fields=[...document.querySelectorAll(`[data-u="${uniq}"]`)];
 const sets=[[0,1],[2,3],[4,5]].map((_,s)=>[
  Number(fields[s*2].value)||0, Number(fields[s*2+1].value)||0
 ]).filter(x=>x[0]>0||x[1]>0);
 if(sets.length<2)return alert("Mínimo 2 sets");
 let wA=0,wB=0; sets.forEach(([x,y])=>{if(x>y)wA++; else wB++;});
 if(wA===wB && sets.length<3)return alert("Se necesita 3er set");
 const ptsA=wA>wB?3:0, ptsB=wB>wA?3:0;
 const payload={league_id:LEAGUE,uniq,leg,round:i+1,team_a:a,team_b:b,sets,pts_a:ptsA,pts_b:ptsB};
 await sb.from('matches').upsert(payload);
 await loadData();
}

window.delMatch=async(uniq)=>{
 await sb.from('matches').delete().eq('uniq',uniq).eq('league_id',LEAGUE);
 await loadData();
}

/* ========= TABLE ========= */
function renderTable(){
 const st={}; teams.forEach(t=>st[t.id]={...t,PJ:0,PG:0,PP:0,GP:0,GC:0,PTS:0});
 matches.forEach(m=>{
  const A=m.team_a,B=m.team_b;
  let sA=0,sB=0,gA=0,gB=0;
  m.sets.forEach(([x,y])=>{gA+=x;gB+=y;if(x>y)sA++;else sB++;});
  st[A].PJ++; st[B].PJ++; st[A].GP+=gA; st[A].GC+=gB; st[B].GP+=gB; st[B].GC+=gA;
  if(sA>sB){st[A].PG++;st[B].PP++;} else {st[B].PG++;st[A].PP++;}
  st[A].PTS+=m.pts_a; st[B].PTS+=m.pts_b;
 });
 const arr=Object.values(st).sort((a,b)=>b.PTS-a.PTS||b.GP-a.GP);
 $('#standings tbody').innerHTML=arr.map((r,i)=>`
 <tr><td>${i+1}</td><td>${r.name}</td><td>${r.PJ}</td><td>${r.PG}</td><td>${r.PP}</td>
 <td>${r.GP}</td><td>${r.GC}</td><td>${r.GP-r.GC}</td><td>${r.PTS}</td></tr>`).join('');
}

/* ========= START ========= */
$('#filterTeam').onchange=renderMatches;
loadData();
</script>
</body>
</html>
