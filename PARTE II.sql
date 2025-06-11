
-------------------------------------------------------------------------------------------------------------------
------------------------------------------CREAZIONE E POPOLAMENTO--------------------------------------------------
-------------------------------------------------------------------------------------------------------------------


--CREAZIONE SCHEMA
CREATE schema OrtoUrbano;
set search_path to OrtoUrbano;
set datestyle to 'DMY';


--CREAZIONE TABELLA SCUOLE
CREATE TABLE Scuole
  (CM char(10) PRIMARY KEY,
  provincia char(2) NOT null,
  Nome varchar(30) NOT null,
  ciclo numeric(1) NOT null,
  tipoFinanziamento varchar(20) DEFAULT null,
  collaborazione bool NOT null DEFAULT FALSE,
  dummy char(1000) DEFAULT 'dp3v03ds4z1427gj0tflzs1mu99oso0pnha4dnd?6ozn82z?zlo3rt5pctadzob9qbhbe6f25pz5uieu29ht2954dtemzegbe6172fcnf6ergisurtpp?6081biv6vzbioehobcpo55bun4282zqadtbrol6?22?m6cossrod77o22jspmfj?ntg?a?9loub1aqits30zud8jdphjaf6l5ho04f561v03irb7h?frt28rt3lejour9jbta7zgc5hv41fasm6az2zid4joqf3807a9z34fh9b?1apc5vvn83eeuuzgrz0s12jpu5?t4ciqfluci5lzlmcdddsd2b54v4ab07g0b28i6hsqhupaazb2i5h29f2ohndpucqsl91rngmi02jrvizdllsob90t26emlmqf93fnjqaqfft3a045tl2zj9v??6iqfn1s?tmcnnn7ofrvfhllqhhc8mlsc5vqpd0qg47aohunt9zp11dhtmznvn9g?968f7u19m4j485mnhuf?3dtu9?mvbvuhpt74vtnmo7h?20ai?f39z98icesf3z371mu94nl?sv861fa4qs39jc80v36zafu?3rl6ntdvnifzjlulf9fti12mo0ebzglfub?sm1imgjjvoe4zdsp8ln83jhif4nu5ui20pd2?3dorzmosfh3jrrmjs47588izto6b3rfhzjv6dr1opg8c46hzlqrboll?2lvbripfocjo07sdqf2a0eiqg2fcucr6duqur0fbz8sfvdt8bbbizt?a9vp4relsbzjlelazcsfea?r3hiv?6?91un9i6cp2i34f40zuf071f2ra2h5s7q115ocdqfg9bm4efjflspp58httln6r?np?sib9gvnij2ecpti02ah9sv0ihbq65o3eb22dmr?me11q11353pb05dc2bqma90i7aa6?esfv61?aro52dcfdvg8jr776i555h8lgnd0oh165di5jcb4ized1vt',
  UNIQUE(provincia, nome, ciclo),
  CHECK(ciclo BETWEEN 1 AND 2));
  
INSERT INTO Scuole VALUES ('IMMM81701G','IM','Giovanni Pascoli',2);  
INSERT INTO Scuole VALUES ('GEIC85200A','GE','Barabino',1,'securitization',TRUE);
INSERT INTO Scuole VALUES ('SVPS01000V','SV','Orazio Grassi',2,TRUE);  
INSERT INTO Scuole VALUES ('GETV01300A','GE','Colombo',2,'securitization'); 
  

--CREAZIONE TABELLA PERSONE 
CREATE TABLE Persone
   (mail varchar(45) PRIMARY KEY,
   nome varchar(15)NOT null,
   cognome varchar(18)NOT null,
   telefono numeric(10) DEFAULT null,
   ruolo varchar(20) NOT null DEFAULT 'docente',
   lavora char(10)REFERENCES Scuole ON DELETE CASCADE ON UPDATE CASCADE NOT null,
   ruoloFinanziamento varchar(25) DEFAULT null,
   referente bool NOT null DEFAULT FALSE
   CHECK(ruoloFinanziamento='Referente' OR ruoloFinanziamento='Partecipante' OR ruoloFinanziamento='referente e partecipante'));
 
--scuola Giovanni Pascoli 
INSERT INTO Persone VALUES ('mariorossi@libero.it','Mario','Rossi',3339727305,'docente','IMMM81701G');   
INSERT INTO Persone VALUES ('giovannaguerrini@libero.it','Giovanna', 'Guerrini',3403314520,'docente','IMMM81701G',null,TRUE);
--scuola Barabino
INSERT INTO Persone VALUES ('rossiclaudia@gmail.it','Claudia','Rossi',3337449838,'docente','GEIC85200A','referente e partecipante',TRUE);   
--scuola Orazio Grassi
INSERT INTO Persone VALUES ('paoloparodi@gmail.it','Paolo','Parodi',3403523623,'docente','SVPS01000V',null,TRUE);
--scuola Colombo
INSERT INTO Persone VALUES ('sara@addari@gmail.it','Sara','Addari',675523623,'docente','GETV01300A','Referente',TRUE);
INSERT INTO Persone VALUES ('valentinachen@gmail.it','Valentina','Chen',987523623,'docente','GETV01300A','Partecipante');


--CREAZIONE TABELLA CLASSI
CREATE TABLE Classi
  (Nome char(2) NOT null,
  scuola char(10) REFERENCES Scuole ON DELETE CASCADE ON UPDATE CASCADE NOT null,
  ordine varchar(30),
  anno numeric (4),
  DocenteRiferimento varchar(45) REFERENCES Persone ON DELETE RESTRICT ON UPDATE CASCADE NOT null,
  dummy char(1000) DEFAULT 'dp3v03ds4z1427gj0tflzs1mu99oso0pnha4dnd?6ozn82z?zlo3rt5pctadzob9qbhbe6f25pz5uieu29ht2954dtemzegbe6172fcnf6ergisurtpp?6081biv6vzbioehobcpo55bun4282zqadtbrol6?22?m6cossrod77o22jspmfj?ntg?a?9loub1aqits30zud8jdphjaf6l5ho04f561v03irb7h?frt28rt3lejour9jbta7zgc5hv41fasm6az2zid4joqf3807a9z34fh9b?1apc5vvn83eeuuzgrz0s12jpu5?t4ciqfluci5lzlmcdddsd2b54v4ab07g0b28i6hsqhupaazb2i5h29f2ohndpucqsl91rngmi02jrvizdllsob90t26emlmqf93fnjqaqfft3a045tl2zj9v??6iqfn1s?tmcnnn7ofrvfhllqhhc8mlsc5vqpd0qg47aohunt9zp11dhtmznvn9g?968f7u19m4j485mnhuf?3dtu9?mvbvuhpt74vtnmo7h?20ai?f39z98icesf3z371mu94nl?sv861fa4qs39jc80v36zafu?3rl6ntdvnifzjlulf9fti12mo0ebzglfub?sm1imgjjvoe4zdsp8ln83jhif4nu5ui20pd2?3dorzmosfh3jrrmjs47588izto6b3rfhzjv6dr1opg8c46hzlqrboll?2lvbripfocjo07sdqf2a0eiqg2fcucr6duqur0fbz8sfvdt8bbbizt?a9vp4relsbzjlelazcsfea?r3hiv?6?91un9i6cp2i34f40zuf071f2ra2h5s7q115ocdqfg9bm4efjflspp58httln6r?np?sib9gvnij2ecpti02ah9sv0ihbq65o3eb22dmr?me11q11353pb05dc2bqma90i7aa6?esfv61?aro52dcfdvg8jr776i555h8lgnd0oh165di5jcb4ized1vt',
  PRIMARY KEY (Nome, scuola, ordine,anno));
   
--scuola Giovanni Pascoli   
INSERT INTO Classi VALUES ('3A','IMMM81701G','agrario',2021,'giovannaguerrini@libero.it');
INSERT INTO Classi VALUES ('4A','IMMM81701G','agrario',2022,'giovannaguerrini@libero.it');
INSERT INTO Classi VALUES ('3B','IMMM81701G','agrario',2021,'mariorossi@libero.it');
--scuola Barabino
INSERT INTO Classi VALUES ('3A','GEIC85200A','liceo scientifico',2021,'rossiclaudia@gmail.it');
INSERT INTO Classi VALUES ('4A','GEIC85200A','liceo scientifico',2022,'rossiclaudia@gmail.it');
--scuola Orazio Grassi
INSERT INTO Classi VALUES ('3B','SVPS01000V','liceo scienze applicate',2021,'paoloparodi@gmail.it');
--scuola Colombo
INSERT INTO Classi VALUES ('5B','GETV01300A','liceo scientifico',2020,'valentinachen@gmail.it');


--CREAZIONE TABELLA ORTI
CREATE TABLE Orti
  (GPS varchar(40) PRIMARY KEY,
   mq numeric(3) NOT null,
   nome varchar(15) NOT null,
   sede char(10) REFERENCES Scuole ON DELETE CASCADE ON UPDATE RESTRICT NOT null,
   scopo varchar(15) NOT null DEFAULT 'biomonitoraggio',
   tipo varchar(20) NOT null DEFAULT 'pieno campo',
   pulito bool NOT null DEFAULT FALSE,
   UNIQUE(nome, sede),
   CHECK(tipo='pieno campo' OR tipo='in vaso'),
   CHECK(scopo='fitobonifica' AND tipo='pieno campo' OR scopo='biomonitoraggio'));
	
--scuola Giovanni Pascoli 
INSERT INTO Orti VALUES ('43.821467681841426, 7.7883391180057835',4,'Zeus','IMMM81701G','fitobonifica');
INSERT INTO Orti VALUES ('43.821467681841179, 7.7883391180057023',4,'Demetra','IMMM81701G','fitobonifica');
INSERT INTO Orti VALUES ('43.821465759338054, 7.788317019014689',4,'Era','IMMM81701G','biomonitoraggio','pieno campo',TRUE);
INSERT INTO Orti VALUES ('43.821457534669086, 7.788340488343265',4,'Efesto','IMMM81701G','biomonitoraggio','pieno campo');
--scuola Barabino
INSERT INTO Orti VALUES ('44.41070398325923, 8.895705130913584',4,'Atena','GEIC85200A','fitobonifica');
INSERT INTO Orti VALUES ('44.41070398325750, 8.895705130913931',4,'Poseidone','GEIC85200A','fitobonifica');
INSERT INTO Orti VALUES ('44.41070398325518, 8.895705130913372',4,'Apollo','GEIC85200A','biomonitoraggio','in vaso',TRUE);
--scuola Orazio Grassi
INSERT INTO Orti VALUES ('44.3158555669862, 8.477707710413817',4,'Artemide','SVPS01000V','fitobonifica');
INSERT INTO Orti VALUES ('44.3158555669930, 8.477707710413529',4,'Afrodite','SVPS01000V','fitobonifica');
INSERT INTO Orti VALUES ('44.3158555669745, 8.477707710413604',4,'Ares','SVPS01000V','biomonitoraggio','in vaso');


--CREAZIONE TABELLA GRUPPI
CREATE TABLE Gruppi
  (Id char(4) PRIMARY KEY,
  appartenenza varchar(40) REFERENCES Orti ON DELETE CASCADE ON UPDATE CASCADE NOT null,
  corrispettivo char(4) REFERENCES Gruppi ON DELETE RESTRICT ON UPDATE CASCADE DEFAULT null,
  ruolo_biomonitoraggio varchar(10) DEFAULT null,
  UNIQUE(corrispettivo),
  CHECK(ruolo_biomonitoraggio='controllo' OR ruolo_biomonitoraggio='monitorato' OR ruolo_biomonitoraggio=null));

--scuola Giovanni Pascoli 
INSERT INTO Gruppi VALUES ('1001','43.821467681841426, 7.7883391180057835'); 
INSERT INTO Gruppi VALUES ('1002','43.821467681841179, 7.7883391180057023');
INSERT INTO Gruppi VALUES ('1003','43.821465759338054, 7.788317019014689'); 
INSERT INTO Gruppi VALUES ('1004','43.821457534669086, 7.788340488343265'); 
UPDATE Gruppi SET corrispettivo='1004',ruolo_biomonitoraggio='controllo' WHERE Id='1003';
UPDATE Gruppi SET corrispettivo='1003',ruolo_biomonitoraggio='monitorato' WHERE Id='1004';
--scuola Barabino
INSERT INTO Gruppi VALUES ('2001','44.41070398325923, 8.895705130913584');
INSERT INTO Gruppi VALUES ('2002','44.41070398325750, 8.895705130913931');
INSERT INTO Gruppi VALUES ('2003','44.41070398325518, 8.895705130913372'); 
--scuola Orazio Grassi
INSERT INTO Gruppi VALUES ('3001','44.3158555669862, 8.477707710413817');
INSERT INTO Gruppi VALUES ('3002','44.3158555669930, 8.477707710413529');
INSERT INTO Gruppi VALUES ('3003','44.3158555669745, 8.477707710413604');
--update condivisione Barabino/Grassi
UPDATE Gruppi SET corrispettivo='3003',ruolo_biomonitoraggio='controllo' WHERE Id='2003';
UPDATE Gruppi SET corrispettivo='2003',ruolo_biomonitoraggio='monitorato' WHERE Id='3003';


--CREAZIONE TABELLA SPECIE
CREATE TABLE Specie
  (nomeScientifico varchar(60) PRIMARY KEY,
	nomeComune varchar(20) NOT null,
	esposizione varchar(20) NOT null,
    dummy char(1000) DEFAULT 'dp3v03ds4z1427gj0tflzs1mu99oso0pnha4dnd?6ozn82z?zlo3rt5pctadzob9qbhbe6f25pz5uieu29ht2954dtemzegbe6172fcnf6ergisurtpp?6081biv6vzbioehobcpo55bun4282zqadtbrol6?22?m6cossrod77o22jspmfj?ntg?a?9loub1aqits30zud8jdphjaf6l5ho04f561v03irb7h?frt28rt3lejour9jbta7zgc5hv41fasm6az2zid4joqf3807a9z34fh9b?1apc5vvn83eeuuzgrz0s12jpu5?t4ciqfluci5lzlmcdddsd2b54v4ab07g0b28i6hsqhupaazb2i5h29f2ohndpucqsl91rngmi02jrvizdllsob90t26emlmqf93fnjqaqfft3a045tl2zj9v??6iqfn1s?tmcnnn7ofrvfhllqhhc8mlsc5vqpd0qg47aohunt9zp11dhtmznvn9g?968f7u19m4j485mnhuf?3dtu9?mvbvuhpt74vtnmo7h?20ai?f39z98icesf3z371mu94nl?sv861fa4qs39jc80v36zafu?3rl6ntdvnifzjlulf9fti12mo0ebzglfub?sm1imgjjvoe4zdsp8ln83jhif4nu5ui20pd2?3dorzmosfh3jrrmjs47588izto6b3rfhzjv6dr1opg8c46hzlqrboll?2lvbripfocjo07sdqf2a0eiqg2fcucr6duqur0fbz8sfvdt8bbbizt?a9vp4relsbzjlelazcsfea?r3hiv?6?91un9i6cp2i34f40zuf071f2ra2h5s7q115ocdqfg9bm4efjflspp58httln6r?np?sib9gvnij2ecpti02ah9sv0ihbq65o3eb22dmr?me11q11353pb05dc2bqma90i7aa6?esfv61?aro52dcfdvg8jr776i555h8lgnd0oh165di5jcb4ized1vt',
	UNIQUE(nomeComune),
    CHECK(esposizione='sole' OR esposizione='mezz ombra' OR esposizione='ombra' OR esposizione='sole mezz ombra' OR esposizione='mezz ombra sole'));

INSERT INTO Specie VALUES ('Mentha sp. pl.','Menta','mezz ombra');  
INSERT INTO Specie VALUES ('Lavandula sp. pl.','Lavanda','sole');
INSERT INTO Specie VALUES ('Triticum aestivum L.','Grano','sole');
INSERT INTO Specie VALUES ('Matricaria chamomilla L.','Camomilla','sole');
INSERT INTO Specie VALUES ('Olea europea L.','Ulivo','sole');
INSERT INTO Specie VALUES ('Calendula officinalis L.','Calendula','sole');


--CREAZIONE TABELLA SENSORI
CREATE TABLE Sensori
  (Id char(4) PRIMARY KEY,
  nome varchar(20) NOT null,
  arduino bool NOT null DEFAULT TRUE,
  orto varchar(40) NOT null REFERENCES Orti ON DELETE CASCADE ON UPDATE CASCADE);
  
  --Sensori scuola Giovanni Pascoli
    --Sensori orto Zeus 
    INSERT INTO Sensori VALUES ('A001','ArduinoMk2',TRUE,'43.821467681841426, 7.7883391180057835');
    INSERT INTO Sensori VALUES ('A002','GardenSensor_YC',FALSE,'43.821467681841426, 7.7883391180057835');
    --Sensori orto Era
    INSERT INTO Sensori VALUES ('S001','ArduinoMk2',TRUE,'43.821465759338054, 7.788317019014689');
    --Sensori orto Efesto
    INSERT INTO Sensori VALUES ('S002','ArduinoHY',TRUE,'43.821457534669086, 7.788340488343265');

  --Sensori scuola Barabino
    --Sensori orto Atena 
    INSERT INTO Sensori VALUES ('A003','Hi-Sensor',FALSE,'44.41070398325923, 8.895705130913584');
    --Sensori orto Poseidone
    INSERT INTO Sensori VALUES ('S003','GardenSensor_YC',FALSE,'44.41070398325750, 8.895705130913931');
    --Sensori orto Apollo 
    INSERT INTO Sensori VALUES ('S004','GreenThumbVaseSensor',FALSE,'44.41070398325518, 8.895705130913372');

  --Sensori scuola Orazio Grassi
    --Sensori orto Afrodite
    INSERT INTO Sensori VALUES ('A004','ArduinoHY',TRUE,'44.3158555669930, 8.477707710413529');


--CREAZIONE TABELLA PIANTE
CREATE TABLE Piante
  (nReplica numeric(2),
  gruppo char(4) REFERENCES Gruppi ON DELETE CASCADE ON UPDATE CASCADE,
  specieReplica varchar(60) REFERENCES Specie ON DELETE RESTRICT ON UPDATE RESTRICT NOT null,
  sensore char(4) REFERENCES Sensori ON DELETE RESTRICT ON UPDATE RESTRICT,
  data date NOT null DEFAULT current_date,
  esposizioneSpecifica varchar(20) NOT null,
  nome char(2) NOT null,
  scuola char(10) NOT null,
  ordine varchar(30) NOT null,
  anno numeric (4) NOT null,
  dummy char(1000) DEFAULT 'dp3v03ds4z1427gj0tflzs1mu99oso0pnha4dnd?6ozn82z?zlo3rt5pctadzob9qbhbe6f25pz5uieu29ht2954dtemzegbe6172fcnf6ergisurtpp?6081biv6vzbioehobcpo55bun4282zqadtbrol6?22?m6cossrod77o22jspmfj?ntg?a?9loub1aqits30zud8jdphjaf6l5ho04f561v03irb7h?frt28rt3lejour9jbta7zgc5hv41fasm6az2zid4joqf3807a9z34fh9b?1apc5vvn83eeuuzgrz0s12jpu5?t4ciqfluci5lzlmcdddsd2b54v4ab07g0b28i6hsqhupaazb2i5h29f2ohndpucqsl91rngmi02jrvizdllsob90t26emlmqf93fnjqaqfft3a045tl2zj9v??6iqfn1s?tmcnnn7ofrvfhllqhhc8mlsc5vqpd0qg47aohunt9zp11dhtmznvn9g?968f7u19m4j485mnhuf?3dtu9?mvbvuhpt74vtnmo7h?20ai?f39z98icesf3z371mu94nl?sv861fa4qs39jc80v36zafu?3rl6ntdvnifzjlulf9fti12mo0ebzglfub?sm1imgjjvoe4zdsp8ln83jhif4nu5ui20pd2?3dorzmosfh3jrrmjs47588izto6b3rfhzjv6dr1opg8c46hzlqrboll?2lvbripfocjo07sdqf2a0eiqg2fcucr6duqur0fbz8sfvdt8bbbizt?a9vp4relsbzjlelazcsfea?r3hiv?6?91un9i6cp2i34f40zuf071f2ra2h5s7q115ocdqfg9bm4efjflspp58httln6r?np?sib9gvnij2ecpti02ah9sv0ihbq65o3eb22dmr?me11q11353pb05dc2bqma90i7aa6?esfv61?aro52dcfdvg8jr776i555h8lgnd0oh165di5jcb4ized1vt',
  PRIMARY KEY(nReplica,gruppo),
  FOREIGN KEY(nome,scuola,ordine,anno) REFERENCES Classi (nome,scuola,ordine,anno) ON DELETE RESTRICT ON UPDATE CASCADE,
  CHECK(esposizioneSpecifica='sole' OR esposizioneSpecifica='mezz ombra' OR esposizioneSpecifica='ombra' OR esposizioneSpecifica='sole mezz ombra' OR esposizioneSpecifica='mezz ombra sole'),
  CHECK(nReplica>0));
  
--scuola Giovanni Pascoli  
--menta fitobonifica
INSERT INTO Piante VALUES (1,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);   
INSERT INTO Piante VALUES (2,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (3,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (4,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (5,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (6,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (7,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (8,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (9,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (10,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (11,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (12,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (13,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (14,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (15,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (16,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (17,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (18,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (19,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (20,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra','3A','IMMM81701G','agrario',2021);
--lavanda fitobonifica
INSERT INTO Piante VALUES (1,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (2,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (3,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (4,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (5,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (6,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (7,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (8,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (9,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (10,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (11,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (12,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (13,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (14,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (15,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (16,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (17,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (18,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (19,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (20,'1002','Lavandula sp. pl.','A002','01/09/21','sole','3A','IMMM81701G','agrario',2021);
--grano biomonitoraggio controllo
INSERT INTO Piante VALUES (1,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (2,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (3,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (4,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (5,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (6,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (7,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (8,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (9,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (10,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (11,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (12,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (13,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (14,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (15,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (16,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (17,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (18,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (19,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (20,'1003','Triticum aestivum L.','S001','30/09/21','sole','3B','IMMM81701G','agrario',2021);
--grano biomonitoraggio monitorato
INSERT INTO Piante VALUES (1,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (2,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (3,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (4,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (5,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (6,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (7,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (8,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (9,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (10,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (11,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (12,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (13,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (14,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (15,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (16,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (17,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (18,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (19,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
INSERT INTO Piante VALUES (20,'1004','Triticum aestivum L.','S002','30/09/21','sole','3B','IMMM81701G','agrario',2021);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Barabino
--menta fitobonifica
INSERT INTO Piante VALUES (1,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);   
INSERT INTO Piante VALUES (2,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (3,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (4,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (5,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (6,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (7,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (8,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (9,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (10,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (11,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (12,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (13,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (14,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (15,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (16,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (17,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (18,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (19,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (20,'2001','Mentha sp. pl.','A003','10/03/21','mezz ombra','3A','GEIC85200A','liceo scientifico',2021);
--camomilla fitobonifica
INSERT INTO Piante VALUES (1,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (2,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (3,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (4,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (5,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (6,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (7,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (8,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (9,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (10,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (11,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (12,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (13,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (14,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (15,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (16,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (17,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (18,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (19,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (20,'2002','Matricaria chamomilla L.','S003','10/10/21','sole','3A','GEIC85200A','liceo scientifico',2021);
--ulivo biomonitoraggio controllo (condiviso)
INSERT INTO Piante VALUES (1,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (2,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (3,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (4,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (5,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (6,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (7,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (8,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (9,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (10,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (11,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (12,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (13,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (14,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (15,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (16,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (17,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (18,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (19,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
INSERT INTO Piante VALUES (20,'2003','Olea europea L.','S004','30/03/21','sole','3A','GEIC85200A','liceo scientifico',2021);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Orazio Grassi
--menta fitobonifica
INSERT INTO Piante VALUES (1,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);   
INSERT INTO Piante VALUES (2,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (3,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (4,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (5,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (6,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (7,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (8,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (9,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (10,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (11,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (12,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (13,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (14,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (15,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (16,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (17,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (18,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (19,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (20,'3001','Mentha sp. pl.','A004','10/03/21','mezz ombra','3B','SVPS01000V','liceo scienze applicate',2021);
--calendula fitobonifica
INSERT INTO Piante VALUES (1,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (2,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (3,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (4,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (5,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (6,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (7,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (8,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (9,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (10,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (11,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (12,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (13,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (14,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (15,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (16,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (17,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (18,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (19,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (20,'3002','Calendula officinalis L.',null,'05/04/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
--ulivo biomonitoraggio monitorato (condiviso)
INSERT INTO Piante VALUES (1,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (2,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (3,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (4,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (5,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (6,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (7,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (8,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (9,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (10,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (11,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (12,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (13,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (14,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (15,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (16,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (17,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (18,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (19,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);
INSERT INTO Piante VALUES (20,'3003','Olea europea L.',null,'30/03/21','sole','3B','SVPS01000V','liceo scienze applicate',2021);


--CREAZIONE TABELLA RILEVAZIONI
CREATE TABLE Rilevazioni
  (dataOraRilevazione timestamp DEFAULT current_timestamp,
  nReplica numeric(2),
  gruppo char(4),
  dataOraInserimento timestamp DEFAULT current_timestamp NOT null,
  PS_pH numeric(4,2),	-- solo arduino
  PS_temperatura numeric(3,1) NOT null,
  PS_fertilità numeric(2), -- solo sensore normale 
  PS_umidità numeric(3) NOT null,
  PA_luminosità numeric(6) NOT null,
  PA_pressione numeric(4),	-- solo arduino
  ALT_nFrutti numeric(3) NOT null,
  ALT_nFiori numeric(3) NOT null,
  ALT_pesoFrescoRad numeric(3,1),
  ALT_pesoSeccoRad numeric(3,1),
  BS_lungChioma numeric(3,1) NOT null,
  BS_lungRadici numeric(3,1) NOT null,
  BS_lungFoglie numeric(3,1) NOT null, 
  BS_hPianta numeric(4,1) NOT null,
  BS_largChioma numeric(3,1) NOT null,
  BS_pesoSeccoChioma numeric(3,1),
  BS_pesoFrescoChioma numeric(3,1),
  PRIMARY KEY (dataOraRilevazione, nReplica, gruppo),
  FOREIGN KEY(gruppo,nReplica) REFERENCES Piante (gruppo,nReplica) ON DELETE CASCADE ON UPDATE CASCADE,
  CHECK (dataOraInserimento>=dataOraRilevazione),
  CHECK (ALT_nFrutti>=0 AND ALT_nFiori>=0 AND ALT_pesoFrescoRad>=0 AND ALT_pesoSeccoRad>=0 AND BS_lungChioma>=0 
		 AND BS_lungRadici>=0 AND BS_lungFoglie>=0 AND BS_hPianta>=0 AND BS_largChioma>=0 
		 AND BS_pesoSeccoChioma>=0 AND BS_pesoFrescoChioma>=0),
  CHECK (PS_pH=null OR PS_pH BETWEEN 0 AND 14));
-- peso in hg
-- lung, larg in cm

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- PRIMO GIRO RILEVAZIONI (TUTTE LE PIANTE)
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
--scuola Giovanni Pascoli  
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'1001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--lavanda fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'1002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--grano biomonitoraggio controllo arduino
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'1003','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--grano biomonitoraggio monitorato arduino
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'1004','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Barabino
--menta fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'2001','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--camomilla fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'2002','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--ulivo biomonitoraggio controllo (condiviso) sensore normale
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'2003','20/11/21 09:00',null,20.5,10,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Orazio Grassi
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'3001','20/11/21 09:00',4.7,20.5,null,30,94,247,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--calendula fitobonifica non ha sensori
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'3002','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
--ulivo biomonitoraggio monitorato (condiviso) non ha sensori
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',1,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',2,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',3,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',4,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',5,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',6,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',7,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',8,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',9,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',10,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',11,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',12,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',13,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',14,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',15,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',16,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',17,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',18,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',19,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
INSERT INTO Rilevazioni VALUES ('20/11/21 09:00',20,'3003','20/11/21 09:00',null,20.5,null,30,94,null,25,66,53.8,32.7,26.3,42.6,37.1,46.3,36.2,36.3,54.1);
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- SECONDO GIRO RILEVAZIONI (TUTTE LE PIANTE)
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
--scuola Giovanni Pascoli  
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'1001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--lavanda fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'1002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--grano biomonitoraggio controllo arduino
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'1003','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--grano biomonitoraggio monitorato arduino
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'1004','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Barabino
--menta fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'2001','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--camomilla fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'2002','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--ulivo biomonitoraggio controllo (condiviso) sensore normale
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'2003','20/12/21 09:00',null,18.3,8,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Orazio Grassi
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'3001','20/12/21 09:00',5.3,18.3,null,20,50,200,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--calendula fitobonifica non ha sensori
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'3002','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
--ulivo biomonitoraggio monitorato (condiviso) non ha sensori
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',1,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',2,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',3,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',4,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',5,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',6,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',7,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',8,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',9,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',10,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',11,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',12,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',13,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',14,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',15,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',16,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',17,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',18,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',19,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
INSERT INTO Rilevazioni VALUES ('20/12/21 09:00',20,'3003','20/12/21 09:00',null,18.3,null,20,50,null,10,5,60.9,45.2,32.8,60.5,43.9,60.6,52.1,53.2,74.8);
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- TERZO GIRO RILEVAZIONI (TUTTE LE PIANTE)
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
--scuola Giovanni Pascoli  
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'1001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--lavanda fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'1002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--grano biomonitoraggio controllo arduino
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'1003','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--grano biomonitoraggio monitorato arduino
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'1004','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Barabino
--menta fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'2001','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--camomilla fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'2002','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--ulivo biomonitoraggio controllo (condiviso) sensore normale
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'2003','20/01/22 09:00',null,20.4,9,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Orazio Grassi
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'3001','20/01/22 09:00',6.2,20.4,null,40,80,400,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--calendula fitobonifica non ha sensori
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'3002','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
--ulivo biomonitoraggio monitorato (condiviso) non ha sensori
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',1,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',2,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',3,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',4,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',5,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',6,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',7,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',8,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',9,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',10,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',11,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',12,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',13,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',14,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',15,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',16,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',17,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',18,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',19,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
INSERT INTO Rilevazioni VALUES ('20/01/22 09:00',20,'3003','20/01/22 09:00',null,20.4,null,40,80,null,5,2,49.7,38.6,50.3,76.2,51.1,72.3,69.4,70.3,86.1);
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- QUARTO GIRO RILEVAZIONI ANNO CORRENTE (LA SCUOLA CHE RICEVE IL FINANZIAMENTO NON FA RILEVAZIONI)
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
--scuola Giovanni Pascoli  
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',1,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',2,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',3,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',4,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',5,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',6,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',7,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',8,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',9,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',10,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',11,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',12,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',13,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',14,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',15,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',16,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',17,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',18,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',19,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',20,'1001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
--lavanda fitobonifica sensore normale
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',1,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',2,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',3,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',4,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',5,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',6,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',7,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',8,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',9,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',10,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',11,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',12,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',13,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',14,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',15,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',16,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',17,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',18,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',19,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',20,'1002','20/01/23 09:00',null,18.6,7,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
--grano biomonitoraggio controllo arduino
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',1,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',2,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',3,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',4,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',5,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',6,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',7,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',8,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',9,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',10,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',11,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',12,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',13,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',14,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',15,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',16,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',17,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',18,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',19,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',20,'1003','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
--grano biomonitoraggio monitorato arduino
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',1,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',2,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',3,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',4,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',5,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',6,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',7,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',8,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',9,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',10,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',11,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',12,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',13,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',14,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',15,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',16,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',17,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',18,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',19,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',20,'1004','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--scuola Orazio Grassi
--menta fitobonifica arduino
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',1,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',2,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',3,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',4,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',5,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',6,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',7,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',8,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',9,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',10,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',11,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',12,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',13,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',14,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',15,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',16,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',17,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',18,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',19,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',20,'3001','20/01/23 09:00',7.5,18.6,null,40,72,500,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
--calendula fitobonifica non ha sensori
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',1,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',2,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',3,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',4,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',5,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',6,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',7,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',8,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',9,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',10,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',11,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',12,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',13,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',14,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',15,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',16,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',17,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',18,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',19,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',20,'3002','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
--ulivo biomonitoraggio monitorato (condiviso) non ha sensori
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',1,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',2,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',3,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',4,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',5,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',6,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',7,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',8,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',9,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',10,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',11,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',12,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',13,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',14,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',15,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',16,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',17,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',18,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',19,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);
INSERT INTO Rilevazioni VALUES ('20/01/23 09:00',20,'3003','20/01/23 09:00',null,18.6,null,40,72,null,4,1,84.6,51.6,74.3,94.2,71.1,85.7,98.3,82.5,98.6);


--CREAZIONE TABELLA DANNI FOLGIA
CREATE TABLE danniFoglia
  (nFoglia numeric(3),
   dataOraRilevazione timestamp,
   nReplica numeric(2),
   gruppo char(4) ,
   percDanni numeric(3) NOT null,
   PRIMARY KEY (nFoglia,dataOraRilevazione, nReplica, gruppo),
   FOREIGN KEY(gruppo,nReplica,dataOraRilevazione) REFERENCES Rilevazioni(gruppo,nReplica,dataOraRilevazione) ON DELETE CASCADE ON UPDATE CASCADE,
   CHECK (nFoglia>0),
   CHECK (percDanni BETWEEN 0 AND 100));

--rilevazioni del 20/11/21 09:00
--gruppo 1001
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'1001',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'1001',10);
--gruppo 1002
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'1002',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'1002',10);
--gruppo 1003
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'1003',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'1003',10);
--gruppo 1004
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'1004',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'1004',10);
--gruppo 2001
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'2001',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'2001',10);
--gruppo 2002
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'2002',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'2002',10);
--gruppo 2003
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'2003',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'2003',10);
--gruppo 3001
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'3001',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'3001',10);
--gruppo 3002
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'3002',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'3002',10);
--gruppo 3003
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',2,'3003',20);
INSERT INTO danniFoglia VALUES (1,'20/11/21 09:00',5,'3003',10);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--rilevazioni del 20/12/21 09:00
--gruppo 1001
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'1001',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'1001',5);
--gruppo 1002
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'1002',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'1002',5);
--gruppo 1003
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'1003',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'1003',5);
--gruppo 1004
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'1004',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'1004',5);
--gruppo 2001
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'2001',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'2001',5);
--gruppo 2002
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'2002',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'2002',5);
--gruppo 2003
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'2003',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'2003',5);
--gruppo 3001
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'3001',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'3001',5);
--gruppo 3002
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'3002',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'3002',5);
--gruppo 3003
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',14,'3003',15);
INSERT INTO danniFoglia VALUES (1,'20/12/21 09:00',7,'3003',5);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--rilevazioni del 20/01/22 09:00
--gruppo 1001
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'1001',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'1001',30);
--gruppo 1002
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'1002',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'1002',30);
--gruppo 1003
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'1003',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'1003',30);
--gruppo 1004
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'1004',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'1004',30);
--gruppo 2001
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'2001',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'2001',30);
--gruppo 2002
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'2002',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'2002',30);
--gruppo 2003
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'2003',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'2003',30);
--gruppo 3001
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'3001',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'3001',30);
--gruppo 3002
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'3002',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'3002',30);
--gruppo 3003
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',9,'3003',25);
INSERT INTO danniFoglia VALUES (1,'20/01/22 09:00',7,'3003',30);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--rilevazioni del 20/01/23 09:00
--gruppo 1001
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',19,'1001',16);
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',7,'1001',27);
--gruppo 1002
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',19,'1002',16);
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',7,'1002',27);
--gruppo 1003
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',19,'1003',16);
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',7,'1003',27);
--gruppo 1004
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',19,'1004',16);
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',7,'1004',27);
--gruppo 3001
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',19,'3001',16);
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',7,'3001',27);
--gruppo 3002
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',19,'3002',16);
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',7,'3002',27);
--gruppo 3003
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',19,'3003',16);
INSERT INTO danniFoglia VALUES (1,'20/01/23 09:00',7,'3003',27);


--CREAZIONE TABELLA RESPONSABILI
CREATE TABLE Responsabili
  (persona varchar(45) REFERENCES Persone ON DELETE CASCADE ON UPDATE CASCADE NOT null, 
   dataOraRilevazione timestamp NOT null,
   nReplica numeric(2) NOT null,
   gruppo char(4) NOT null,
   classe bool NOT null DEFAULT FALSE,
   inserimento varchar(30) NOT null DEFAULT 'inserimento/rilevazione',
   PRIMARY KEY (persona, dataOraRilevazione, nReplica, gruppo, classe),
   FOREIGN KEY(gruppo,nReplica,dataOraRilevazione) REFERENCES Rilevazioni(gruppo,nReplica,dataOraRilevazione) ON DELETE RESTRICT ON UPDATE CASCADE);

--rilevazioni del 20/11/21 09:00 
--gruppo 1001
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',1,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',2,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',3,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',4,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',5,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',6,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',7,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',8,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',9,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',10,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',11,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',12,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',13,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',14,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',15,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',16,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',17,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',18,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',19,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',20,'1001');
--Prova mario rossi referente classe responsabile rilevazione
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','2021-11-20 09:00:00',1,'1001',TRUE);
--gruppo 1002
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',1,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',2,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',3,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',4,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',5,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',6,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',7,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',8,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',9,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',10,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',11,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',12,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',13,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',14,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',15,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',16,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',17,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',18,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',19,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/11/21 09:00',20,'1002',TRUE);
--gruppo 1003
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',1,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',2,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',3,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',4,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',5,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',6,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',7,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',8,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',9,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',10,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',11,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',12,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',13,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',14,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',15,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',16,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',17,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',18,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',19,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',20,'1003');
--gruppo 1004
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',1,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',2,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',3,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',4,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',5,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',6,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',7,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',8,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',9,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',10,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',11,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',12,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',13,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',14,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',15,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',16,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',17,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',18,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',19,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/11/21 09:00',20,'1004');
--gruppo 2001
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',1,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',2,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',3,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',4,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',5,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',6,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',7,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',8,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',9,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',10,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',11,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',12,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',13,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',14,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',15,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',16,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',17,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',18,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',19,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',20,'2001');
--gruppo 2002
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',1,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',2,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',3,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',4,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',5,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',6,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',7,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',8,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',9,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',10,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',11,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',12,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',13,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',14,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',15,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',16,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',17,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',18,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',19,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',20,'2002');
--gruppo 2003
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',1,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',2,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',3,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',4,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',5,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',6,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',7,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',8,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',9,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',10,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',11,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',12,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',13,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',14,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',15,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',16,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',17,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',18,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',19,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/11/21 09:00',20,'2003');
--gruppo 3001
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',1,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',2,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',3,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',4,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',5,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',6,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',7,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',8,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',9,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',10,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',11,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',12,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',13,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',14,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',15,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',16,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',17,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',18,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',19,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',20,3001);
--gruppo 3002
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',1,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',2,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',3,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',4,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',5,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',6,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',7,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',8,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',9,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',10,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',11,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',12,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',13,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',14,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',15,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',16,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',17,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',18,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',19,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',20,3002,TRUE);
--gruppo 3003
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',1,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',2,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',3,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',4,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',5,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',6,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',7,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',8,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',9,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',10,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',11,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',12,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',13,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',14,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',15,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',16,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',17,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',18,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',19,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/11/21 09:00',20,3003,TRUE);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--rilevazioni del 20/12/21 09:00 
--gruppo 1001
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',1,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',2,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',3,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',4,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',5,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',6,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',7,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',8,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',9,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',10,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',11,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',12,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',13,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',14,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',15,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',16,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',17,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',18,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',19,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',20,'1001');
--gruppo 1002
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',1,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',2,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',3,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',4,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',5,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',6,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',7,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',8,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',9,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',10,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',11,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',12,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',13,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',14,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',15,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',16,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',17,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',18,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',19,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/12/21 09:00',20,'1002',TRUE);
--gruppo 1003
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',1,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',2,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',3,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',4,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',5,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',6,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',7,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',8,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',9,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',10,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',11,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',12,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',13,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',14,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',15,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',16,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',17,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',18,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',19,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',20,'1003');
--gruppo 1004
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',1,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',2,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',3,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',4,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',5,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',6,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',7,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',8,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',9,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',10,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',11,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',12,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',13,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',14,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',15,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',16,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',17,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',18,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',19,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/12/21 09:00',20,'1004');
--gruppo 2001
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',1,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',2,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',3,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',4,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',5,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',6,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',7,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',8,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',9,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',10,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',11,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',12,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',13,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',14,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',15,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',16,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',17,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',18,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',19,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',20,'2001');
--gruppo 2002
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',1,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',2,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',3,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',4,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',5,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',6,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',7,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',8,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',9,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',10,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',11,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',12,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',13,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',14,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',15,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',16,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',17,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',18,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',19,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',20,'2002');
--gruppo 2003
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',1,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',2,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',3,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',4,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',5,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',6,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',7,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',8,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',9,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',10,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',11,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',12,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',13,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',14,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',15,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',16,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',17,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',18,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',19,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/12/21 09:00',20,'2003');
--gruppo 3001
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',1,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',2,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',3,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',4,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',5,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',6,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',7,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',8,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',9,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',10,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',11,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',12,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',13,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',14,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',15,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',16,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',17,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',18,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',19,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',20,3001);
--gruppo 3002
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',1,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',2,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',3,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',4,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',5,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',6,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',7,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',8,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',9,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',10,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',11,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',12,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',13,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',14,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',15,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',16,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',17,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',18,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',19,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',20,3002,TRUE);
--gruppo 3003
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',1,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',2,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',3,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',4,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',5,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',6,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',7,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',8,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',9,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',10,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',11,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',12,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',13,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',14,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',15,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',16,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',17,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',18,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',19,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/12/21 09:00',20,3003,TRUE);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--rilevazioni del 20/01/22 09:00 
--gruppo 1001
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',1,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',2,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',3,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',4,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',5,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',6,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',7,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',8,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',9,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',10,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',11,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',12,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',13,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',14,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',15,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',16,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',17,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',18,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',19,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',20,'1001');
--gruppo 1002
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',1,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',2,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',3,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',4,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',5,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',6,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',7,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',8,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',9,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',10,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',11,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',12,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',13,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',14,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',15,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',16,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',17,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',18,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',19,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/22 09:00',20,'1002',TRUE);
--gruppo 1003
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',1,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',2,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',3,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',4,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',5,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',6,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',7,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',8,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',9,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',10,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',11,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',12,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',13,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',14,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',15,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',16,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',17,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',18,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',19,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',20,'1003');
--gruppo 1004
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',1,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',2,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',3,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',4,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',5,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',6,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',7,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',8,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',9,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',10,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',11,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',12,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',13,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',14,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',15,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',16,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',17,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',18,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',19,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/22 09:00',20,'1004');
--gruppo 2001
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',1,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',2,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',3,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',4,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',5,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',6,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',7,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',8,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',9,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',10,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',11,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',12,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',13,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',14,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',15,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',16,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',17,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',18,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',19,'2001');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',20,'2001');
--gruppo 2002
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',1,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',2,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',3,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',4,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',5,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',6,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',7,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',8,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',9,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',10,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',11,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',12,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',13,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',14,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',15,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',16,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',17,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',18,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',19,'2002');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',20,'2002');
--gruppo 2003
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',1,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',2,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',3,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',4,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',5,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',6,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',7,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',8,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',9,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',10,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',11,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',12,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',13,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',14,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',15,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',16,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',17,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',18,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',19,'2003');
INSERT INTO Responsabili VALUES ('rossiclaudia@gmail.it','20/01/22 09:00',20,'2003');
--gruppo 3001
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',1,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',2,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',3,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',4,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',5,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',6,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',7,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',8,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',9,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',10,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',11,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',12,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',13,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',14,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',15,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',16,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',17,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',18,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',19,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',20,3001);
--gruppo 3002
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',1,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',2,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',3,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',4,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',5,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',6,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',7,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',8,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',9,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',10,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',11,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',12,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',13,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',14,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',15,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',16,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',17,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',18,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',19,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',20,3002,TRUE);
--gruppo 3003
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',1,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',2,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',3,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',4,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',5,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',6,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',7,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',8,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',9,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',10,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',11,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',12,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',13,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',14,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',15,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',16,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',17,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',18,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',19,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/22 09:00',20,3003,TRUE);
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--rilevazioni del 20/01/23 09:00 
--gruppo 1001
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',1,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',2,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',3,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',4,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',5,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',6,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',7,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',8,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',9,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',10,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',11,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',12,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',13,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',14,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',15,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',16,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',17,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',18,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',19,'1001');
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',20,'1001');
--gruppo 1002
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',1,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',2,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',3,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',4,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',5,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',6,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',7,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',8,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',9,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',10,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',11,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',12,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',13,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',14,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',15,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',16,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',17,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',18,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',19,'1002',TRUE);
INSERT INTO Responsabili VALUES ('mariorossi@libero.it','20/01/23 09:00',20,'1002',TRUE);
--gruppo 1003
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',1,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',2,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',3,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',4,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',5,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',6,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',7,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',8,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',9,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',10,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',11,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',12,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',13,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',14,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',15,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',16,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',17,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',18,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',19,'1003');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',20,'1003');
--gruppo 1004
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',1,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',2,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',3,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',4,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',5,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',6,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',7,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',8,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',9,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',10,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',11,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',12,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',13,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',14,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',15,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',16,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',17,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',18,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',19,'1004');
INSERT INTO Responsabili VALUES ('giovannaguerrini@libero.it','20/01/23 09:00',20,'1004');
--gruppo 3001
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',1,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',2,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',3,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',4,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',5,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',6,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',7,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',8,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',9,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',10,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',11,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',12,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',13,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',14,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',15,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',16,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',17,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',18,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',19,3001);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',20,3001);
--gruppo 3002
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',1,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',2,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',3,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',4,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',5,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',6,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',7,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',8,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',9,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',10,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',11,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',12,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',13,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',14,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',15,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',16,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',17,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',18,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',19,3002,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',20,3002,TRUE);
--gruppo 3003
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',1,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',2,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',3,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',4,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',5,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',6,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',7,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',8,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',9,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',10,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',11,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',12,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',13,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',14,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',15,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',16,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',17,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',18,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',19,3003,TRUE);
INSERT INTO Responsabili VALUES ('paoloparodi@gmail.it','20/01/23 09:00',20,3003,TRUE);


--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*


-------------------------------------------------------------------------------------------------------------------
---------------------------------------------------INTERROGAZIONI--------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
set search_path to OrtoUrbano;


--determinare le scuole che, pur avendo un finanziamento per il progetto, non hanno inserito
--rilevazioni in questo anno scolastico;
SELECT CM,nome
FROM Scuole
WHERE tipoFinanziamento IS NOT null
AND CM NOT IN  (SELECT CM
				FROM Scuole
				JOIN Orti ON sede=CM
				JOIN Gruppi ON appartenenza=GPS
				JOIN Rilevazioni ON Gruppi.Id=Gruppo
			    AND EXTRACT('Year' FROM dataOraInserimento) = EXTRACT('year'FROM current_date));


--determinare le specie utilizzate in tutti i comuni in cui ci sono scuole aderenti al progetto;
SELECT SpecieReplica 
FROM Piante 
JOIN Gruppi ON gruppo=id
JOIN Orti ON appartenenza=gps
JOIN Scuole ON sede=CM 
GROUP BY SpecieReplica
HAVING COUNT(DISTINCT provincia) = (SELECT COUNT(DISTINCT provincia)
								    FROM scuole);


--determinare per ogni scuola l’individuo/la classe della scuola che ha effettuato più rilevazioni.
SELECT DISTINCT s.nome AS Scuola,persona as Responsabile, COUNT(*) AS numero_rilevazioni, CASE WHEN classe=true THEN classi.nome ELSE '    ' END AS Classe_responsabile
FROM Scuole S
JOIN Persone ON lavora=CM
JOIN Responsabili ON persona=mail
JOIN Classi ON Classi.scuola=S.CM
WHERE docenteRiferimento=persona
GROUP BY Cm,classe, responsabili.persona,classi.nome
HAVING count(*) >= ALL (SELECT COUNT(*)
						FROM Scuole 
						JOIN Persone ON lavora=CM
						JOIN Responsabili ON persona=mail
						JOIN Classi ON Classi.scuola=scuole.CM
						GROUP BY CM,persona,classe,classi.nome
						HAVING S.cm=scuole.cm);


-------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------VISTA------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------


--La definizione di una vista che fornisca alcune informazioni riassuntive per ogni attività di biomonitoraggio: per
--ogni gruppo e per il corrispondente gruppo di controllo mostrare il numero di piante, la specie, l’orto in cui è posizionato il gruppo e, su base mensile, 
--il valore medio dei parametri ambientali e di crescita delle piante (selezionare almeno tre parametri, quelli che si ritengono più significativi).


-- vista che ritorna i parametri ambientali
CREATE VIEW parametriAmbientali AS  
SELECT gruppo, TRUNC(AVG(PS_temperatura),2) AS temperatura,TRUNC(AVG(PS_umidità),2) AS umidità,TRUNC(AVG(BS_pesoFrescoChioma),2) AS peso_fresco_chioma, EXTRACT('Month' FROM dataOraRilevazione) AS mese,  EXTRACT('Year' FROM dataOraRilevazione) AS anno
FROM Rilevazioni
GROUP BY Rilevazioni.gruppo, EXTRACT('Year' FROM dataOraRilevazione), EXTRACT('Month' FROM dataOraRilevazione), PS_temperatura,PS_umidità,BS_pesoFrescoChioma,dataOraRilevazione
ORDER BY gruppo, mese;

--vista che ritorna i dati relativi al gruppo Stress
CREATE VIEW rendiconto_Stress AS
SELECT Gruppi.id,Orti.nome,count(Piante) AS PianteS,Piante.specieReplica
FROM Gruppi
JOIN Orti 
ON GPS=appartenenza
AND ruolo_biomonitoraggio='monitorato'
JOIN Piante 
ON gruppo=id
GROUP BY Gruppi.id,Orti.nome,Piante.specieReplica;

--vista che ritorna i dati relativi al gruppo controllo
CREATE VIEW rendiconto_Controllo AS
SELECT Gruppi.id,Orti.nome,count(Piante),Piante.specieReplica
FROM Gruppi
JOIN Orti 
ON GPS=appartenenza
AND ruolo_biomonitoraggio='controllo'
JOIN Piante 
ON gruppo=id
GROUP BY Gruppi.id,Orti.nome,Piante.specieReplica;

--vista riassuntiva per ogni attività di biomonitoraggio
CREATE VIEW Rendiconto_biomonitoraggio AS
SELECT DISTINCT S.id AS ID_Stress, S.nome AS Nome_Orto_Stress, Co.id AS ID_Controllo,  Co.nome AS Nome_Orto_Controllo, S.PianteS AS Numero_Repliche, S.specieReplica AS Specie, stress.mese , stress.anno ,
stress.temperatura AS temperaturaMediaStress,controllo.temperatura AS temperaturaMediaControllo,stress.umidità AS umiditàMediaStress,controllo.umidità AS umiditàMediaControllo,stress.peso_fresco_chioma AS peso_fresco_chiomaMedioStress ,controllo.peso_fresco_chioma AS peso_fresco_chiomaMedioControllo
FROM rendiconto_Stress  S, rendiconto_Controllo  Co, parametriAmbientali stress, parametriAmbientali controllo, Gruppi GS
WHERE stress.gruppo=S.id
AND controllo.gruppo=Co.id
AND stress.anno = controllo.anno
AND stress.mese = controllo.mese
AND S.id=GS.id
AND Co.id=GS.corrispettivo;

--visualizzazione della vista
SELECT *
FROM Rendiconto_biomonitoraggio;


-------------------------------------------------------------------------------------------------------------------
---------------------------------------------------PROCEDURE/FUNZIONI----------------------------------------------
-------------------------------------------------------------------------------------------------------------------


--funzione che realizza l’abbinamento tra gruppo e gruppo di controllo nel caso di operazioni di bio-monitoraggio;
CREATE FUNCTION
Associazione_gruppo
(
IN Gruppo char(4),
OUT GruppoControllo char(4)
) 
AS 
$$
BEGIN
GruppoControllo := (SELECT corrispettivo
					FROM gruppi
					WHERE id = Gruppo);
END;
$$ LANGUAGE plpgsql;


--funzione che corrisponde alla seguente query parametrica: data una replica con finalità di fitobonifica e due date, 
--determina i valori medi dei parametri rilevati per tale replica nel periodo compreso tra le due date.
CREATE OR REPLACE FUNCTION
AvgParamFitobonifica 
(
IN nRep numeric(2), gRep char(4), dataInizio date, datafine date,
OUT  AVG_pH numeric(4,2),
OUT  AVG_temperatura numeric(3,1),
OUT  AVG_fertilità numeric(2),
OUT  AVG_umidità numeric(3),
OUT  AVG_luminosità numeric(6),
OUT  AVG_pressione numeric(4),
OUT  AVG_nFrutti numeric(3),
OUT  AVG_nFiori numeric(3) ,
OUT  AVG_pesoFrescoRad numeric(3,1),
OUT  AVG_pesoSeccoRad numeric(3,1),
OUT  AVG_lungChioma numeric(3,1) ,
OUT  AVG_lungRadici numeric(3,1),
OUT  AVG_lungFoglie numeric(3,1) , 
OUT  AVG_hPianta numeric(4,1),
OUT  AVG_largChioma numeric(3,1),
OUT  AVG_pesoSeccoChioma numeric(3,1),
OUT  AVG_pesoFrescoChioma numeric(3,1)
) 
AS 
$$
DECLARE
Scopo_orto varchar(15);
BEGIN

Scopo_orto := (SELECT scopo 
			   FROM Orti 
			   JOIN Gruppi 
			   ON Appartenenza = GPS
			   WHERE id = gRep);
IF Scopo_orto != 'fitobonifica'
THEN
RAISE EXCEPTION 'Attenzione la replica inserita non ha finalità di fitobonifica';
ELSE


AVG_pH :=	(SELECT AVG(PS_pH) 
			FROM Rilevazioni 
			WHERE nRep = nReplica
			AND gRep = gruppo
			AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_temperatura :=	(SELECT AVG(PS_temperatura)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_fertilità :=	(SELECT AVG(PS_fertilità)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_umidità	 :=	   (SELECT AVG(PS_umidità)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_luminosità	 :=	   (SELECT AVG(PA_luminosità)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_pressione	 :=	   (SELECT AVG(PA_pressione)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_nFrutti	 :=	   (SELECT AVG(ALT_nFrutti)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_nFiori	 :=	   (SELECT AVG(ALT_nFiori)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_pesoFrescoRad	 :=	   (SELECT AVG(ALT_pesoFrescoRad)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_pesoSeccoRad	 :=	   (SELECT AVG(ALT_pesoSeccoRad)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_lungChioma	 :=	   (SELECT AVG(BS_lungChioma)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_lungRadici	 :=	   (SELECT AVG(BS_lungRadici)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_lungFoglie	 :=	   (SELECT AVG(BS_lungFoglie)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_hPianta	 :=	   (SELECT AVG(BS_hPianta)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_largChioma	 :=	   (SELECT AVG(BS_largChioma)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_pesoSeccoChioma	 :=	   (SELECT AVG(BS_pesoSeccoChioma)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

AVG_pesoFrescoChioma	 :=	   (SELECT AVG(BS_pesoFrescoChioma)
					FROM Rilevazioni 
					WHERE nRep = nReplica
					AND gRep = gruppo
					AND dataOraRilevazione BETWEEN dataInizio AND datafine);

END IF;
END;
$$ LANGUAGE plpgsql;

SELECT AvgParamFitobonifica (1,'1001','2021-10-01','2022-10-01')


-----------------------------------------------------------------------------------------------------------------
---------------------------------------------------TRIGGER-------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--verifica del vincolo che ogni scuola dovrebbe concentrarsi su tre specie e ogni gruppo dovrebbe contenere 20 repliche;
     --(Dovrebbe -> non oblligatorio nel caso il vincolo non venga rispettato non faccio una rollback ma raiso un messaggio)

CREATE FUNCTION vincola_insert()
RETURNS trigger AS 
$$
DECLARE
nSpecie numeric (2);
nRepliche numeric (3);

BEGIN
nSpecie := (SELECT COUNT ( DISTINCT specieReplica)
			FROM Piante 
			JOIN Gruppi
			ON gruppo = id
			JOIN Orti 
			ON appartenenza = gps
			JOIN Scuole 
			ON sede = cm
			WHERE cm = (SELECT DISTINCT cm
					FROM Piante 
					JOIN Gruppi
					ON gruppo = id
					JOIN Orti 
					ON appartenenza = gps
					JOIN Scuole 
					ON sede = cm
					WHERE new.gruppo = gruppo));

nRepliche := (SELECT COUNT (*)
			 FROM Piante 
			 JOIN Gruppi
			 ON gruppo = id
			 WHERE new.gruppo = gruppo);


IF nSpecie > 3
THEN
RAISE NOTICE 'Ogni scuola dovrebbe concentrarsi su tre specie ';
END IF;
IF nRepliche > 20
THEN
RAISE NOTICE 'Ogni gruppo dovrebbe contenere 20 repliche ';
END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;

INSERT INTO Piante VALUES (21,'1001','Olea europea L.','A001','10/03/21','mezz ombra'); 
DELETE FROM Piante  WHERE Nreplica=21;
INSERT INTO Piante VALUES (21,'1001','Mentha sp. pl.','A001','10/03/21','mezz ombra');   


--generazione di un messaggio (o inserimento di una informazione di warning in qualche tabella) quando viene rilevato un valore decrescente per un parametro di biomassa.
CREATE FUNCTION messaggioErrore()
RETURNS trigger AS 
$$
BEGIN

IF (new.BS_lungChioma > ANY (SELECT BS_lungChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione < dataOraRilevazione) 
	OR new.BS_lungChioma < ANY (SELECT BS_lungChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione > dataOraRilevazione)
	)
THEN
RAISE EXCEPTION 'Attenzione, Stai inserendo un valore per il parametro di biomassa: lunghezza chioma, che è inferiore alle rilevazioni precedenti o superiore a quelle sucessive';
END IF;

IF (new.BS_lungRadici > ANY (SELECT BS_lungRadici
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione < dataOraRilevazione) 
	OR new.BS_lungRadici < ANY (SELECT BS_lungRadici
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione > dataOraRilevazione)
	)
THEN
RAISE EXCEPTION 'Attenzione, Stai inserendo un valore per il parametro di biomassa: lunghezza radici, che è inferiore alle rilevazioni precedenti o superiore a quelle sucessive';
END IF;

IF (new.BS_lungFoglie > ANY (SELECT BS_lungFoglie
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione < dataOraRilevazione) 
	OR new.BS_lungFoglie < ANY (SELECT BS_lungFoglie
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione > dataOraRilevazione)
	)
THEN
RAISE EXCEPTION 'Attenzione, Stai inserendo un valore per il parametro di biomassa: lunghezza foglie, che è inferiore alle rilevazioni precedenti o superiore a quelle sucessive';
END IF;

IF (new.BS_hPianta > ANY (SELECT BS_hPianta
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione < dataOraRilevazione) 
	OR new.BS_hPianta < ANY (SELECT BS_hPianta
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione > dataOraRilevazione)
	)
THEN
RAISE EXCEPTION 'Attenzione, Stai inserendo un valore per il parametro di biomassa: altezza pianta, che è inferiore alle rilevazioni precedenti o superiore a quelle sucessive';
END IF;

IF (new.BS_largChioma > ANY (SELECT BS_largChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione < dataOraRilevazione) 
	OR new.BS_largChioma < ANY (SELECT BS_largChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione > dataOraRilevazione)
	)
THEN
RAISE EXCEPTION 'Attenzione, Stai inserendo un valore per il parametro di biomassa: larghezza chioma, che è inferiore alle rilevazioni precedenti o superiore a quelle sucessive';
END IF;

IF (new.BS_pesoSeccoChioma > ANY (SELECT BS_pesoSeccoChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione < dataOraRilevazione) 
	OR new.BS_pesoSeccoChioma < ANY (SELECT BS_pesoSeccoChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione > dataOraRilevazione)
	)
THEN
RAISE EXCEPTION 'Attenzione, Stai inserendo un valore per il parametro di biomassa: peso secco chioma, che è inferiore alle rilevazioni precedenti o superiore a quelle sucessive';
END IF;

IF (new.BS_pesoFrescoChioma > ANY (SELECT BS_pesoFrescoChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione < dataOraRilevazione) 
	OR new.BS_pesoFrescoChioma < ANY (SELECT BS_pesoFrescoChioma
						FROM Rilevazioni 
						WHERE nReplica = new.nReplica
						AND gruppo = new.gruppo
						AND new.dataOraRilevazione > dataOraRilevazione)
	)
THEN
RAISE EXCEPTION 'Attenzione, Stai inserendo un valore per il parametro di biomassa: peso fresco chioma, che è inferiore alle rilevazioni precedenti o superiore a quelle sucessive';
END IF;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER biomassa_decrescente BEFORE INSERT OR UPDATE ON Rilevazioni
FOR EACH ROW
EXECUTE FUNCTION messaggioErrore();