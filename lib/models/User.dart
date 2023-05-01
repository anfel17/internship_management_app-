class User {
  int? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? birthPlace;
  int? phoneNumber;
  int? cardNumber;
  String? diploma;
  String? specialty;
  String? photoUrl;

  User({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.birthPlace,
    this.phoneNumber,
    this.cardNumber,
    this.diploma,
    this.specialty,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id_etudiant'],
      email: json['email'],
      password: json['password'],
      firstName: json['nom_etudiant'],
      lastName: json['prenom_etudiant'],
      birthDate: json['date_naissance'],
      birthPlace: json['lieu_naissance'],
      phoneNumber: json['tel_etudiant'],
      cardNumber: json['num_carte'],
      diploma: json['diplome'],
      specialty: json['specialite'],
      photoUrl: json['photo_etudiant'],
    );
  }
}
