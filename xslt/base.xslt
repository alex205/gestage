<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:output method="html" encoding="iso-8859-1" indent="yes"/>

<xsl:template match="/">

<html>
<head>
<!--link rel="stylesheet" href="http://etud.insa-toulouse.fr/~ggomez/iky2/communs/styles/styleBlog.css" /-->
</head>
<body>

<!--      AFFICHAGE DES ETABLISSEMENTS -->
<h2>LISTE DES ETABLISSEMENTS</h2>
<h3>LISTE DES LABORATOIRES</h3>
<xsl:for-each select="base/etablissements/etablissement/laboratoire">
	<div>
	<p><b>Nom: </b> <xsl:value-of select="./nom"/> -- <xsl:value-of select="./unite"/></p>
	<p><b>Adresse: </b> <xsl:value-of select="./adresse/rue"/>&#160;<xsl:value-of select="./adresse/cp"/>&#160;<xsl:value-of select="./adresse/ville"/></p>
	</div>
</xsl:for-each>

<br/>
<h3>LISTE DES ENTREPRISES</h3>
<xsl:for-each select="base/etablissements/etablissement/entreprise">
	<div>
	<p><b>Nom: </b> <xsl:value-of select="./nom"/></p>
	<p><b>Siret: </b> <xsl:value-of select="./siret"/></p>
	<p><b>Adresse: </b> <xsl:value-of select="./adresse/rue"/>&#160;<xsl:value-of select="./adresse/cp"/>&#160;<xsl:value-of select="./adresse/ville"/></p>
	</div>
	<br/>
</xsl:for-each>

<!--  AFFICHAGE DES ETUDIANTS    -->
<h2>LISTE DES ETUDIANTS</h2>
<xsl:for-each select="base/etudiants/etudiant">
	<div>
	<p><b>Nom: </b> <xsl:value-of select="./nom"/>&#160;<xsl:value-of select="./prenom"/></p>
	<p><b>Date de naissance: </b> <xsl:value-of select="./date_naissance"/></p>
	<p><b>Numero etudiant: </b> <xsl:value-of select="@num_etudiant"/></p> 
	<br/>
	</div>
</xsl:for-each>

<!--  AFFICHAGE DES POS    -->
<h2>LISTE DES PRE-ORIENTATIONS</h2>
<xsl:for-each select="base/pos/po">
	<div>
	<p><b>Intitule: </b> <xsl:value-of select="./intitule"/></p>
	<p><b>Departement: </b> <xsl:value-of select="./departement"/></p>
	<br/>
	</div>
</xsl:for-each>

<!--  AFFICHAGE DES STAGES    -->
<h2>LISTE DES STAGES</h2>
<xsl:for-each select="base/stages/stage">
	<div>
	<p><b>Intitule: </b> <xsl:value-of select="./intitule"/></p>
	<p><b>Duree: </b> <xsl:value-of select="./duree"/> mois</p>
	<p><b>Annee: </b> <xsl:value-of select="./annee"/></p>
	<!--ICI Je voulais afficher le nom et prenom de l'eleve mais j'y arrive pas-->
	<!--Di afficher le nom et prenom-->
	<xsl:variable name="idEtud" select="./@id_etudiant"/>		
	<xsl:for-each select="//base/etudiants/etudiant">
	<xsl:variable name="numEtud" select="./@num_etudiant"/>
		<xsl:if test="$idEtud=$numEtud">
			<div>
			<p><b>Nom etudiant (**) : </b> <xsl:value-of select="./nom"/></p>
			<p><b>Prenom etudiant (**): </b> <xsl:value-of select="./prenom"/></p>
			</div>	
		</xsl:if>		
	</xsl:for-each>

	
	<xsl:for-each select="encadrant">
		<div>
		<p><b>Encadrant: </b> <xsl:value-of select="@id_encadrant"/></p> 
<!--Je voulais afficher le nom et prenom de l'encadrant mais j'y arrive pas-->
<!--fait-->
		<xsl:variable name="idEncadrant" select="./@id_encadrant"/>		
		<xsl:for-each select="//base/personnes/personne">
		<xsl:variable name="idPersonne" select="./@id"/>
			<xsl:if test="$idEncadrant=$idPersonne">
				<div>
				<p><b>Nom encadrant (**): </b> <xsl:value-of select="./descendant::nom"/></p>
				<p><b>Prenom encadrant (**): </b> <xsl:value-of select="./descendant::prenom"/></p>
				</div>	
			</xsl:if>		
		</xsl:for-each>

		</div>
	</xsl:for-each>
	<b>Mots cles: </b>
	<xsl:for-each select="listeMotsClefs/motClef">
		<div>
		<p><b>&#160;&#160;&#160;&#160;.</b> <xsl:value-of select="."/></p>
		</div>
	</xsl:for-each>
	<br/>
	</div>
</xsl:for-each>

<!--  AFFICHAGE DES ENCADRANTS/ENSEIGNANTS    -->
<h2>LISTE DES ENCADRANTS</h2>
<h3>Industriels: </h3>
<xsl:for-each select="base/personnes/personne/encadrant/industriel">
	<div>
	<p><b>Nom: </b> <xsl:value-of select="./nom"/>&#160;<xsl:value-of select="./prenom"/></p>
	<p><b>Fonction: </b> <xsl:value-of select="./fonction"/></p>
	<p><b>Mail: </b> <xsl:value-of select="./mail"/></p>
	<p><b>Mail: </b> <xsl:value-of select="./telephone"/></p>
	<br/>
	</div>
</xsl:for-each>
<h3>Chercheurs: </h3>
<xsl:for-each select="base/personnes/personne/encadrant/chercheur">
	<div>
	<p><b>Nom: </b> <xsl:value-of select="./nom"/>&#160;<xsl:value-of select="./prenom"/></p>
	<p><b>Fonction: </b> <xsl:value-of select="./fonction"/></p>
	<p><b>Mail: </b> <xsl:value-of select="./mail"/></p>
	<p><b>Mail: </b> <xsl:value-of select="./telephone"/></p>
	<br/>
	</div>
</xsl:for-each>

<h2>LISTE DES ENSEIGNANTS</h2>
<xsl:for-each select="base/personnes/personne/enseignant">
	<div>
	<p><b>Nom: </b> <xsl:value-of select="./nom"/>&#160;<xsl:value-of select="./prenom"/></p>
	<p><b>Fonction: </b> <xsl:value-of select="./fonction"/></p>
	<p><b>Mail: </b> <xsl:value-of select="./mail"/></p>
	<p><b>Mail: </b> <xsl:value-of select="./telephone"/></p>
	<br/>
	</div>
</xsl:for-each>

<!--  AFFICHAGE DES EVALUATIONS    -->
<h2>LISTE DES EVALUATIONS</h2>
<xsl:for-each select="base/evaluations/evaluation">
	<div>
	<p><b>Id: </b> <xsl:value-of select="@id"/></p> 
<!--Je voulais afficher l'intitule du stage mais j'y arrive pas-->
<!--fait-->
	<xsl:variable name="idEvaluation" select="./@id"/>		
	<xsl:for-each select="//base/stages/stage">
		<xsl:variable name="idStage" select="./@id"/>
			<xsl:if test="$idEvaluation=$idStage">
				<div>
				<p><b>Intitule (**) : </b> <xsl:value-of select="./descendant::intitule"/></p>
				</div>	
			</xsl:if>		
	</xsl:for-each>

	<p><b>Note: </b> <xsl:value-of select="./note"/></p>
	<p><b>Commentaire technique: </b> <xsl:value-of select="./commentaire_technique"/></p>
	<p><b>Commentaire communication: </b> <xsl:value-of select="./commentaire_communication"/></p>
	<p><b>Commentaire integration: </b> <xsl:value-of select="./commentaire_integration"/></p>
	<br/>
	</div>
</xsl:for-each>

<!--  AFFICHAGE DES RAPPORTS    -->
<h2>LISTE DES RAPPORTS</h2>
<xsl:for-each select="base/rapports/rapport">
	<div>
	<p><b>Id: </b> <xsl:value-of select="@id"/></p> 
<!--Je voulais afficher l'intitule du stage et le nom de l'eleve mais j'y arrive pas-->
<!--fait-->
	<xsl:variable name="idRapport" select="./@id"/>		
	<xsl:for-each select="//base/stages/stage">
		<xsl:variable name="idStage" select="./@id"/>
		<xsl:variable name="idEtudiant" select="./@id_etudiant"/>
			<xsl:if test="$idRapport=$idStage">
			<xsl:for-each select="//base/etudiants/etudiant">
				<xsl:if test="$idEtudiant=@num_etudiant">
				<div>
				<p><b>Intitule (**) : </b> <xsl:value-of select="//descendant::stage/descendant::intitule"/></p>	
				<p><b>noom (**) : </b> <xsl:value-of select="./descendant::nom"/></p>			
				</div>	
				</xsl:if>
			</xsl:for-each>	
			</xsl:if>	
	</xsl:for-each>
	<p><b>Note: </b> <xsl:value-of select="./note"/></p>
	<xsl:for-each select="enseignant">
		<div>
		<p><b>Enseignant: </b> <xsl:value-of select="@id_enseignant"/></p> 
		<!--Je voulais afficher le nom et prenom de l'enseignant mais j'y arrive pas-->
		<!--fait-->
		<xsl:variable name="idEnseignant" select="./@id_enseignant"/>		
		<xsl:for-each select="//base/personnes/personne">
		<xsl:variable name="idPersonne" select="./@id"/>
			<xsl:if test="$idEnseignant=$idPersonne">
				<div>
				<p><b>Nom enseignant (**): </b> <xsl:value-of select="./descendant::nom"/></p>
				<p><b>Prenom enseignant (**): </b> <xsl:value-of select="./descendant::prenom"/></p>
				</div>	
			</xsl:if>		
		</xsl:for-each>


		</div>
	</xsl:for-each>
	<br/>
	</div>
</xsl:for-each>

<!--  AFFICHAGE DES SOUTENANCES    -->
<h2>LISTE DES SOUTENANCES</h2>
<xsl:for-each select="base/soutenances/soutenance">
	<div>
	<p><b>Id: </b> <xsl:value-of select="@id"/></p> 
<!--Je voulais afficher l'intitule du stage et le nom de l'eleve mais j'y arrive pas-->
<!--fait-->
	<xsl:variable name="idSoutenance" select="./@id"/>		
	<xsl:for-each select="//base/stages/stage">
		<xsl:variable name="idStage" select="./@id"/>
		<xsl:variable name="idEtudiant" select="./@id_etudiant"/>
			<xsl:if test="$idSoutenance=$idStage">
			<xsl:for-each select="//base/etudiants/etudiant">
				<xsl:if test="$idEtudiant=@num_etudiant">
				<div>
				<p><b>Intitule (**) : </b> <xsl:value-of select="//descendant::stage/descendant::intitule"/></p>	
				<p><b>noom (**) : </b> <xsl:value-of select="./descendant::nom"/></p>			
				</div>	
				</xsl:if>
			</xsl:for-each>	
			</xsl:if>	
	</xsl:for-each>
	<p><b>Date: </b> <xsl:value-of select="./date"/></p>
	<p><b>Note soutenance: </b> <xsl:value-of select="./note_soutenance"/></p>
	<p><b>Note rapport: </b> <xsl:value-of select="./note_rapport"/></p>	
	<xsl:for-each select="jury">
		<div>
		<p><b>Jury: </b> <xsl:value-of select="@id_jury"/></p>
 <!--Je voulais afficher le nom et prenom de l'enseignant/encadrant mais j'y arrive pas-->
<!--fait-->
		<xsl:variable name="idjury" select="./@id_jury"/>		
		<xsl:for-each select="//base/personnes/personne">
		<xsl:variable name="idPersonne" select="./@id"/>
			<xsl:if test="$idjury=$idPersonne">
				<div>
				<p><b>Nom jury (**): </b> <xsl:value-of select="./descendant::nom"/></p>
				<p><b>Prenom jury (**): </b> <xsl:value-of select="./descendant::prenom"/></p>
				</div>	
			</xsl:if>		
		</xsl:for-each>

		</div>
	</xsl:for-each>
	<br/>
	</div>
</xsl:for-each>


</body>
</html>
</xsl:template>

</xsl:stylesheet>
