    <?php
        class Article{
            private $table="article";
            private $connexion;

            private $art_id;
            private $art_nom;
            private $art_prix;
            private $art_float;
            private $art_pattern;

 
            public function __construct($connexion){
                $this->connexion = $connexion;
            }

            public function getArt_id(){
                return $this->art_id;
            }

            public function getArt_nom(){
                return $this->art_nom;
            }

            public function getArt_prix(){
                return $this->art_prix;
            }

            public function getArt_pattern(){
                return $this->art_pattern;
            }
            
            public function getArt_float(){
                return $this->art_float;
            }

            public function setArt_id($id){
                $this->art_id = $id;
            }

            public function setArt_nom($nom){
                $this->art_nom = $nom;
            }

            public function setArt_prix($prix){
                $this->art_prix = $prix;
            }

            public function setArt_float($float){
                $this->art_float = $float;
            }

            public function setArt_pattern($pattern){
                $this->art_pattern = $pattern;
            }


            public function getAll(){
                $query = $this->connexion->prepare("SELECT art_id, art_nom, art_prix, art_float, art_pattern
                FROM ".$this->table);
                $query->execute();
                $result = $query->fetchAll();
                $this->connexion = null;
                return $result;
            }

            public function getById($id){
                $query = $this->connexion->prepare("SELECT art_id, art_nom, art_prix, art_float, art_pattern
                FROM ".$this->table." WHERE art_id = :id");
                $query-> execute(array("id"=> $id));
                $result = $query->fetchObject();
                $this->connexion = null;
                return $result;
            }

            public function insert(){
                $query = $this->connexion->prepare("INSERT INTO ".$this->table."(art_nom, art_prix, art_float, art_pattern) 
                VALUES (:nom, :prix, :float, :pattern)");

                $result = $query->execute(array(
                    "nom"=>$this->art_nom,
                    "prix"=>$this->art_prix,
                    "float"=>$this->art_float,
                    "pattern"=>$this->art_pattern,

                ));
                $this->connexion = null;
                return $result;
            }

            public function update(){
                $query = $this->connexion->prepare("UPDATE ".$this->table." SET art_nom = :nom, art_prix = :prix, art_float = :float, art_pattern = :pattern 
                WHERE art_id = :id");

                $result = $query->execute(array(
                    "id" =>$this-> art_id,
                    "nom"=>$this->art_nom,
                    "prix"=>$this->art_prix,
                    "float"=>$this->art_float,
                    "pattern"=>$this->art_pattern,
                ));
                $this->connexion = null;
                return $result;
            }

            public function delete(){
                $query = $this->connexion->prepare("DELETE FROM ".$this->table." WHERE art_id = :id");
                $result = $query->execute(array(
                    "id" =>$this-> art_id
                ));
                $this->connexion = null;
                return $result;
            }
        }
    ?>