import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';

import 'default_image.dart';

class PlantModel extends PlantEntity {
  int? id;
  String? commonName;
  List<String>? scientificName;
  List<String>? otherName;
  dynamic family;
  dynamic hybrid;
  dynamic authority;
  dynamic subspecies;
  dynamic cultivar;
  dynamic variety;
  String? speciesEpithet;
  String? genus;
  DefaultImage? defaultImage;

  PlantModel({
    this.id,
    this.commonName,
    this.scientificName,
    this.otherName,
    this.family,
    this.hybrid,
    this.authority,
    this.subspecies,
    this.cultivar,
    this.variety,
    this.speciesEpithet,
    this.genus,
    this.defaultImage,
  }) : super(image: defaultImage!.licenseUrl!, title: commonName!, pId: id!);

  factory PlantModel.fromJson(Map<String, dynamic> json) => PlantModel(
        id: json['id'] as int?,
        commonName: json['common_name'] as String?,
        scientificName: json['scientific_name'] as List<String>?,
        otherName: json['other_name'] as List<String>?,
        family: json['family'] as dynamic,
        hybrid: json['hybrid'] as dynamic,
        authority: json['authority'] as dynamic,
        subspecies: json['subspecies'] as dynamic,
        cultivar: json['cultivar'] as dynamic,
        variety: json['variety'] as dynamic,
        speciesEpithet: json['species_epithet'] as String?,
        genus: json['genus'] as String?,
        defaultImage: json['default_image'] == null
            ? null
            : DefaultImage.fromJson(
                json['default_image'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'common_name': commonName,
        'scientific_name': scientificName,
        'other_name': otherName,
        'family': family,
        'hybrid': hybrid,
        'authority': authority,
        'subspecies': subspecies,
        'cultivar': cultivar,
        'variety': variety,
        'species_epithet': speciesEpithet,
        'genus': genus,
        'default_image': defaultImage?.toJson(),
      };
}
