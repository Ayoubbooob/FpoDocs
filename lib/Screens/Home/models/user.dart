import 'package:flutter/material.dart';

class User {
  User(
      {this.role,
      this.prenom,
      this.nom,
      this.cin,
      this.massar,
      this.filliere,
      this.semestre});

  final String  role,  prenom, nom, cin, massar, filliere, semestre;

  factory User.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String role = data['Role'];

    final String prenom = data['Prénom'];
    final String nom = data['Nom'];
    final String cin = data['CIN'];
    final String massar = data['Massar'];
    final String filliere = data['Filière'];
    final String semestre = data['Semestre'];
    return User(
        role : role,
        prenom: prenom,
        nom: nom,
        cin: cin,
        massar: massar,
        filliere: filliere,
        semestre: semestre);
  }

  Map<String, dynamic> toMap() {
    return {
      'Role' : role,
      'Prénom': prenom,
      'Nom': nom,
      'CIN' : cin,
      'Massar' : massar,
      'Filière' : filliere,
      'Semestre' : semestre,
    };
  }
}
