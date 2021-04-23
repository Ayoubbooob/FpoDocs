

import 'package:flutter/material.dart';

class Options {
  final String image, title, description;
  final int size, id;
  final Color color;
  Options({
    this.id,
    this.image,
    this.title,
    this.description,
    this.size,
    this.color,
  });
}

List<Options> options = [
  Options(
      id: 1,
      title: "Demander Documents",
      size: 20,
      description: 'Si vous voulez demander un document vous devez choisir cette option',
      image: "assets/images/demander_docs.png",
      color: Color(0xFF3D82AE)),

  Options(
      id: 2,
      title: "Suivre Mes Demandes",
      size: 8,
      description: 'Si vous voulez savoir l\'état de votre demandes vous devez choisir cette option',
      image: "assets/images/suivre_demandes.png",
      color: Color(0xFFD3A984)),
  Options(
      id: 3,
      title: "Connecter Le Service",
      size: 10,
      description: 'Si vous voulez savoir plus d\'informations vous devez choisir cette option',
      image: "assets/images/contact_service.png",
      color: Color(0xFF989493)),
  Options(
      id: 4,
      title: "Mes Informations",
      size: 11,
      description: 'Si vous voulez consulter votre informations vous devez choisir cette option',
      image: "assets/images/info_client.png",
      color: Color(0xFFE6B398)),
  Options(
      id: 5,
      title: "Lire Attentivement",
      size: 12,
      description: 'Pour savoir comment effectuer des opération sur votre application nous vous recommendez de lire ces renseignements',
      image: "assets/images/app_guide.png",
      color: Color(0xFFFB7883)),
];