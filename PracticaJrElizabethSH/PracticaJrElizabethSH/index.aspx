<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PracticaJrElizabethSH.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Practica Jr - ESH</title>
    <link href="style.css" rel="stylesheet" type="text/css" />    
</head>
<body>
    <form id="form1" runat="server">
        <div class="cuerpo">
            <div class="bloque1">
                <img src="weeclaims.png" alt="Weeclaims" class="img-fluid" />
            </div>
            <div class="bloque2">
                <h1>Ingreso de datos</h1>
                <input id="nombre" autofocus="autofocus" placeholder="Nombre practicante" />
                <input id="arreglo" placeholder="Array Datos" />
                <button id="guarda" type="submit">Guardar</button>
                <div id="tablaOrden">
                    
                </div>
            </div>
        </div>
    </form>
    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var arreglo = [];
            $('#guarda').on("click", function (event) {
                event.preventDefault();
                creaTabla();
            })

            function creaTabla() {
                $('#tablaOrden').empty();
                var $tabla;                
                console.log("entrando");
                acomoda();
            }
            function acomoda() {
                var $mensajeError;
                var acomodo;
                var maximo;
                var minimo;
                var cadena = $('#arreglo').val();
                console.log("Arreglo ingresado: " + cadena);
                if (cadena == null) {
                    $mensajeError = $('<p class="error">Favor de ingresar los datos para el array</p>');
                    $mensajeError.appendTo("#tablaOrden");
                    console.log("No ingresó nada");
                }
                else {
                    if (cadena.includes(',')) {
                        console.log("Utiliza formato correcto, iniciando split");
                        arreglo = cadena.split(',');
                        console.log(arreglo);
                        acomodo = arreglo.sort(function (a, b) { return b - a });
                        console.log(acomodo);                        
                        var formatoTabla = '<table class="resultado"><thead><tr><th>#</th><th>Dato</th></tr></thead><tbody>';
                        var valores = Object.keys(acomodo);
                        console.log(valores.length);
                        maximo = Math.max(...acomodo);
                        minimo = Math.min(...acomodo);
                        var filas = '';
                        for (var i = 0; i < valores.length; i++) {
                            console.log("entrando al for");
                            var fila = '<tr><td>' + i + '</td>' + '<td>' + acomodo[i] + '</td></tr>';
                            console.log("valor " + i + ": "+acomodo[i]);
                            filas+=fila;
                            console.log(fila);
                            console.log(filas);
                        }
                        formatoTabla+=filas;
                        console.log(formatoTabla);
                        formatoTabla += '</tbody></table><p class="maximo"><strong>Valor máximo: </strong>' + maximo + '</p><p class="minimo"><strong>Valor mínimo: </strong>' + minimo + '</p>';
                        $tabla = $(formatoTabla);
                        $tabla.appendTo("#tablaOrden");

                    }
                    else {
                        $mensajeError = $('<p class="error">No se está utilizando el formato correcto para el array. Favor de utilizar coma(,) entre cada elemento del array.</p>');
                        $mensajeError.appendTo("#tablaOrden");
                        console.log("No utiliza el formato correcto");
                    }
                }
            }
        });


    </script>
</body>
</html>
