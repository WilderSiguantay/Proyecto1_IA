var express = require('express');
const zoo = require('../models/zoo');
var router = express.Router();
const zooModel = require("../models/zoo");
var cadenaRespuesta = [];


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { animales: '',respuesta : "falso" });
});

/* GET home page. */
router.get('/consultar', function(req, res, next) {
  res.render('index', { animales: '', respuesta : "falso" });
});


/*Ruta para realizar consultas*/ 
router.post('/consultar', async function (req, res) {

  const { longevidad, estructura, grupo, tamano, velocidad, poblacion, 
    molusco, escamas,huevos, tipo_ave, tipo_sangre, leche, vida, siente, 
    nomb, agua, respira } = req.body;

  var nombre;
  var nombre2;
  if(!nomb){
    nombre =  "NOMBRE,ID";
    nombre2 = "NOMBRE"
  }else{
    nombre = nomb + ",_";
    nombre2 = nomb;
  }
  
  var cadenaConsulta = "animal("+nombre+",_,_,_,_,_,_)"

  if(longevidad!= "0"){
    if(longevidad == "baja"){
      cadenaConsulta += ",longevidad_baja("+nombre2+")"
    }else if(longevidad == "media"){
      cadenaConsulta += ",longevidad_media("+nombre2+")"
    }else{
      cadenaConsulta += ",longevidad_alta("+nombre2+")"
    }  
  }
  if(estructura != "0"){
    if(estructura == "vertebrado"){
      cadenaConsulta += ",contiene_a(vertebrado,"+nombre2+")"
    }else{
      cadenaConsulta += ",contiene_a(invertebrado,"+nombre2+")"
    }
  }
  //GRUPO
  if(grupo != "0"){
    if(grupo == "mamifero"){
      cadenaConsulta += ",pertenece_a(mamifero,"+nombre2+")"
    }else if(grupo == "reptil"){
      cadenaConsulta += ",pertenece_a(reptil,"+nombre2+")"
    }else if(grupo == "pez"){
      cadenaConsulta += ",pertenece_a(pez,"+nombre2+")"
    }else if(grupo== "ave"){
      cadenaConsulta += ",pertenece_a(ave,"+nombre2+")"
    }else{
      cadenaConsulta += ",pertenece_a(molusco,"+nombre2+")"
    }
  }

  //TAMAñO
  if(tamano !="0"){
    if(tamano == "grande" ){
      cadenaConsulta += ",animal_grande("+nombre2+")"
    }else{
      cadenaConsulta += ",animal_pequeno("+nombre2+")"
    }
  }
//POBLACION
if(poblacion != "0"){
  if(poblacion == "extinto"){
    cadenaConsulta += ",extinto("+nombre2+")"
  }else if(poblacion== "vulnerable"){
    cadenaConsulta += ",vulnerable("+nombre2+")"
  }else{
    cadenaConsulta += ",sin_peligro("+nombre2+")"
  }
}
//VELOCIDAD
if(velocidad != "0"){
  if(velocidad == "lento"){
    cadenaConsulta += ",lento("+nombre2+")"
  }else if(velocidad== "normal"){
    cadenaConsulta += ",vel_normal("+nombre2+")"
  }else{
    cadenaConsulta += ",rapido("+nombre2+")"
  }
}



if(molusco!== undefined){
  //terrestre
  if(molusco == "terrestre"){
    cadenaConsulta += ",moluscos_terrestres("+nombre2+")"
  }else {
    cadenaConsulta += ",moluscos_marinos("+nombre2+")"
}
}


//ESCAMAS
if(escamas!== undefined){
  cadenaConsulta += ",tienen_escamas(_, "+nombre2+")"
}

//HUEVOS
if(huevos!== undefined){
  cadenaConsulta += ",ponen_huevos(_,"+nombre2+")"
}


if(tipo_ave!==undefined){
  
//VUELA
  if(tipo_ave== "vuela"){
    cadenaConsulta += ",vuelan("+nombre2+")"
  }else{
    cadenaConsulta += ",no_vuelan("+nombre2+")"
  }
}
//TIPO SANGRE
if(tipo_sangre!== undefined){

  if(tipo_sangre== "caliente"){
    cadenaConsulta += ",sangre_caliente(_,"+nombre2+")"
  }else{
    cadenaConsulta +=",sangre_fria(_,"+nombre2+")"
  }
}


//leche
if(leche!== undefined){
  cadenaConsulta += ",toman_leche(_,"+nombre2+")"
}

//VIDA
if(vida!== undefined){
  cadenaConsulta += ",tiene_vida("+nombre2+")"
}


//SIENTE
if(siente!== undefined){
  cadenaConsulta += ",puede_sentir("+nombre2+")"
}


//AGUA
if(agua!== undefined){
  cadenaConsulta += ",viven_agua(_,"+nombre2+")"
}

//RESPIRA
if(respira!== undefined){
  cadenaConsulta += ",puede_respirar("+nombre2+")"
}

  cadenaConsulta += ".";
  cadenaConsultaBD = "";

  cadenaRespuesta = await zooModel.consultaProlog(cadenaConsulta);
  console.log(cadenaRespuesta);
  cadenaRespuesta.forEach(function(elemento,indice){
    if(elemento[0][1]!== undefined){
      cadenaConsultaBD += `SELECT A.id_animal, A.nombre_comun, A.nombre_cientifico, 
      A.altura_max, A.velocidad_max, 
      A.peso_max, A.anios_max, 
      A.poblacion_libre,G.nombre_grupo, ES.nombre_estructura 
      from "ANIMAL" as A, "GRUPO" as G, "ESTRUCTURA" as ES
      where id_animal = `+elemento[0][1]+ 
      `AND A."GRUPO_id_grupo" = G.id_grupo
      AND G."ESTRUCTURA_id_estructura" = ES.id_estructura`;
      console.log(indice)
      console.log(cadenaRespuesta.length);
      if(indice < cadenaRespuesta.length -2){
        cadenaConsultaBD += " UNION "
      }
    }
    
  });
  cadenaConsultaBD += ";"
  console.log("TAMANO CADENA" +cadenaConsultaBD.length);

  if(cadenaConsultaBD.length>1){
  //INICIA
  zooModel.consultar(cadenaConsultaBD).then(animales => {console.log(animales);
    res.render("index", {animales: animales,respuesta : "falso"});
  }).catch(err => {
    console.log(err);
    return res.status(500).send("Error obteniendo datos");
  });
  //TERMINA
  }else{
    var arrayFinal =[];
    var animales;
    cadenaRespuesta.forEach(function(elemento,indice){
      arrayFinal.push(elemento.split(","))
    });
  
      animales = "El " +nomb+ " "+ arrayFinal[0];
    

    console.log("RESPUESTA ENVIADA A SERVIDOR "+ animales);
    res.render("index", {animales: animales, respuesta : "true"});
  }


});


module.exports = router;
