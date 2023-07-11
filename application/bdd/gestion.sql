create database systInfo;
\c systInfo

---
--SOCIETE
            create sequence  seqSociete increment by 1;
            create table societe(
                        idSt varchar(25) primary key  default(concat('SOC',nextval('seqSociete'))),
                        nomSt varchar(225) not null ,
                        logo varchar (255) default null,
                        mdp varchar(10) not null ,
                        pdg varchar(225),
                        siege varchar(225),
                        addExp varchar(225) default null,
                        creation date,
                        numFisc varchar(15) not null ,
                        numStat varchar(15) not null ,
                        numCom varchar(15) not null ,
                        statut varchar(10)
            );
insert  into societe (nomSt,logo, mdp, pdg, siege,addExp, creation, numFisc, numStat, numCom, statut) values ('FILATEX','logo.jpg','flt0001','Salim Safar','USA','New-york','2001-06-16','00000000','18967894','1213FE45','SARL');
--EXERCICE
            create sequence seqExercice increment by 1;
            create table exercice(
                        idExo varchar(25) primary key  default(concat('EXO',nextval('seqExercice'))),
                        dateD date,
                        dateF date,
                        idSt varchar (255) references societe(idSt)
            );
-------------------------------------------------------------------------------------------------------------------
--DEVISE ????? devise compte
            create sequence  seqDeviseC increment by 1;
            create table deviseC (
                        idDevC varchar(20) primary key  default(concat('DEV',nextval('seqDeviseC'))),
                        valeur varchar (225),
                        valDev int default  0
            );
---------------------------------------------------------------------------------------------------------------------------
        --DEVISE ????? devise equivalence
        create sequence  seqDeviseC increment by 1;
        create table deviseC (
                                 idDevC varchar(20) primary key  default(concat('DEV',nextval('seqDeviseC'))),
                                 money varchar (225),
                                 valDev int default  0,
        );
        --devise Equivalence = deviseC/taux
        --1$ = 4000Ar dE= dC/4000
---------------------------------------------------------------------------------------------------------------------------
--PLAN COMPTABLE
            create sequence  seqPlanC increment by 1;
            create table planC (
                        idPlanC varchar(225) primary key  default(concat('PLC',nextval('seqPlanC'))),
                        numC varchar(6),
                        intitule varchar(225)
            );
            ---LIAISON PLANC + STE
                                create table linkSC(
                                            idST varchar(225) references  societe(idSt),
                                            idPlanC varchar(225) references planC(idPlanC)
                                );
insert into planC (numC,intitule) values  ('21100','Terrain');
insert into planC (numC,intitule) values  ('21200','Construction');

insert into linkSC (idST,idPlanC) values  ('SOC1','PLC1');
insert into linkSC (idST,idPlanC) values  ('SOC1','PLC2');


--PLAN TIERS
            create sequence  seqPlanT increment by 1;
            create table planT (
                                   idPlanT varchar(225) primary key  default(concat('PLT',nextval('seqPlanT'))),
                                   description varchar(225),
                                   typeT int --0 client & 5 fournisseur
            );
            ---LIAISON PLANT + STE
                            create table linkST(
                                                   idST varchar(225) references  societe(idSt),
                                                   idPlanT varchar(225) references planT(idPlanT)
                            );
insert into planT (description,typeT) values  ('MAKIPLAST',5);
insert into planT (description,typeT) values  ('JIRAMA',5);
insert into planT (description,typeT) values  ('Koto',0);


insert into linkST (idST,idPlanT) values  ('SOC1','PLT1');
insert into linkST (idST,idPlanT) values  ('SOC1','PLT2');
insert into linkST (idST,idPlanT) values  ('SOC1','PLT3');

--CODE JOURNAL
            create sequence  seqcodeJ increment by 1;
            create table codeJ (
                                   idcodeJ varchar(225) primary key  default(concat('COD',nextval('seqcodeJ'))),
                                   code varchar(3),
                                   descritpion varchar(225)
            );
            ---LIAISON CODEJs + STE
                            create table linkSCD(
                                                   idST varchar(225) references  societe(idSt),
                                                   idcodeJ varchar(225) references codeJ(idcodeJ)
                            );
insert into codeJ (code,descritpion) values  ('AC','ACHAT');
insert into codeJ (code,descritpion) values  ('CA','CAISSE');

insert into linkSCD (idST,idcodeJ) values  ('SOC1','COD1');
insert into linkSCD (idST,idcodeJ) values  ('SOC1','COD2');

--ECRITURE
            create sequence  seqEcriture increment by 1;
            create table Ecriture (
                                 idEc varchar (255) primary key default(concat('ECT',nextval('seqEcriture'))),
                                 codeJ varchar (255) ,
                                 dateJ date,
                                 numPiece varchar (255),
                                 planC varchar (255),
                                 planT varchar (255) default  null,
                                 intitule varchar (255) default null,
                                 libelle varchar (255),
                                 debit numeric (11,2) default 0,
                                 credit numeric (11,2) default 0,
                                 typeV  int --5valider, 0non valide
            );
insert into Ecriture (dateJ,codeJ, numPiece, planC, planT,intitule, libelle, debit, credit,typeV) values ('2023-03-10','AC','FCT01','60100','','ACHAT MATIERES PREMIERESS','achat de marchandise',100.0,0,5);
insert into Ecriture (dateJ,codeJ, numPiece, planC, planT,intitule, libelle, debit, credit,typeV) values ('2023-03-10','AC','FCT01','44560','','ETAT: TVA DEDUCTIBLE','achat de marchandise',20.0,0,5);
insert into Ecriture (dateJ,codeJ, numPiece, planC, planT,intitule, libelle, debit, credit,typeV) values ('2023-03-10','AC','FCT01','40110','SOCOLAIT','FOURNISSEURS DEXPLOITATIONS LOCAUX','achat de marchandise',0,120,5);

insert into Ecriture (dateJ,codeJ, numPiece, planC, planT,intitule, libelle, debit, credit,typeV) values ('2023-04-12','VL','FCT02','70110','','VENTE LOCALE','vente energie',0.0,200,5);
insert into Ecriture (dateJ,codeJ, numPiece, planC, planT,intitule, libelle, debit, credit,typeV) values ('2023-04-12','VL','FCT02','44570','','ETAT: TVA COLLECTEE','vente energie',0.0,40,5);
insert into Ecriture (dateJ,codeJ, numPiece, planC, planT,intitule, libelle, debit, credit,typeV) values ('2023-04-12','VL','FCT02','41100','ACSOLAR','CLIENTS LOCAUX','vente energie',240,0,5);
31/12/2012,AN,AN2012,44560,null,ETAT: TVA DEDUCTIBLE,A NOUVEAU 2012,0,203370.00
insert into Ecriture (dateJ,codeJ, numPiece, planC, planT,intitule, libelle, debit, credit,typeV) values ('2012-12-31','AN','AN2012','44560',NULL,'ETAT: TVA DEDUCTIBLE',' A NOUVEAU 2012',0,203370.00,5);

--JOURNAL
            create sequence  seqJournal increment by 1;
            create table journal (
                                     idJ varchar(225) primary key  default(concat('JNL',nextval('seqJournal'))),
                                     idEc varchar (255) references ecriture (idEc),
                                     idSt varchar (255) references  societe(idSt)
            );
insert into journal (idEc,idSt) values ('ECT1','SOC1');
insert into journal (idEc,idSt) values ('ECT48','SOC1');
insert into journal (idEc,idSt) values ('ECT2','SOC1');
insert into journal (idEc,idSt) values ('ECT3','SOC1');

insert into journal (idEc,idSt) values ('ECT4','SOC1');
insert into journal (idEc,idSt) values ('ECT5','SOC1');
insert into journal (idEc,idSt) values ('ECT6','SOC1');

--BALANCE  requete and typev = 5
--CENTRE
            create sequence  seqCentre increment by 1;
            create table Centre(
                idCentre varchar(255) primary key default (concat('CTR', nextval('seqCentre'))),
                centre   varchar(255),
                idSt     varchar(255) references societe (idSt)
            );
--PRODUIT
            create sequence seqProduit increment by 1;
            create table Produit(
                idxt varchar(255) primary key default (concat('PDT', nextval('seqProduit'))),
                numCpt varchar (6),
                produit   varchar(255),
                pourcentage double precision,
                idSt varchar(255) references societe (idSt)
            );
--CHARGE
            create sequence seqCharge increment by 1;
            create table Charge(
                idCharge varchar(255) primary key default (concat('CHG', nextval('seqCharge'))),
                num varchar (255),
                rubrique varchar (255),
                uniteO varchar (20),
                prix double precision,
                type int ,
                idSt varchar (255) references societe(idSt)
            );
//TABccp
            create table tabccp(
                idCharge varchar(255) references  charge(idCharge),
                idXt varchar(255) references Produit(idxt),
                idCentre varchar(255) references  Centre(idCentre),
                pourcentage double precision,
                quantite double precision
            );
--REQUETE
update infosoc set nomSt = 'FILATEX',pdg = 'Salim Safar', siege ='USA',addExp ='New-york',creation = '2001-06-16',numFisc = '0000000000',numStat = '18967894',numCom = '12123FE345',statut = 'SARL' where idSt ='SOC1';
update ecriture set debit = 71600.00 , credit = 0 where idEc = 'ECT7';
            create view viewsc as (select st.idSt , st.nomSt , pc.idPlanC, pc.numC ,pc.intitule  from linksc lk
            join planC pc on lk.idPlanC = pc.idPlanC
            join societe st on lk.idST = st.idSt );where st.idSt = 'SOC3';

 create view viewscd as (select st.idSt , st.nomSt , pc.idcodeJ, pc.code , pc.descritpion  from linkscd lk
            join codeJ pc on lk.idcodeJ = pc.idcodeJ
            join societe st on lk.idST = st.idSt );where st.idSt = 'SOC3';


create view viewst as (select st.idSt , st.nomSt , pc.idplanT, pc.description ,pc.typeT  from linkst lk
            join planT pc on lk.idPlanT = pc.idPlanT
            join societe st on lk.idST = st.idSt );where st.idSt = 'SOC3';

create view viewJL as (select ec.idEc,jl.idSt , sc.nomSt , ec.dateJ , ec.codeJ , ec.planC ,ec.planT,ec.intitule,ec.libelle,ec.debit,ec.credit,ec.typeV  from journal jl
join ecriture ec on jl.idEc = ec.idEc
join societe sc on sc.idSt = jl.idSt
where  ec.typeV = 5 ); where ec.codeJ = 'AC' and jl.idSt = 'SOC1' and EXTRACT(MONTH FROM dateJ) = 5;

drop view viewJl;
drop table journal;
drop table ecriture;
drop sequence seqJournal;
drop sequence seqEcriture;
drop sequence seqCentre;
drop table Centre;
drop sequence seqProduit;
drop table Produit;

SELECT *
FROM Ecriture
WHERE EXTRACT(MONTH FROM dateJ) = 3;

SELECT *
FROM Ecriture
WHERE planc = '44560' and EXTRACT(YEAR FROM dateJ) = 2023;

SELECT planc, sum(debit), sum(credit) , sum(credit) as solded , sum (debit) as soldec
FROM Ecriture WHERE planc in (select numc from planc) and
EXTRACT(YEAR FROM dateJ) = 2012  group by planc;

SELECT planc, sum(debit), sum(credit) , sum(credit) as solded , sum (debit) as soldec
FROM Ecriture WHERE planc in (select * from exceptBAL) and
EXTRACT(YEAR FROM dateJ) = 2012  group by planc;

SELECT planc, sum(debit), sum(credit) , sum(credit) as solded , sum (debit) as soldec
FROM Ecriture WHERE planc in (select numc from planC) and
        EXTRACT(YEAR FROM dateJ) = 2012  group by planc;

SELECT numC FROM planc WHERE NOT (numC LIKE '4457%' OR numC LIKE '4456%' OR  numC LIKE '6%' OR  numC LIKE '7%');

create view exceptBAL as (SELECT numC FROM planc WHERE NOT (numC LIKE '4457%' OR numC LIKE '4456%' OR  numC LIKE '6%' OR  numC LIKE '7%'));

--BALANCE SIMPLE
SELECT planc, sum(debit) as debit , sum(credit)  as credit,
       CASE WHEN sum(debit) > sum(credit) THEN ABS(sum(debit) - sum(credit)) ELSE NULL END AS soldeDebiteur,
       CASE WHEN sum(debit) <= sum(credit) THEN ABS(sum(debit) - sum(credit)) ELSE NULL END AS soldeCrediteur
FROM Ecriture
WHERE planc IN (SELECT numc FROM exceptBAL) AND EXTRACT(YEAR FROM dateJ) = 2012
GROUP BY planc;



SELECT
    '4458' AS planc,
    SUM(CASE WHEN planc LIKE '4457%' THEN debit ELSE 0 END) AS Tdebit,
    SUM(CASE WHEN planc LIKE '4456%' THEN credit ELSE 0 END) AS Tcredit,
    ABS(SUM(CASE WHEN planc LIKE '4457%' THEN debit ELSE 0 END) - SUM(CASE WHEN planc LIKE '4456%' THEN credit ELSE 0 END)) AS solde,
    CASE WHEN SUM(CASE WHEN planc LIKE '4457%' THEN debit ELSE 0 END) > SUM(CASE WHEN planc LIKE '4456%' THEN credit ELSE 0 END) THEN ABS(SUM(CASE WHEN planc LIKE '4457%' THEN debit ELSE 0 END) - SUM(CASE WHEN planc LIKE '4456%' THEN credit ELSE 0 END)) ELSE 0 END AS soldedebiteur,
    CASE WHEN SUM(CASE WHEN planc LIKE '4457%' THEN debit ELSE 0 END) <= SUM(CASE WHEN planc LIKE '4456%' THEN credit ELSE 0 END) THEN ABS(SUM(CASE WHEN planc LIKE '4457%' THEN debit ELSE 0 END) - SUM(CASE WHEN planc LIKE '4456%' THEN credit ELSE 0 END)) ELSE 0 END AS soldecrediteur
FROM Ecriture
WHERE planc LIKE '4456%' OR planc LIKE '4457%'
    AND EXTRACT(YEAR FROM dateJ) = 2012;

--BALANCE TVA
SELECT
    CASE
        WHEN LEFT(planc, 4) = '4456' THEN '4456'
    WHEN LEFT(planc, 4) = '4457' THEN '4457'
END AS planc_prefix,
    SUM(debit) AS debit,
    SUM(credit) AS credit,
    CASE WHEN SUM(debit) > SUM(credit) THEN ABS(SUM(debit) - SUM(credit)) ELSE NULL END AS soldeCrediteur,
    CASE WHEN SUM(debit) <= SUM(credit) THEN ABS(SUM(debit) - SUM(credit)) ELSE NULL END AS soldeDebiteur
FROM Ecriture
WHERE typev = 5 and planc LIKE '4456%' OR planc LIKE '4457%'
AND EXTRACT(YEAR FROM dateJ) = 2012
GROUP BY planc_prefix;

--ETAT FINANCIER ACTIF
SELECT
    '21' AS compte,
    SUM(debit - credit) AS brut,
    (
        SELECT ABS(SUM(debit - credit))
        FROM Ecriture
        WHERE planc LIKE '281%'
    ) AS amortissement
FROM Ecriture
WHERE planc LIKE '21%'

SELECT
    '21' AS compte,
    SUM(debit - credit) AS brut,
    (
        SELECT ABS(SUM(debit - credit))
        FROM Ecriture
        WHERE planc LIKE '281%'
          AND EXTRACT(YEAR FROM datej) = 2012
    ) AS amortissement,
    SUM(debit - credit) - (
        SELECT ABS(SUM(debit - credit))
        FROM Ecriture
        WHERE planc LIKE '281%'
          AND EXTRACT(YEAR FROM datej) = 2012
    ) AS net
FROM Ecriture
WHERE planc LIKE '21%'
  AND EXTRACT(YEAR FROM datej) = 2012;

SELECT
    '23' AS compte,
    COALESCE(SUM(debit - credit), 0) AS brut,
    COALESCE(
            (SELECT ABS(SUM(debit - credit))
             FROM Ecriture
             WHERE planc LIKE '283%' AND EXTRACT(YEAR FROM datej) = 2012), 0) AS amortissement,
    COALESCE(SUM(debit - credit), 0) - COALESCE(
            (SELECT ABS(SUM(debit - credit))
             FROM Ecriture
             WHERE planc LIKE '283%' AND EXTRACT(YEAR FROM datej) = 2012), 0) AS net
FROM Ecriture
WHERE planc LIKE '23%' AND EXTRACT(YEAR FROM datej) = 2012;





//
create view balA  as (SELECT planc, sum(debit) as debit , sum(credit)  as credit, dateJ
                 CASE WHEN sum(debit) > sum(credit) THEN ABS(sum(debit) - sum(credit)) ELSE NULL END AS solded,
                 CASE WHEN sum(debit) <= sum(credit) THEN ABS(sum(debit) - sum(credit)) ELSE NULL END AS soldec
FROM Ecriture
WHERE typev = 5 and planc IN (SELECT numc FROM exceptBAL) AND EXTRACT(YEAR FROM dateJ) = 2012
GROUP BY planc);


SELECT *
FROM balA
WHERE (planc LIKE '4%' OR planc LIKE '5%') AND  EXTRACT(YEAR FROM dateJ) = 2012 AND solded IS NOT NULL;


SELECT
    '40' AS compte,
    SUM(debit - credit) AS brut
FROM bala
WHERE planc LIKE '40%' AND solded IS NOT NULL;



SELECT '$cpt' AS compte, SUM(debit - credit) AS brut
FROM bala
WHERE planc LIKE '$cpt%' AND EXTRACT(YEAR FROM dateJ) = $year AND solded IS NOT NULL
HAVING SUM(debit - credit) IS NOT NULL;


SELECT '40' AS compte, SUM(debit - credit) AS brut FROM bala WHERE planc LIKE '40%' AND EXTRACT(YEAR FROM dateJ) = 2012 AND solded IS NOT NULL


    SELECT  *  FROM tabccp
    JOIN charge ON charge.idCharge = tabccp.idCharge
    JOIN produit ON produit.idxt = tabccp.idXt
    JOIN centre ON centre.idCentre = tabccp.idCentre where centre.idSt='SOC1';


SELECT
    rubrique,
    uniteo AS "Unité d'œuvre",
    prix AS PU,
    CASE WHEN type = 0 THEN 'Fixe' ELSE 'Variable' END AS Nature,
    CASE WHEN type = 0 THEN tabccp.quantite * charge.prix * tabccp.pourcentage / 100 ELSE NULL END AS "Centre1 (Fixe)",
    CASE WHEN type = 5 THEN tabccp.quantite * charge.prix * tabccp.pourcentage / 100 ELSE NULL END AS "Centre1 (Variable)"
FROM tabccp
         JOIN charge ON charge.idCharge = tabccp.idCharge
         JOIN produit ON produit.idxt = tabccp.idXt
         JOIN centre ON centre.idCentre = tabccp.idCentre
WHERE centre.idSt = 'SOC1';



SELECT
    rubrique,
    uniteo AS "Unité d'œuvre",
    prix AS PU,
    centre.centre as centre,
    tabccp.pourcentage as centre,
    CASE WHEN type = 0 THEN 'Fixe' ELSE 'Variable' END AS Nature,
    CASE WHEN type = 0 THEN tabccp.quantite * charge.prix * tabccp.pourcentage / 100 ELSE 0 END AS "Centre1 (Fixe)",
    CASE WHEN type = 5 THEN tabccp.quantite * charge.prix * tabccp.pourcentage / 100 ELSE 0 END AS "Centre1 (Variable)"
FROM tabccp
         JOIN charge ON charge.idCharge = tabccp.idCharge
         JOIN produit ON produit.idxt = tabccp.idXt
         JOIN centre ON centre.idCentre = tabccp.idCentre
WHERE centre.idSt = 'SOC1';


SELECT rubrique,
       uniteo AS UniteO,    prix AS PU,
       centre.centre as centre,
       tabccp.pourcentage as centre,
       CASE WHEN type = 0 THEN 'Fixe' ELSE 'Variable' END AS Nature,
       CASE WHEN type = 0 THEN tabccp.quantite * charge.prix * tabccp.pourcentage / 100 ELSE 0 END AS Fixe,
       CASE WHEN type = 5 THEN tabccp.quantite * charge.prix * tabccp.pourcentage / 100 ELSE 0 END AS Variable
FROM tabccp
         JOIN charge ON charge.idCharge = tabccp.idCharge
         JOIN produit ON produit.idxt = tabccp.idXt
         JOIN centre ON centre.idCentre = tabccp.idCentre
WHERE centre.idSt = 'SOC1' and produit.idXT = 'PDT7';

SELECT * FROM balA WHERE (planc LIKE '4%' OR planc LIKE '5%') AND  EXTRACT(YEAR FROM dateJ) = $year AND solded IS NOT NULL