<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:output method="html" encoding="iso-8859-1" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Gestage</title>
    <link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"></link>

    <link rel="stylesheet" media="screen" href="../stage.css" type="text/css"/>

    <link rel="icon" type="images/png" href="../images/favicon.png" />
    <script type="text/javascript" src="../jquery.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.2-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.2-dist/js/npm.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet"/>

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
</head>
<body id="quicksand">
<div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="accueil.html">
                       <img src="../images/logo.png" id="logo"/> Bienvenue!
                    </a>
                </li>
                <li>
                    <a href="accueil.html"><i class="glyphicon glyphicon-menu-hamburger"></i> Accueil</a>
                </li>

                <li>
                    <a href="page_etablissements.xml"><i class="glyphicon glyphicon-home"></i> Etablissements</a>
                </li>
                <li>
                    <a href="page_etudiants.xml"><i class="glyphicon glyphicon-education"></i> Etudiants</a>
                </li>
                <li>
                    <a href="page_pos.xml"><i class="glyphicon glyphicon-apple"></i> PO</a>
                </li>
                <li>
                    <a href="page_stages.xml"><i class="glyphicon glyphicon-briefcase"></i> Stages</a>
                </li>
                <li>
                    <a href="page_personnes.xml"><i class="glyphicon glyphicon-user"></i> Encadrants, enseignants</a>
                </li>
                <li>
                    <a href="page_evaluations.xml"><i class="glyphicon glyphicon-file"></i> Evaluations</a>
                </li>
                <li>
                    <a href="page_rapports.xml"><i class="glyphicon glyphicon-duplicate"></i> Rapports</a>
                </li>
                <li>
                    <a href="page_soutenances.xml"><i class="glyphicon glyphicon-comment"></i> Soutenances</a>
                </li>
                <li>
                    <a href="about.html"><i class="glyphicon glyphicon-cog"></i> About</a>
                </li>
            </ul>
        </div>
    
    <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-1" ><a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a></div>
                    <div class="col-lg-offset-1 col-lg-8" >
                        <div class="jumbotron">
                            <h2><b>Bienvenue sur l'espace de gestion des Stages</b> !</h2><br/><hr/>
                            <p class="lead">Vous pouvez a tout moment augmenter le nombre d'entrees du tableau et trier par ordre alphabetique ou desalphatique selon une colonne en cliquant dessus.
                            </p>
                            <p class="lead">Un dispositif de recherche est aussi disponible pour rendre votre travail plus agreable.</p>
                            
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </div>
    
    
    
    
    <!-- ******************************************** ETABLISSEMENTS ***************** -->    
   <div class="row">
                <div class="col-lg-12">
                    <h1>Stages</h1>
                </div>
                <!-- /.col-lg-12 -->
    </div>

     <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
             <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Intitule</th>
                                        <th>Duree (en mois)</th>
                                        <th>Annee</th>
                                        <th>Etudiant</th>
                                        <th>Tuteur</th>
                                        <th>Encadrants</th>
                                        <th>Mots Clefs</th>
                                    </tr>
                                    
                                </thead>
                                <tbody>
                                    
                                        <xsl:for-each select="base/stages/stage">
                                            <tr class="odd gradeX">
                                                <td><xsl:value-of select="./intitule"/></td>
                                                <td><xsl:value-of select="./duree"/></td>
                                                
                                                <td><xsl:value-of select="./annee"/></td>
                                                
                                                <xsl:variable name="idEtud" select="./@id_etudiant"/>		
                                                <xsl:for-each select="//base/etudiants/etudiant">
                                                <xsl:variable name="numEtud" select="./@num_etudiant"/>
                                                    <xsl:if test="$idEtud=$numEtud">
                                                        <td><xsl:value-of select="./nom"/>&#160;<xsl:value-of select="./prenom"/></td>
                                                    </xsl:if>		
                                                </xsl:for-each>
                                                
                                                <xsl:variable name="idTuteur" select="./@id_tuteur"/>		
                                                <xsl:for-each select="//base/personnes/personne">
                                                <xsl:variable name="idPersonne" select="./@id"/>
                                                    <xsl:if test="$idTuteur=$idPersonne">
                                                        <td><xsl:value-of select="./descendant::nom"/></td>
                                                    </xsl:if>		
                                                </xsl:for-each>
                                                
                                                <td>
                                                <xsl:for-each select="encadrant">
                                                <xsl:variable name="idEncadrant" select="./@id_encadrant"/>		
		                                        <xsl:for-each select="//base/personnes/personne">
                                                <xsl:variable name="idPersonne" select="./@id"/>
                                                <xsl:if test="$idEncadrant=$idPersonne">
                                                   <xsl:value-of select="./descendant::nom"/>,	
                                                </xsl:if>		
                                                </xsl:for-each>
                                                </xsl:for-each>
                                                </td>
                                                
                                                <td>
                                                <xsl:for-each select="listeMotsClefs/motClef">
                                                    <xsl:value-of select="."/>,
                                                </xsl:for-each>
                                                </td>      
                                            </tr>
                                        </xsl:for-each>                            
                                </tbody>
                            </table>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
    <!-- ******************************************** ETABLISSEMENTS ***************** -->    
    
    
   

    </div>


 
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
           

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>   
    
    
    
    
</body>
</html>
</xsl:template>

</xsl:stylesheet>
