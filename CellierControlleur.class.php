<?php
/**
 * Class CellierControleur
 * Controleur de la ressource Cellier
 * 
 * @author Equipe de 4
 * @version 1.1
 * @update 2022-06-18
 * @license MIT
 */

  
class CellierControlleur 
{
	private $retour = array('data'=>array());

	/**
	 * Méthode qui gère les action en GET
     * @access public
	 * @param Requete $requete
	 * @return Mixed Données retournées
	 */
	public function getAction(Requete $requete)
	{
        // cellier
        if(isset($requete->url_elements[0]) && !is_numeric($requete->url_elements[0]))
        {   
            /** id_usager par default */
            $id_usager = 1;
            switch($requete->url_elements[0]) 
                {                    
                    case 'cellier':
                        if(isset($requete->url_elements[1]) && is_numeric($requete->url_elements[1]))
                        {
                            $id_cellier = (int)$requete->url_elements[1];
                            $this->retour["data"] = $this->getBouteillesDansCeCellier($id_cellier, $id_usager);
                            break;
                        }
                        else
                        {
                            $this->retour['erreur'] = $this->erreur(400);
                            unset($this->retour['data']);
                        }
                        
                    default:
                        $this->retour['erreur'] = $this->erreur(400);
                        unset($this->retour['data']);
                        break;
                }                
        } 
        else
        {
            $this->retour['erreur'] = $this->erreur(400);
        }
        return $this->retour;	
	}
	

	/**
	 * Méthode qui retourne les bouteilles dans le cellier avec id_cellier et id_usager
     * @access public
	 * @param int $id_cellier du cellier
     * @param int $id_bouteille du cellier
	 * @return Array Tableau d'information sur la bouteille retournée
	 */
    private function getBouteillesDansCeCellier($id_cellier) 
    {
        $res = Array();
		$oCellier = new Cellier();
		$res = $oCellier->getBouteillesDansCeCellier($id_cellier);
		
		return $res; 
    }

    	
    /**
	 * Afficher des erreurs
	 * @access private
	 * @param String Le code d'erreur
	 * @return Array Les message d'erreurs
	 */	
	private function erreur($code, $data="")
	{
		//header('HTTP/1.1 400 Bad Request');
		http_response_code($code);

		return array("message"=>"Erreur de requete", "code"=>$code);
	}

}
