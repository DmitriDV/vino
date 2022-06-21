<?php
/**
 * Class Cellier
 * Cette classe possède les fonctions de gestion des bouteilles dans le cellier et des bouteilles dans le catalogue complet.
 * 
 * @author Equipe de 4
 * @version 1.0
 * @update 2019-01-21
 * @license Creative Commons BY-NC 3.0 (Licence Creative Commons Attribution - Pas d’utilisation commerciale 3.0 non transposé)
 * @license http://creativecommons.org/licenses/by-nc/3.0/deed.fr
 * 
 */

 class Cellier extends Modele {
    
    /**
	 * Cette méthode annonce une liste des bouteilles importées de la SAQ disponibles pour ajouter au cellier.
	 * @access public
	 * @return Array $data Tableau des données représentants la liste des bouteilles.
	 */
	public function getBouteillesDansCeCellier($id_cellier, $id_usager)
	{
        $rows = Array();
		$requete ='SELECT 
                    cb.id_cellier,
                    cb.id_bouteille, 
                    cb.id_achats, 
                    cb.quantite,
                    cb.prix, 
                    cb.millesime, 
                    cb.garde_jusqua,
                    c.id as cellier_id_cellier,
                    c.nom, 
                    c.adresse as cellier_adresse,
                    c.id_usager,
                    b.id as bouteille_id_bouteille,
                    b.nom, 
                    b.image, 
                    b.code_saq,
                    b.description,
                    b.prix_saq,
                    b.url_saq,
                    b.url_img,
                    b.format, 
                    b.id_type, 
                    b.id_pays,
                    p.nom as pays_nom,
                    t.type,
                    u.id as usager_id_usager,
                    u.nom as usager_nom,
                    u.courriel,
                    u.phone,
                    u.adresse as usager_adresse,
                    v.nom as ville_nom
                    from vino__cellier_bouteille cb
                    INNER JOIN vino__cellier c ON cb.id_cellier = c.id
                    INNER JOIN vino__bouteille b ON cb.id_bouteille = b.id
                    INNER JOIN vino__pays p ON b.id_pays = p.id
                    INNER JOIN vino__type t ON b.id_type = t.id
                    INNER JOIN vino__usager u ON c.id_usager = u.id
                    INNER JOIN vino__ville v ON u.id_ville = v.id
                    WHERE id_cellier = '. $id_cellier .'
                    AND u.id = '. $id_usager .'
                    '; 
		if(($res = $this->_db->query($requete)) ==	 true)
		{
			if($res->num_rows)
			{
				while($row = $res->fetch_assoc())
				{
					$row['nom'] = trim(utf8_encode($row['nom']));
					$rows[] = $row;
				}
			}
		}
		else 
		{
			throw new Exception("Erreur de requête sur la base de donnée", 1);
			//$this->_db->error;
		}
		return $rows;
	}
	
	/**
	 * Cette méthode ajoute une ou des bouteilles au cellier
	 * @access public
	 * @param Array $data Tableau des données représentants la bouteille
	 * @return int Renvoie l'id de la bouteille ajoutée
	 */
	public function ajouterBouteilleCellier($data, $id_usager)
	{
        if (is_array($data) || is_object($data)) 
        {    
            if(extract($data) > 0)
            {
                $requete = "INSERT INTO vino__achats(`date_achat`) VALUES ('".$date_achat."')";
                $this->_db->query($requete);
                $id_achats = $this->_db->insert_id;

                $requete = "INSERT INTO vino__cellier_bouteille(`id_cellier`, `id_bouteille`, `id_achats`, `quantite`, `prix`, `millesime`, `garde_jusqua`) VALUES ('".$id_cellier. "','".$id_bouteille. "','". $id_achats. "','". $quantite. "','". $prix."','". $millesime."','". $garde_jusqua."')";
                $this->_db->query($requete);
                                
                $requete = "INSERT INTO vino__notes(`note`, `id_usager`, `cellier_bouteille_id_cellier`, `cellier_bouteille_id_bouteille`, `cellier_bouteille_id_achats` ) VALUES ('".$notes. "','". $id_usager. "','". $id_cellier."','". $id_bouteille."','". $id_achats. "')";
                $this->_db->query($requete);
            }
            return ($this->_db->insert_id ? $this->_db->insert_id : $requete);
        } else {
            echo "Une erreur s'est produite.";
        }
	}



    /**
	 * Cette méthode modifie le nombre de bouteilles au cellier
	 * @access public
	 * @param int $id L'id de la bouteille
	 * @param int $nombre Un identifiant qui permet de déterminer l'action - augmenter la quantité de 1 ou diminuer de 1 
	 * @return Boolean Succès ou échec de l'ajout.
	 */
	public function modifierQuantiteBouteilleCellier($id_cellier, $id_bouteille, $id_achats, $id_usager, $nombre) //$id_cellier??? et $id_bouteille
	{
        $qte = $this->getQuantite($id_cellier, $id_bouteille, $id_achats, $id_usager);	
		if($qte >= 0 && $nombre == -1){
			$requete = "UPDATE vino__cellier_bouteille
                        SET quantite = GREATEST(quantite + ". $nombre. ", 0)
                        WHERE id_cellier = ".$id_cellier."
                        AND id_bouteille = ".$id_bouteille."
                        AND id_achats = ".$id_achats."
                        ;";
                      
			$res = $this->_db->query($requete);
			return $res;

		} else if($qte >= 0 && $nombre == 1){
			$requete = "UPDATE vino__cellier_bouteille
                        SET quantite = GREATEST(quantite + ". $nombre. ", 0)
                        WHERE id_cellier = ".$id_cellier."
                        AND id_bouteille = ".$id_bouteille."
                        AND id_achats = ".$id_achats."
                        ;";

			$res = $this->_db->query($requete);
			return $res;
		}
		return 0;
	}

    /**
	 * Cette méthode Obtient le nombre de bouteilles avec l'id au cellier
	 * @access public
	 * @param int $id L'id de la bouteille.
	 * @return Number Le quantité de bouteilles.
	 */
	public function getQuantite($id_cellier, $id_bouteille, $id_achats, $id_usager){
       	$requete = "SELECT cb.quantite FROM vino__cellier_bouteille cb
                    INNER JOIN vino__cellier c ON cb.id_cellier = c.id
                    WHERE cb.id_cellier = ".$id_cellier."
                    AND cb.id_bouteille = ".$id_bouteille."
                    AND cb.id_achats = ".$id_achats."
                    AND c.id_usager = ".$id_usager.";";
        if(($res = $this->_db->query($requete)) ==	 true)
		{
            $res = $this->_db->query($requete)->fetch_object()->quantite;
		}
		else 
		{
			throw new Exception("Erreur de requête sur la base de donnée", 1);
			//$this->_db->error;
		}
        
		return $res;
       


        //$requete = "SELECT cb.quantite FROM vino__cellier_bouteille cb
        //            INNER JOIN vino__cellier c ON cb.id_cellier = c.id
        //            WHERE cb.id_cellier = ".$id_cellier."
        //            AND cb.id_bouteille = ".$id_bouteille."
        //            AND cb.id_achats = ".$id_achats."
        //            AND c.id_usager = ".$id_usager.";";
        //return $this->_db->query($requete);
	}
    
	/**
	 * Cette méthode annonce les celliers d'usager.
	 * @access public
	 * @return Array $data Tableau des données représentants la bouteille.
	 */
	public function getCelliersParUsager($id)
	{
        
		$rows = Array();
		$requete ='SELECT 
                    c.id as cellier_id_cellier,
                    c.nom, 
                    c.adresse as cellier_adresse,
                    c.id_usager,
                    u.id as usager_id_usager,
                    u.nom as usager_nom,
                    u.courriel,
                    u.phone,
                    u.adresse as usager_adresse,
                    v.nom as ville_nom
                    FROM vino__cellier c
                    INNER JOIN vino__usager u ON c.id_usager = u.id
                    INNER JOIN vino__ville v ON u.id_ville = v.id
                    WHERE id_usager = '. $id .'
                    '; 
		if(($res = $this->_db->query($requete)) ==	 true)
		{
			if($res->num_rows)
			{
				while($row = $res->fetch_assoc())
				{
					$row['nom'] = trim(utf8_encode($row['nom']));
					$rows[] = $row;
				}
			}
		}
		else 
		{
			throw new Exception("Erreur de requête sur la base de donnée", 1);
			//$this->_db->error;
		}
		return $rows;
	}



	/**
     * @Crossorigin
	 * Cette méthode ajoute un cellier
	 * @access public
	 * @param Array $data Tableau des données représentants la bouteille
	 * @return int Renvoie l'id de la bouteille ajoutée
	 */
	public function ajouterCellier($data)
	{
        if (is_array($data) || is_object($data)) 
        {    
            if(extract($data) > 0)
            {
                $requete = "INSERT INTO vino__cellier(`nom`, `adresse`, `id_usager`) VALUES ('".$nom."','".$adresse. "','". $id_usager."')";

                $this->_db->query($requete);
            }
            return ($this->_db->insert_id ? $this->_db->insert_id : $requete);
        } else {
            echo "Une erreur s'est produite.";
        }
	}

 
    /**
     * @Crossorigin
	 * Cette méthode modifie la bouteille
	 * @access public
	 * @param Array $param Paramètres et valeur à modifier 
	 * @return int id de la bouteille ou 0 en cas d'échec
	 */
	public function modifCellier($param)	
	{
		$aSet = Array();
		$resQuery = false;
        $id = $param['id'];
        if (is_array($param) || is_object($param)) 
        {
            foreach ($param as $cle => $valeur) 
            {
                $aSet[] = ($cle . "= '".$valeur. "'");
            }
            if(count($aSet) > 0)
            {
                $query = "Update vino__cellier SET ";
                $query .= join(", ", $aSet);
                $query .= (" WHERE id = ". $id); 
                $resQuery = $this->_db->query($query);
            }
            return ($resQuery ? $id : 0);
        } 
        else 
        {
            echo "Une erreur s'est produite.";
        }
	}


	/**
	 * Effacer un cellier
	 * @access public
	 * @param Array $id Identifiant du cellier  
	 * @return Boolean
	 */
	public function effacerCellier($id)
    {
		$resQuery = false;
		if(isset($id))
		{
			$id = $this->_db->real_escape_string($id);

            $query = "SET foreign_key_checks = 0";
            $resQuery = $this->_db->query($query);

            $query = "DELETE from vino__achats where cellier_bouteille_id_cellier = ". $id;
			$resQuery = $this->_db->query($query);

            $query = "DELETE from vino__notes where cellier_bouteille_id_cellier = ". $id;
			$resQuery = $this->_db->query($query);

			$query = "DELETE from vino__cellier_bouteille where id_cellier = ". $id;
			$resQuery = $this->_db->query($query);

            $query = "DELETE from vino__cellier where id = ". $id;
			$resQuery = $this->_db->query($query);
            
            $query = "SET foreign_key_checks = 1";
            $resQuery = $this->_db->query($query);
		}
		return $resQuery;
	}
}




?>