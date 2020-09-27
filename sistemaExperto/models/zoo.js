const conexion = require("../db");
var pl = require("tau-prolog");
var session = pl.create(1000);

session.consult("./prolog/bdc.pl", {
  success: function() { console.log("Cargado Correctamente") },
  error: function(err) { console.log("Cargado Incorrectamente")}
});


var respuesta = [];


async function consultaProlog(cadena_consulta){
    var resp = [];
    var temp = [];
    console.log(cadena_consulta);
    // Mostrar respuestas
    session.query(cadena_consulta);
      // start the query loop
    session.answers( (x) => resp.push(dividirCadena(pl.format_answer(x),";") ));

    return new Promise(resolve => {
        setTimeout(() => {
            if(resp.length>0){
                resolve(resp)
            }else{
             resolve("ERROR EN LA SOLICITUD")   
            }
        }, 1500);
    });
  }
  
  
function dividirCadena(cadenaADividir,separador) {
      console.log(cadenaADividir);
      if(cadenaADividir=="true ;"){
        return "Si posee estas caracteristicas";
      }else if(cadenaADividir =="false."){
        return "No hay ningun animal con esas caracteristicas";
      }else{
          
      var arrayDeCadenas = cadenaADividir.split(separador);
      var arrayFinal = [];
      arrayDeCadenas.forEach(function(elemento, indice) {
          arrayFinal.push(elemento.split(","));
          
      })
      var arrayIDS = [];
      arrayFinal.forEach(function(elemento,indice){
              if(elemento[1]!==undefined){
                  arrayIDS.push(elemento[1].split("="));
              }
      });
      }  

     /* arrayIDS.forEach(function(elemento, indice){
        console.log(elemento);
      });*/
      respuesta = arrayIDS;
      return respuesta;
    }

//CONSULTA A LA BASE DE DATOS
 async function consultar(cadenaConsulta) {
    const resultados = await conexion.query(cadenaConsulta);
    return resultados.rows;
}



    
        


module.exports = {consultar, dividirCadena,consultaProlog};