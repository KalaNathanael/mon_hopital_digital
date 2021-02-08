
abstract class Personne {
  String noms;
  String prenoms;
  String login;
  String sexe;
  String date_naissance;
  String password;
  String role;
  String contact;

  Personne({this.noms, this.prenoms, this.login, this.sexe, this.date_naissance, this.password, this.role, this.contact});

  Personne.empty(){
    noms = "";
    prenoms = "";
    sexe = "";
    date_naissance = "";
    role = "";
    contact = "";
  }
}