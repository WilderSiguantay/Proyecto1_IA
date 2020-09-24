-- =============================================================================
-- Diagram Name: Noname1
-- Created on: 19/09/2020 10:00:41 p. m.
-- Diagram Version: 
-- =============================================================================


CREATE TABLE "ESTRUCTURA" (
	"id_estructura" SERIAL NOT NULL,
	"nombre_estructura" varchar(50),
	PRIMARY KEY("id_estructura")
);

CREATE TABLE "GRUPO" (
	"id_grupo" SERIAL NOT NULL,
	"nombre_grupo" char(50),
	"ESTRUCTURA_id_estructura" int4 NOT NULL,
	PRIMARY KEY("id_grupo")
);

CREATE TABLE "ANIMAL" (
	"id_animal" SERIAL NOT NULL,
	"altura_max" float4,
	"peso_max" float4,
	"anios_max" int4,
	"poblacion_libre" char(100),
	"velocidad_max" float4,
	"nombre_cientifico" char(100),
    "nombre_comun" char(100),
	"GRUPO_id_grupo" int4 NOT NULL,
	PRIMARY KEY("id_animal")
);

CREATE TABLE "CONTINENTE" (
	"id_continente" SERIAL NOT NULL,
	"nombre_continente" char(50),
	PRIMARY KEY("id_continente")
);

CREATE TABLE "ANIMAL_has_CONTINENTE" (
	"NMID" BIGSERIAL NOT NULL,
	"ANIMAL_id_animal" int4 NOT NULL,
	"CONTINENTE_id_continente" int4 NOT NULL
);


ALTER TABLE "GRUPO" ADD CONSTRAINT "Ref_GRUPO_to_ESTRUCTURA" FOREIGN KEY ("ESTRUCTURA_id_estructura")
	REFERENCES "ESTRUCTURA"("id_estructura")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "ANIMAL" ADD CONSTRAINT "Ref_ANIMAL_to_GRUPO" FOREIGN KEY ("GRUPO_id_grupo")
	REFERENCES "GRUPO"("id_grupo")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "ANIMAL_has_CONTINENTE" ADD CONSTRAINT "Ref_ANIMAL_has_CONTINENTE_to_ANIMAL" FOREIGN KEY ("ANIMAL_id_animal")
	REFERENCES "ANIMAL"("id_animal")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "ANIMAL_has_CONTINENTE" ADD CONSTRAINT "Ref_ANIMAL_has_CONTINENTE_to_CONTINENTE" FOREIGN KEY ("CONTINENTE_id_continente")
	REFERENCES "CONTINENTE"("id_continente")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;


--INSERCIONES
--CONTINENTES
insert into "CONTINENTE" (nombre_continente) values ('AMERICA');
insert into "CONTINENTE" (nombre_continente) values ('ASIA');
insert into "CONTINENTE" (nombre_continente) values ('EUROPA');
insert into "CONTINENTE" (nombre_continente) values ('OCEANIA');
insert into "CONTINENTE" (nombre_continente) values ('AFRICA');
--ESTRUCTURA
INSERT INTO "ESTRUCTURA" (nombre_estructura) values('VERTEBRADOS');
INSERT INTO "ESTRUCTURA" (nombre_estructura) values('INVERTEBRADOS');

--GRUPO
--Vertebrados
INSERT INTO "GRUPO" values(1,'MAMIFEROS', 1);
INSERT INTO "GRUPO"  values(2,'AVES',1);
INSERT INTO "GRUPO"  values(3,'PECES',1);
INSERT INTO "GRUPO"  values(4,'REPTILES',1);
--Invertebrados
INSERT INTO "GRUPO"  values(5,'MOLUSCOS', 2);

--Animales
INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1.83,1000,40, '2 millones',65,'Equus ferus caballus',1, 'Caballo');
update "ANIMAL" set altura_max = 1.83 where "ANIMAL".id_animal = 2;

--habitan en:
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(2,1);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(2,2);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(2,3);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(2,4);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(2,5);

--LEON
INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1.25,260,14,'7,500 mil',59,'Panthera leo',1, 'León');

INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(3,2);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(3,5);

--ELEFANTE

INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(2.96,7500,70,'500 mil',40,'Elephantidae',1, 'Elefante');

INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(4,2);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(4,5);

--TIGRE

INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1.22,258,26, '3,890 mil',90,'Panthera tigris',1, 'Tigre');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(5,2);

--LEOPARDO


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(0.78,90,17, '500 ejemplares',58,'Panthera pardus',1, 'Leopardo');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(6,2);


--AVES

INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1.20,8,26, 'INCALCULABLE',112,'Branta',2, 'Ganso');

INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(7,1);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(7,2);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(7,3);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(7,4);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(7,5);


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(0.45,0.55,10, 'INCALCULABLE',80,'Tyto Alba',2, 'Lechuza');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(8,3);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(8,5);


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1,4,80,'En peligro de extincion',24,'Psittacidae',2, 'Loro');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(9,1);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(9,2);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(9,3);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(9,4);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(9,5);


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(0.41,0.22,25,'En peligro de extincion',20,'Pharomachrus, Euptilotis',2, 'Quetzal');

INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(10,1);


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(2.5,7,30,'419,980 Ejemplares',50,'Hieraatus Spilogaster',2, 'Águila');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(11,1);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(11,2);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(11,3);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(11,4);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(11,5);


--PECES
INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1,9,80,'20,000 ejemplares',70,'Squalus acanthias',3, 'Tiburón mielga');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(12,3);


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(2,20,15,'500,000 ejemplares',90,'Sphyraena',3, 'Barracuda');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(13,1);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(13,2);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(13,3);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(13,4);
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(13,5);


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(0.07,0.1,7,'40,000 ejemplares',0.225,'Barbus Barbus',3, 'Barbo');

INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(14,3); --europa


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(9,1350,20,'50,000 ejemplares',45,'Manta Birostris',3, 'Mantarraya');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(15,1); --america
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(15,4);--oceania

INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(4,30,25,'incalculable',13,'Pygocentrus Nattereri',3, 'Piraña');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(16,1); --america


--REPTILES

INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(6,300,40,'50,000 ejemplares',48,'Caiman crocodilus',4, 'Caiman');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(17,1); --america


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(0.68,2,8,'100,000 ejemplares',35,'Chamaeleonidae',4, 'Camaleón');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(18,2);-- asia
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(18,3); --europa


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1,1,15,'40,000 ejemplares',10,'Physignathus cocincinus',4, 'Dragón de agua asiático');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(19,2);-- asia


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(7,1000,70,'34,000 ejemplares',35,'Crocodylus palustris',4, 'Cocodrilo');

INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(20,1); --america
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(20,2);-- asia
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(20,4);--oceania
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(20,5);--africa


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(3.1,150,40,'2,500 ejemplares',20,'Varanus komodoensis',4,'Dragón de Komodo');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(21,2);-- asia

--MOLUSCOS
INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(0.3,0.01,4,'500,000 ejemplares',0.01,'Holothuroidea',5,'Babosa de mar');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(22,1);--america
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(22,2);--asia
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(22,3);--europa
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(22,4);--oceania
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(22,5);--africa


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(6,2500,15,'10,000 ejemplares',43,'Octopodidae',5,'Pulpo');

INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(23,1);--america
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(23,2);--asia
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(23,4);--oceania

INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(0.5,10.5,3,'50,000 ejemplares',25,'Sepiida',5,'Sepia');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(24,1);--america
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(24,2);--asia
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(24,3);--europa
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(24,4);--oceania
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(24,5);--africa


INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(80,0.01,20,'Incalculable',0.01,'Helix',5,'Caracol');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(25,1);--america
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(25,2);--asia
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(25,3);--europa
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(25,4);--oceania
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(25,5);--africa



INSERT INTO "ANIMAL"(altura_max, peso_max, anios_max, poblacion_libre, velocidad_max, nombre_cientifico, "GRUPO_id_grupo", nombre_comun)
values(1.4,500,30,'100,000 ejemplares',30,'Teuthida',5,'Calamar');
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(26,1);--america
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(26,2);--asia
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(26,3);--europa
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(26,4);--oceania
INSERT INTO "ANIMAL_has_CONTINENTE" ("ANIMAL_id_animal" , "CONTINENTE_id_continente") values(26,5);--africa


--LISTADO ANIMALES
SELECT nombre_comun, nombre_cientifico, nombre_grupo, nombre_estructura FROM "ANIMAL" as A, "GRUPO" AS G, "ESTRUCTURA" AS E
WHERE A."GRUPO_id_grupo" = G.id_grupo AND
G."ESTRUCTURA_id_estructura" = E.id_estructura;

--ALTER TABLE ANIMAL ALTER COLUMN poblacion_libre SET DATA TYPE char(100);