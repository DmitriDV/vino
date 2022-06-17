<?php
/**
 * Class UsagerControleur
 * Controleur de la ressource Usager
 * 
 * @author Equipe de 4
 * @version 1.1
 * @update 2019-11-11
 * @license MIT
 */

  
class UsagerControlleur 
{
	private $retour = array('data'=>array());

	/**
	 * Méthode qui gère les action en GET
	 * @param Requete $requete
	 * @return Mixed Données retournées
	 */
	public function getAction(Requete $requete)
	{
        if(isset($requete->url_elements[0]) && is_numeric($requete->url_elements[0]))	// Normalement l'id d'usager
        {
            $id = 1;
            
			if(isset($requete->url_elements[1])) 
			{
                switch($requete->url_elements[1]) 
                {
                    case 'login':
                        $this->retour["data"] = $this->getLogUser($id, $requete->parametres);
                        break;
                    default:
                        $this->retour['erreur'] = $this->erreur(400);
                        unset($this->retour['data']);
                        break;
                }
            }
            else // Retourne les infos d'une usager
            {
                $this->retour["data"] = $this->getUsager($id);
            }
        } 
        else if(isset($requete->url_elements[0]))
        {
            switch($requete->url_elements[0]) 
                {
                    case 'usager':
                        $this->retour["data"] = $this->getUsager(1);
                        break;
                    case 'cellier':
                        $this->retour["data"] = $this->getCelliersParUsager(1);
                        break;
                    default:
                        $this->retour['erreur'] = $this->erreur(405);
                        unset($this->retour['data']);
                        break;
                }
            
        }
        
        return $this->retour;		
        
    }

    // public function getAction(Requete $requete)
	// {
    //     if(isset($requete->url_elements[0])) 
    //     {

    //         switch($requete->url_elements[0]) 
    //         {
    //             case 'login':
    //                 $this->retour["data"] = $this->getLogUser($requete->parametres);
    //                 break;
    //             default:
    //                 $this->retour['erreur'] = $this->erreur(400);
    //                 unset($this->retour['data']);
    //                 break;
    //         }
    //     }
    //     else // Retourne les infos d'une usager
    //     {
    //         $this->retour['erreur'] = $this->erreur(400);
    //     }


    //     return $this->retour;		
        
    // }
	
	/**
	 * Méthode qui gère les action en POST
	 * @param Requete $requete
	 * @return Mixed Données retournées
	 */
	public function postAction(Requete $requete)	// Modification
	{
		// if(!$this->valideAuthentification())
		// {
		// 	$this->retour['erreur'] = $this->erreur(401);
		// }
		// else {
			if(isset($requete->url_elements[0]))	// Action d'ajouter usager
			{
				switch($requete->url_elements[0]) 
					{
						case 'registre':
							$this->retour["data"] = $this->ajouterUneUsager($requete->parametres);
							break;
						default:
							$this->retour['erreur'] = $this->erreur(400);
							unset($this->retour['data']);
							break;
					}
			}
			else{
				$this->retour['erreur'] = $this->erreur(400);
				unset($this->retour['data']);
			}
		//}
	
		return $this->retour;
	}
	
	/**
	 * Méthode qui gère les action en PUT
	 * @param Requete $requete
	 * @return Mixed Données retournées
	 */
	public function putAction(Requete $requete)		//ajout
	{
		// if(!$this->valideAuthentification())
		// {
		// 	$this->retour['erreur'] = $this->erreur(401);
		// }
		// else{
			if(isset($requete->url_elements[0]))	// Normalement l'id de la biere 
			{
				$this->retour["data"] = $this->ajouterUneUsager($requete->parametres);
				
			}

		return $this->retour;
	}
	
	/**
	 * Méthode qui gère les action en DELETE
	 * @param Requete $oReq
	 * @return Mixed Données retournées
	 */
	public function deleteAction(Requete $requete)
	{
		// if(!$this->valideAuthentification())
		// {
		// 	$this->retour['erreur'] = $this->erreur(401);
		// }
		// else{
			if(isset($requete->url_elements[0]) && is_numeric($requete->url_elements[0]))	// Normalement l'id de la biere 
			{
				$id = (int)$requete->url_elements[0];
				
				$this->retour["data"] = $this->effacerUsager($id);
			}
			else{
				$this->retour['erreur'] = $this->erreur(400);
				unset($this->retour['data']);
			}
		// }

		return $this->retour;
		
	}
	
	/**
	 * Retourne les informations de la bière $id_biere
	 * @param int $id_biere Identifiant de la bière
	 * @return Array Les informations de la bière
	 * @access private
	 */	
	private function getUsager($id)
	{
		$res = Array();
		$oUsager = new Usager();
		$res = $oUsager->getUsager($id);
		return $res; 
	}

    /**
	 * Retourne les informations de la bière $id_biere
	 * @param int $id_biere Identifiant de la bière
	 * @return Array Les informations de la bière
	 * @access private
	 */	
	private function getCelliersParUsager($id)
	{
		$res = Array();
		$oUsager = new Cellier();
		$res = $oUsager->getCelliersParUsager($id);
		return $res; 
	}

    /**
	 * Retourne les informations des bières de la db	 
	 * @return Array Les informations sur toutes les bières
	 * @access private
	 */	
	private function getListeUsager()
	{
		$res = Array();
		$oUsager = new Usager();
		$res = $oUsager->getListeUsager();
		return $res; 
	}
	
	/**
	 * Modifie les informations de la bière $id_biere
	 * @param int $id_biere Identifiant de la bière
	 * @param Array Les informations de la bière
	 * @return int $id_biere Identifiant de la bière modifier
	 * @access private
	 */	
	private function modifUsager($id, $data)
	{
		$res = Array();
		$oUsager = new Usager();
		$res = $oUsager->modifierUsager($id, $data);
		return $res; 
	}
	
	/**
	 * Effacer la bière $id_biere
	 * @param int $id_biere Identifiant de la bière
	 * @return boolean Succès ou échec
	 * @access private
	 */	
	private function effacerUsager($id)
	{
		$res = Array();
		$orUsager = new Usager();
		$res = $orUsager->effacerUsager($id);
		return $res; 
	}

	/**
	 * Ajouter une bière 
	 * @param Array Les informations de la bière
	 * @return int $id_biere Identifiant de la nouvelle bière
	 * @access private
	 */	
	private function ajouterUneUsager($data)
	{
		$res = Array();
		$oUsager = new Usager();
		$res = $oUsager->ajouterUsager($data);
		return $res; 
	}

    /**
	 * Retourne les informations de la bière $id_biere
	 * @param int $id_biere Identifiant de la bière
	 * @return Array Les informations de la bière
	 * @access private
	 */	
	private function getLogUser($data)
	{
		$res = Array();
		$oUsager = new Usager();
		$res = $oUsager->getLoginUser($data);
		return $res; 
	}

	
	// /**
	//  * Valide les données d'authentification du service web
	//  * @return Boolean Si l'authentification est valide ou non
	//  * @access private
	//  */	
	// private function valideAuthentification()
    // {
    //   	$access = false;
	// 	$headers = apache_request_headers();
		
	// 	if(isset($headers['Authorization']) || isset($headers['authorization']))	//Fetch avec Chrome envoie authorization et non Authorization ! 
	// 	{
	// 		if(isset($_SERVER['PHP_AUTH_PW']) && isset($_SERVER['PHP_AUTH_USER']))
	// 		{
	// 			if($_SERVER['PHP_AUTH_PW'] == 'biero' && $_SERVER['PHP_AUTH_USER'] == 'biero')
	// 			{
	// 				$access = true;
	// 			}
	// 		}
	// 	}
    //   	return $access;
    // }

	
	private function erreur($code, $data="")
	{
		//header('HTTP/1.1 400 Bad Request');
		http_response_code($code);

		return array("message"=>"Erreur de requete", "code"=>$code);
		
	}

}