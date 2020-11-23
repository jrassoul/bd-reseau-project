CREATE TABLE marque(
	marqueid varchar(20) NOT NULL ,
	Marque varchar(20) NOT NULL,  
	PRIMARY KEY (MarqueId)
);

-- table etat contiens 1 clef primere
CREATE TABLE etat(
  Id_etat varchar(20) NOT NULL,
  etat  varchar(20) NOT NULL,
	PRIMARY KEY (Id_etat)
);

-- table categorie contiens 1 clef primere
CREATE TABLE categorie (
  Categorieid varchar(11) NOT NULL,
  NomCategorie varchar(15) NOT NULL,
  DescProduit varchar(2000) DEFAULT NULL,
  PRIMARY KEY (CategorieId)
);

CREATE TABLE privilege(
  PrivilegeId varchar(20) NOT NULL,
  achat bool,     
  vendre  bool,
  PRIMARY KEY (PrivilegeId)
  );

--contient 1primaire 1 secondaire
CREATE TABLE client (
  ClientId varchar(15) NOT NULL,
  NomSociete varchar(40) NOT NULL,
  Adresse varchar(60) DEFAULT NULL,
  Ville varchar(15) NOT NULL,
  Region varchar(15) DEFAULT NULL,
  CodePostal varchar(10) DEFAULT NULL,
  Pays varchar(15) NOT NULL,
  Mail varchar(20) NOT NULL,
  Telephone varchar(24) DEFAULT NULL,
  PrivilegeId varchar(20),
  PRIMARY KEY (ClientId),
  CONSTRAINT FK_id_privilege FOREIGN KEY (PrivilegeId) 
  REFERENCES privilege(PrivilegeId)); 



CREATE TABLE fournisseur (
  FactureId  varchar(20) NOT NULL,
  NomSociete varchar(40) NOT NULL,
  ContactNom varchar(30) DEFAULT NULL,
  Adresse varchar(60) DEFAULT NULL,
  Ville varchar(15) NOT NULL,
  Region varchar(15) DEFAULT NULL,
  CodePostal varchar(10) DEFAULT NULL,
  Pays varchar(15) NOT NULL,
  Telephone varchar(24) DEFAULT NULL,
  mail varchar(30),
  PRIMARY KEY (FactureId)
);



CREATE TABLE facture(
  FactureId  varchar(20) NOT NULL,
  Nom_client  varchar(20),
  prenom_client varchar(20),
  tel_client  varchar(15),
  mail_client varchar(30) ,
  mode_paiment  varchar(20),
  montant_paye  numeric(10),
  quantite_produit  numeric(10),
  PRIMARY KEY (FactureId)
)

-- a voir avec la date 
CREATE TABLE livraison(
  Livraison_Id varchar(15) NOT NULL,
  date_estime     DATE ,
  date_exped    DATE,
  id_mode_livrsn  varchar(10) NOT NULL,
	PRIMARY KEY (Livraison_Id)
);



	CREATE TABLE produit
(
    ProduitId varchar(11) NOT NULL,
    nomproduit varchar(40)  NOT NULL,
    FactureId  varchar(20)  DEFAULT NULL,
    Categorieid varchar(11)  NOT NULL,
    marqueid varchar(20)  NOT NULL,
    Id_etat varchar(20)  NOT NULL,
    prixunitaire numeric(19,4) DEFAULT 0.0000,
    quantiteenstock numeric(6,0) DEFAULT 0,
    quantiteencommande numeric(6,0) DEFAULT 0,
    enrupture numeric(4,0) NOT NULL DEFAULT 0,
    CONSTRAINT produit_pkey PRIMARY KEY (produitid),
    CONSTRAINT fk_categorieid FOREIGN KEY (categorieid) REFERENCES categorie (categorieid),
    CONSTRAINT fk_FactureId FOREIGN KEY (FactureId) REFERENCES fournisseur (FactureId),
    CONSTRAINT fk_identifiant_etat FOREIGN KEY (id_etat) REFERENCES etat (id_etat),
    CONSTRAINT fk_marque_id FOREIGN KEY (marqueid) REFERENCES marque (marqueid)
);

CREATE TABLE commande (
  CmdId varchar(11) NOT NULL,
  FactureId  varchar(20)  ,
  Livraison_Id varchar(15) ,   
  ProduitId varchar(11) NOT NULL,
  ClientId varchar(15) NOT NULL,
  Date_cmd date NOT NULL,
  Date_Demandee date DEFAULT NULL,
  DateExpedition date DEFAULT NULL,
  --mail
  PRIMARY KEY (CmdId),
  CONSTRAINT FK_Livraison_Id FOREIGN KEY (Livraison_Id) REFERENCES livraison(Livraison_Id),
  CONSTRAINT FK_FactureId FOREIGN KEY (FactureId) REFERENCES facture(FactureId),
  CONSTRAINT FK_ProduitId FOREIGN KEY (ProduitId) REFERENCES produit(ProduitId),
  CONSTRAINT FK_ClientId FOREIGN KEY (ClientId) REFERENCES client(ClientId)

);
