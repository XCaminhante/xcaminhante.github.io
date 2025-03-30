var svgObj = null
var svgDoc = null
var display = null
var evt = null
var C = new CalculadoraBasica()

window.addEventListener("load", function() {
  svgObj = document.getElementById('calculadora');
  svgDoc = svgObj.contentDocument || svgObj.contentWindow.document;
  display = new DisplayLCD()
  evt = document.getElementById('evt')
  document.addEventListener('keydown', function (e) { var r = teclado(e.keyCode); if (r) {e.preventDefault();} })
})

function preencherNum (num) { return ('0'+num).slice(-2) }

function SegmentoLCD (_id) {
  var elem = svgDoc.getElementById(_id)
  var c = elem.classList;
  var v = true
  function acender () { if (!v) { c.remove('apagado'); c.add('aceso'); } v=true; }
  function apagar () { if (v) { c.remove('aceso'); c.add('apagado'); } v=false; }
  apagar()
  this.estado = function (valor) { if (valor) {acender()} else {apagar()} }
  this.acender = acender
  this.apagar = apagar
  return this
}

var fonteDigs = {
'0': [true,true,true,false,true,true,true],
'1': [false,false,true,false,false,true,false],
'2': [true,false,true,true,true,false,true],
'3': [true,false,true,true,false,true,true],
'4': [false,true,true,true,false,true,false],
'5': [true,true,false,true,false,true,true],
'6': [true,true,false,true,true,true,true],
'7': [true,true,true,false,false,true,false],
'8': [true,true,true,true,true,true,true],
'9': [true,true,true,true,false,true,true],
' ': [false,false,false,false,false,false,false],
'a': [true,true,true,true,true,true,false],
'b': [false,true,false,true,true,true,true],
'c': [false,false,false,true,true,false,true],
'd': [false,false,true,true,true,true,true],
'e': [true,true,false,true,true,false,true],
'f': [true,true,false,true,true,false,false],
'g': [true,true,false,false,true,true,true],
'h': [false,true,true,true,true,true,false],
'i': [false,true,false,false,true,false,false],
'j': [false,false,true,false,false,true,true],
'k': [false,true,false,true,true,true,false],
'l': [false,true,false,false,true,false,true],
'm': [true,true,true,false,true,true,false],
'n': [false,false,false,true,true,true,false],
'o': [false,false,false,true,true,true,true],
'p': [true,true,true,true,true,false,false],
'q': [true,true,true,true,false,true,false],
'r': [false,false,false,true,true,false,false],
's': [true,true,false,true,false,false,false],
't': [true,true,false,false,true,false,false],
'u': [false,false,false,false,true,true,true],
'v': [false,true,true,false,true,true,true],
'w': [false,true,true,false,false,true,true],
'x': [false,true,false,true,false,true,false],
'y': [false,true,true,true,false,true,true],
'z': [true,false,true,true,false,false,false],
'º': [true,true,true,true,false,false,false],
';': [false,false,false,false,false,true,true],
',': [false,false,false,false,false,true,false],
'_': [false,false,false,false,false,false,true],
'-': [false,false,false,true,false,false,false],
'^': [true,false,false,false,false,false,false],
'(': [true,true,false,false,true,false,true],
')': [true,false,true,false,false,true,true],
'=': [false,false,false,true,false,false,true],
}

function DigitoLCD (_pos) {
  var pos = preencherNum(_pos)
  var idseg = 'dig'+pos+'seg0'
  var segmentos = {}
  for (let a=1; a<=7; a++) { segmentos[a] = new SegmentoLCD(idseg + a) }
  this.segmento = function (idx, valor) { segmentos[idx].estado(valor) }
  this.mostrar = function (vetor) { vetor.forEach( (v,i)=>{segmentos[i+1].estado(v)} ) }
  this.limpar = function () { for (let a=1;a<=7;a++) { segmentos[a].apagar() } }
  return this
}

function DisplayLCD () {
  var sErro = new SegmentoLCD('erro')
  var sMemo = new SegmentoLCD('memoria')
  var sSinal = new SegmentoLCD('sinalneg')
  var digitos = {}
  for (let a=1; a<=14; a++) { digitos[a] = new DigitoLCD(a) }
  var pontos = {}
  for (let a=1; a<=14; a++) { pontos[a] = new SegmentoLCD('ponto'+preencherNum(a)) }
  var acentos = {}
  for (let a=1; a<=11; a++) { acentos[a] = new SegmentoLCD('acento'+preencherNum(a)) }

  this.mostrar = function (valores) {
  var e = false, m = false, s = false
  var caracs = '', ponto = 0
  for (let a=0; a<valores.length; a++) {
    let c = valores.charAt(a)
    switch (c) {
    case 'E': e=true; break;
    case 'M': m=true; break;
    case 'S': s=true; break;
    case '.': ponto = caracs.length; break;
    default: if (c in fonteDigs) { caracs += c; } }
  }
  //
  var cl = caracs.length
  if (ponto == 0) { ponto = cl }
  ponto = cl - ponto + 1
  //
  for (let a=1; a<=11; a++) {
    if ( (a <= cl-3 && a >= ponto) && ( (ponto-a)%3 == 0 ) ) { acentos[a].acender(); } else { acentos[a].apagar(); }
  }
  //
  for (let a=1; a<=14; a++) {
    if (a != ponto) { pontos[a].apagar(); }
    else { pontos[a].acender(); }
    if (a>cl) { digitos[a].limpar(); }
    else { digitos[a].mostrar( fonteDigs[caracs[cl-a]] ); }
  }
  //
  if (cl > 14) { e = true }
  sErro.estado(e)
  sMemo.estado(m)
  sSinal.estado(s)
  }

  this.limpar = function () {
  sErro.apagar()
  sMemo.apagar()
  sSinal.apagar()
  for (let a=1; a<=11; a++) { digitos[a].limpar(); pontos[a].apagar(); acentos[a].apagar(); }
  for (let a=12; a<=14; a++) { digitos[a].limpar(); pontos[a].apagar(); }
  }
  return this
}

function teclado (tecla) {
  switch (tecla) {
  case 190: display.mostrar( C.ponto() ); return true
  case 69: display.mostrar( C.corrigir() ); return true
  case 67: display.mostrar( C.limpar() ); return true
  case 61: display.mostrar( C.resultado() ); return true
  default:
    if ('0'.charCodeAt(0) <= tecla && tecla <= '9'.charCodeAt(0)) {
      display.mostrar( C.receber(tecla-'0'.charCodeAt(0)) )
      return true;
    }
  }
  return false
}

function Numeral () {
  var parteInteira = ''
  var parteFracionaria = ''
  var negativo = false
  var fracional = false
  this.parteInteira = parteInteira
  this.parteFracionaria = parteFracionaria
  this.negativo = negativo
  this.fracional = fracional
  
  function toFixed (x) {
    if (Math.abs(x) < 1.0) {
      var e = parseInt(x.toString().split('e-')[1]);
      if (e) {
        x *= Math.pow(10,e-1);
        var c = (x.toString().substring(2).indexOf('.') == -1 ? 2 : 3), s = (x < 0);
        x = (s ? '-' : '') + '0.' + '0'.repeat(e-1) + x.toString().substring(c);
      } else { x = x.toString(); }
    } else {
      var e = parseInt(x.toString().split('+')[1]);
      if (e > 20) {
        e -= 20;
        x /= Math.pow(10,e);
        x += '0'.repeat(e);
      } else { x = x.toString(); }
    }
    return x;
  }
  
  function redefinirComNumero (x) {
    var ponto = x.indexOf('.')
    var neg = x.charAt(0) == '-'
    var inicioInteira = (neg ? 1 : 0)
    var finalInteira = (ponto != -1 ? ponto : x.length)
    var inicioFracional = (ponto != -1 ? ponto+1 : 0)
    var finalFracional = (ponto != -1 ? x.length : 0)
    //
    parteInteira = x.slice(inicioInteira, finalInteira)
    while (parteInteira.charAt(0) == '0') { parteInteira = parteInteira.slice(1); }
    parteFracionaria = x.slice(inicioFracional, finalFracional)
    while (parteFracionaria.charAt(parteFracionaria.length-1) == '0') { parteFracionaria = parteFracionaria.slice(0,-1); }
    fracional = (ponto != -1)
    negativo = neg
  }
  
  this.zerar = function () { parteInteira = ''; parteFracionaria = ''; negativo = false; fracional = false; }
  this.receber = function (digito) {
    if (!fracional) { if (digito != '0' || parteInteira.length > 0) { parteInteira += digito; }}
    else {parteFracionaria += digito;}
  }
  this.trocarSinal = function () { negativo = (negativo ? false : true) }
  this.ponto = function () { fracional = true }
  this.comoString = function () {
    var r = '';
    if (negativo) {r+='-'}
    if (parteInteira.length > 0) {r += parteInteira;} else {r += '0';}
    if (fracional) {r += '.'+parteFracionaria}
    return r
  }
  this.comoNumero = function () { return Number(this.comoString()) }
  this.redefinir = function (valor) { redefinirComNumero(toFixed(valor)) }
  return this
}

function CalculadoraBasica () {
  var A1 = new Numeral(), A2 = new Numeral()
  var op = null
  var memoria = new Numeral()
  var sobrescrever = false
  this.A1 = A1
  this.A2 = A2
  this.memoria = memoria
  this.op = op
  
  function limpar () { A1.zerar(); A2.zerar(); op = null; sobrescrever = false; }
  function corrigir () { if (op == null) { A1.zerar(); } else { A2.zerar(); } sobrescrever = false; }
  function mostrar (valor) {
    var m = ''
    if (memoria.comoNumero() != 0) { m += 'M' }
    var r = valor.comoString()
    if (r.charAt(0) == '-') { m += 'S'; r = r.slice(1) }
    m += r
    return m
  }
  function receber (digito) {
    if (sobrescrever) { corrigir(); }
    if (op == null) { A1.receber(digito); } else { A2.receber(digito); }
  }
  function trocarSinal () {
    if (sobrescrever) { corrigir(); }
    if (op == null) { A1.trocarSinal(); } else { A2.trocarSinal(); }
  }
  function ponto () {
    if (sobrescrever) { corrigir(); }
    if (op == null) { A1.ponto(); } else { A2.ponto(); }
  }
  function operacao (qual) {
    if (qual == undefined) { qual = null; }
    if (op != null) {
      var r = op(A1.comoNumero(), A2.comoNumero());
      A1.redefinir(r); A2.redefinir(0);
    }
    sobrescrever = true;
    op = qual;
  }
  function somar () { operacao( (a,b) => a+b ); }
  function subtrair () { operacao( (a,b) => a-b ); }
  function multiplicar () { operacao( (a,b) => a*b ); }
  function dividir () { operacao( (a,b) => a/b ); }
  
  function resgatarMemoria () {
    if (op == null) { A1.redefinir(memoria.comoNumero()); }
    else { A2.redefinir(memoria.comoNumero()); }
    sobrescrever = true
  }
  function somarMemoria () {
    var m = memoria.comoNumero();
    var r = ( op == null ? A1.comoNumero() : A2.comoNumero() );
    memoria.redefinir(m + r);
    sobrescrever = true
  }
  function subtrairMemoria () {
    var m = memoria.comoNumero();
    var r = ( op == null ? A1.comoNumero() : A2.comoNumero() );
    memoria.redefinir(m - r);
    sobrescrever = true
  }
  function limparMemoria () { memoria.redefinir(0) }
  
  this.receber = function (v) { receber(v); return mostrar((op == null ? A1 : A2)); }
  this.limpar = function () { limpar(); return 'ac'; }
  this.ponto = function () { ponto(); return mostrar((op == null ? A1 : A2)); }
  this.trocarSinal = function () { trocarSinal(); return mostrar((op == null ? A1 : A2)); }
  this.corrigir = function () { corrigir(); return 'c'; }
  this.somar = function () { operacao( (a,b) => a+b ); return ','+mostrar(A1); }
  this.subtrair = function () { operacao( (a,b) => a-b ); return ','+mostrar(A1); }
  this.multiplicar = function () { operacao( (a,b) => a*b ); return ','+mostrar(A1); }
  this.dividir = function () { operacao( (a,b) => (b==0 ? 0 : a/b) ); return ','+mostrar(A1); }
  this.resultado = function () { operacao(null); return '='+mostrar(A1); }
  this.resgatarMemoria = function () { resgatarMemoria(); return 'mr '+mostrar(memoria); }
  this.somarMemoria = function () { somarMemoria(); return 'm^ '+mostrar(memoria); }
  this.subtrairMemoria = function () { subtrairMemoria(); return 'm_ '+mostrar(memoria); }
  this.limparMemoria = function () { limparMemoria(); return 'mc'; }
  return this
}
