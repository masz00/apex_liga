 CREATE TABLE "KLUB" 
   (	"KLUBID" NUMBER(*,0), 
	"NAZWA" VARCHAR2(50) NOT NULL ENABLE, 
	"ADRES" VARCHAR2(100) NOT NULL ENABLE, 
	"LIGAID" NUMBER(*,0) NOT NULL ENABLE, 
	"TRENERID" NUMBER(*,0) NOT NULL ENABLE, 
	"STADIONID" NUMBER(*,0) NOT NULL ENABLE, 
	"DATAZAL" DATE NOT NULL ENABLE, 
	 PRIMARY KEY ("KLUBID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "LIGA" 
   (	"LIGAID" NUMBER(*,0), 
	"NAZWALIGI" VARCHAR2(50) NOT NULL ENABLE, 
	"KRAJ" VARCHAR2(20) NOT NULL ENABLE, 
	"SEZON" VARCHAR2(50) NOT NULL ENABLE, 
	 PRIMARY KEY ("LIGAID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "MECZ" 
   (	"MECZID" NUMBER(*,0), 
	"KLUBGOSPID" NUMBER(*,0) NOT NULL ENABLE, 
	"KLUBGOSCID" NUMBER(*,0) NOT NULL ENABLE, 
	"SEDZIAGLOWNYID" NUMBER(*,0) NOT NULL ENABLE, 
	"SEDZIAAS1ID" NUMBER(*,0) NOT NULL ENABLE, 
	"SEDZIAAS2ID" NUMBER(*,0) NOT NULL ENABLE, 
	"DATAMECZU" DATE NOT NULL ENABLE, 
	"WYNIKKONCOWY" VARCHAR2(10) NOT NULL ENABLE, 
	"NRKOLEJKI" NUMBER(*,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("MECZID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SEDZIA" 
   (	"SEDZIAID" NUMBER(*,0), 
	"IMIE" VARCHAR2(50) NOT NULL ENABLE, 
	"NAZWISKO" VARCHAR2(50) NOT NULL ENABLE, 
	"KRAJ" VARCHAR2(20) NOT NULL ENABLE, 
	"POZIOM" VARCHAR2(20) NOT NULL ENABLE, 
	 PRIMARY KEY ("SEDZIAID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SKLADMECZOWY" 
   (	"SKLADMECZOWYID" NUMBER(*,0), 
	"ZAWODNIKID" NUMBER(*,0) NOT NULL ENABLE, 
	"MECZID" NUMBER(*,0) NOT NULL ENABLE, 
	"ROLAWSKLADZIE" VARCHAR2(20) NOT NULL ENABLE, 
	 PRIMARY KEY ("SKLADMECZOWYID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "STADION" 
   (	"STADIONID" NUMBER(*,0), 
	"NAZWA" VARCHAR2(50) NOT NULL ENABLE, 
	"ADRES" VARCHAR2(50) NOT NULL ENABLE, 
	"POJEMNOSC" NUMBER(*,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("STADIONID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "TRENER" 
   (	"TRENERID" NUMBER(*,0), 
	"IMIE" VARCHAR2(50) NOT NULL ENABLE, 
	"NAZWISKO" VARCHAR2(50) NOT NULL ENABLE, 
	"KRAJ" VARCHAR2(50) NOT NULL ENABLE, 
	"NRLICENCJI" VARCHAR2(50) NOT NULL ENABLE, 
	"WAZNOSCLICENCJI" DATE NOT NULL ENABLE, 
	 PRIMARY KEY ("TRENERID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ZAWODNIK" 
   (	"ZAWODNIKID" NUMBER(*,0), 
	"KLUBID" NUMBER(*,0) NOT NULL ENABLE, 
	"IMIE" VARCHAR2(50) NOT NULL ENABLE, 
	"NAZWISKO" VARCHAR2(50) NOT NULL ENABLE, 
	"CZYBADANIAZDROWOTNE" VARCHAR2(3) NOT NULL ENABLE, 
	"DATAURODZENIA" DATE NOT NULL ENABLE, 
	"POZYCJA" VARCHAR2(1) NOT NULL ENABLE, 
	 CHECK (Pozycja IN ('B', 'O', 'P', 'N')) ENABLE, 
	 PRIMARY KEY ("ZAWODNIKID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ZDARZENIEMECZ" 
   (	"ZDARZENIEMECZID" NUMBER(*,0), 
	"MECZID" NUMBER(*,0) NOT NULL ENABLE, 
	"SEDZIAID" NUMBER(*,0) NOT NULL ENABLE, 
	"MINUTA" NUMBER(*,0) NOT NULL ENABLE, 
	"TYPZDARZENIEMECZ" VARCHAR2(6) NOT NULL ENABLE, 
	 CHECK (TypZdarzenieMecz IN ('Gol', 'Kartka', 'Zmiana')) ENABLE, 
	 PRIMARY KEY ("ZDARZENIEMECZID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ZDARZENIEMECZGOL" 
   (	"GOLID" NUMBER(*,0) NOT NULL ENABLE, 
	"ZDARZENIEMECZID" NUMBER(*,0) NOT NULL ENABLE, 
	"ZAWODNIKSTRZELAJACYID" NUMBER(*,0) NOT NULL ENABLE, 
	"TYPGOLA" VARCHAR2(7) NOT NULL ENABLE, 
	 CHECK (TypGola IN ('zwykly', 'karny', 'samoboj')) ENABLE, 
	 PRIMARY KEY ("GOLID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ZDARZENIEMECZKARTKA" 
   (	"KARTKAID" NUMBER(*,0) NOT NULL ENABLE, 
	"ZDARZENIEMECZID" NUMBER(*,0) NOT NULL ENABLE, 
	"ZAWODNIKKARTKOWANYID" NUMBER(*,0) NOT NULL ENABLE, 
	"KOLORKARTKI" VARCHAR2(8) NOT NULL ENABLE, 
	 CHECK (KolorKartki IN ('Zolta', 'Czerwona')) ENABLE, 
	 PRIMARY KEY ("KARTKAID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ZDARZENIEMECZZMIANA" 
   (	"ZMIANAID" NUMBER(*,0) NOT NULL ENABLE, 
	"ZDARZENIEMECZID" NUMBER(*,0) NOT NULL ENABLE, 
	"ZAWODNIKWCHODZACYID" NUMBER(*,0) NOT NULL ENABLE, 
	"ZAWODNIKSCHODZACYID" NUMBER(*,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("ZMIANAID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "KLUB" ADD FOREIGN KEY ("LIGAID")
	  REFERENCES "LIGA" ("LIGAID") ENABLE;
  ALTER TABLE "KLUB" ADD FOREIGN KEY ("TRENERID")
	  REFERENCES "TRENER" ("TRENERID") ENABLE;
  ALTER TABLE "KLUB" ADD FOREIGN KEY ("STADIONID")
	  REFERENCES "STADION" ("STADIONID") ENABLE;
