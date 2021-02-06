
class Allergie {
  String nom;
  String cause;
  String cure;
  String prevention;

  Allergie({ nom: "", cause : "", cure : "", prevention : ""}){
    this.nom = nom;
    this.cause = cause;
    this.cure = cure;
    this.prevention = prevention;
  }

  Allergie.empty(){
    nom = "";
    cause = "";
    cure = "";
    prevention = "";
  }
}