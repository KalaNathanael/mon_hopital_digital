
abstract class Personne {
  String noms;
  String prenoms;
  String login;
  String sexe;
  String date_naissance;
  String password;
  String role;

  Personne({this.noms, this.prenoms, this.login, this.sexe, this.date_naissance, this.password, this.role});

  Personne.empty(){
    noms = "";
    prenoms = "";
    login = "";
    sexe = "";
    date_naissance = "";
    password = "";
    role = "";
  }
}