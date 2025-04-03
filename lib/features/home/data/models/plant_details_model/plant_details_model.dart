import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';

import 'default_image.dart';
import 'dimension.dart';
import 'hardiness.dart';
import 'hardiness_location.dart';
import 'plant_anatomy.dart';
import 'watering_general_benchmark.dart';

class PlantDetailsModel extends PlantDetailsEntity {
  int? id;
  String? commonName;
  List<dynamic>? scientificName;
  List<dynamic>? otherName;
  String? family;
  dynamic hybrid;
  dynamic authority;
  dynamic subspecies;
  dynamic cultivar;
  dynamic variety;
  String? speciesEpithet;
  String? genus;
  List<dynamic>? origin;
  String? type;
  List<Dimension>? dimensions;
  String? cycle;
  List<dynamic>? attracts;
  List<dynamic>? propagation;
  Hardiness? hardiness;
  HardinessLocation? hardinessLocation;
  String? watering;
  WateringGeneralBenchmark? wateringGeneralBenchmark;
  List<PlantAnatomy>? plantAnatomy;
  List<dynamic>? sunlight;
  List<dynamic>? pruningMonth;

  bool? seeds;
  String? maintenance;
  String? careGuides;
  List<dynamic>? soil;
  String? growthRate;
  bool? droughtTolerant;
  bool? saltTolerant;
  bool? thorny;
  bool? invasive;
  bool? tropical;
  bool? indoor;
  String? careLevel;
  List<dynamic>? pestSusceptibility;
  bool? flowers;
  dynamic floweringSeason;
  bool? cones;
  bool? fruits;
  bool? edibleFruit;
  dynamic harvestSeason;
  bool? leaf;
  bool? edibleLeaf;
  bool? cuisine;
  bool? medicinal;
  bool? poisonousToHumans;
  bool? poisonousToPets;
  String? description;
  DefaultImage? defaultImage;
  String? otherImages;
  String? xWateringQuality;
  String? xWateringPeriod;
  String? xWateringAvgVolumeRequirement;
  String? xWateringDepthRequirement;
  String? xWateringBasedTemperature;
  String? xWateringPhLevel;
  String? xSunlightDuration;
  String? xTemperatureTolence;
  String? xPlantSpacingRequirement;

  PlantDetailsModel({
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
    this.origin,
    this.type,
    this.dimensions,
    this.cycle,
    this.attracts,
    this.propagation,
    this.hardiness,
    this.hardinessLocation,
    this.watering,
    this.wateringGeneralBenchmark,
    this.plantAnatomy,
    this.sunlight,
    this.pruningMonth,
    this.seeds,
    this.maintenance,
    this.careGuides,
    this.soil,
    this.growthRate,
    this.droughtTolerant,
    this.saltTolerant,
    this.thorny,
    this.invasive,
    this.tropical,
    this.indoor,
    this.careLevel,
    this.pestSusceptibility,
    this.flowers,
    this.floweringSeason,
    this.cones,
    this.fruits,
    this.edibleFruit,
    this.harvestSeason,
    this.leaf,
    this.edibleLeaf,
    this.cuisine,
    this.medicinal,
    this.poisonousToHumans,
    this.poisonousToPets,
    this.description,
    this.defaultImage,
    this.otherImages,
    this.xWateringQuality,
    this.xWateringPeriod,
    this.xWateringAvgVolumeRequirement,
    this.xWateringDepthRequirement,
    this.xWateringBasedTemperature,
    this.xWateringPhLevel,
    this.xSunlightDuration,
    this.xTemperatureTolence,
    this.xPlantSpacingRequirement,
  }) : super(
          titleEntity: commonName ?? "",
          idEntity: id ?? 0,
          typeEntity: type ?? "",
          originEntity: origin ?? [],
          image: defaultImage?.originalUrl ?? "",
          descriptionEntity: description ?? "",
          careLevelEntity: careLevel ?? "",
          growthRateEntity: growthRate ?? "",
          pruningMonthEntity: pruningMonth ?? [],
          propagationEntity: propagation ?? [],
          attractsEntity: attracts ?? [],
          floweringSeasonEntity: '',
        );

  factory PlantDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlantDetailsModel(
      id: json['id'] as int?,
      commonName: json['common_name'] as String?,
      scientificName: json['scientific_name'] as List<dynamic>?,
      otherName: json['other_name'] as List<dynamic>?,
      family: json['family'] as String?,
      hybrid: json['hybrid'] as dynamic,
      authority: json['authority'] as dynamic,
      subspecies: json['subspecies'] as dynamic,
      cultivar: json['cultivar'] as dynamic,
      variety: json['variety'] as dynamic,
      speciesEpithet: json['species_epithet'] as String?,
      genus: json['genus'] as String?,
      origin: json['origin'] as List<dynamic>?,
      type: json['type'] as String?,
      dimensions: (json['dimensions'] is List)
          ? (json['dimensions'] as List<dynamic>)
              .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      cycle: json['cycle'] as String?,
      attracts: json['attracts'] as List<dynamic>?,
      propagation: json['propagation'] as List<dynamic>?,
      hardiness: json['hardiness'] == null
          ? null
          : Hardiness.fromJson(json['hardiness'] as Map<String, dynamic>),
      hardinessLocation: json['hardiness_location'] == null
          ? null
          : HardinessLocation.fromJson(
              json['hardiness_location'] as Map<String, dynamic>),
      watering: json['watering'] as String?,
      wateringGeneralBenchmark: json['watering_general_benchmark'] == null
          ? null
          : WateringGeneralBenchmark.fromJson(
              json['watering_general_benchmark'] as Map<String, dynamic>),
      plantAnatomy: (json['plant_anatomy'] as List<dynamic>?)
          ?.map((e) => PlantAnatomy.fromJson(e as Map<String, dynamic>))
          .toList(),
      sunlight: json['sunlight'] as List<dynamic>?,
      pruningMonth: json['pruning_month'] as List<dynamic>?,
      seeds: json['seeds'] as bool?,
      maintenance: json['maintenance'] as String?,
      careGuides: json['care_guides'] as String?,
      soil: json['soil'] as List<dynamic>?,
      growthRate: json['growth_rate'] as String?,
      droughtTolerant: json['drought_tolerant'] as bool?,
      saltTolerant: json['salt_tolerant'] as bool?,
      thorny: json['thorny'] as bool?,
      invasive: json['invasive'] as bool?,
      tropical: json['tropical'] as bool?,
      indoor: json['indoor'] as bool?,
      careLevel: json['care_level'] as String?,
      pestSusceptibility: json['pest_susceptibility'] as List<dynamic>?,
      flowers: json['flowers'] as bool?,
      floweringSeason: json['flowering_season'] as dynamic,
      cones: json['cones'] as bool?,
      fruits: json['fruits'] as bool?,
      edibleFruit: json['edible_fruit'] as bool?,
      harvestSeason: json['harvest_season'] as dynamic,
      leaf: json['leaf'] as bool?,
      edibleLeaf: json['edible_leaf'] as bool?,
      cuisine: json['cuisine'] as bool?,
      medicinal: json['medicinal'] as bool?,
      poisonousToHumans: json['poisonous_to_humans'] as bool?,
      poisonousToPets: json['poisonous_to_pets'] as bool?,
      description: json['description'] as String?,
      defaultImage: json['default_image'] == null
          ? null
          : DefaultImage.fromJson(
              json['default_image'] as Map<String, dynamic>),
      otherImages: json['other_images'] as String?,
      xWateringQuality: json['xWateringQuality'] as String?,
      xWateringPeriod: json['xWateringPeriod'] as String?,
      xWateringAvgVolumeRequirement:
          json['xWateringAvgVolumeRequirement'] as String?,
      xWateringDepthRequirement: json['xWateringDepthRequirement'] as String?,
      xWateringBasedTemperature: json['xWateringBasedTemperature'] as String?,
      xWateringPhLevel: json['xWateringPhLevel'] as String?,
      xSunlightDuration: json['xSunlightDuration'] as String?,
      xTemperatureTolence: json['xTemperatureTolence'] as String?,
      xPlantSpacingRequirement: json['xPlantSpacingRequirement'] as String?,
    );
  }

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
        'origin': origin,
        'type': type,
        'dimensions': dimensions?.map((e) => e.toJson()).toList(),
        'cycle': cycle,
        'attracts': attracts,
        'propagation': propagation,
        'hardiness': hardiness?.toJson(),
        'hardiness_location': hardinessLocation?.toJson(),
        'watering': watering,
        'watering_general_benchmark': wateringGeneralBenchmark?.toJson(),
        'plant_anatomy': plantAnatomy?.map((e) => e.toJson()).toList(),
        'sunlight': sunlight,
        'pruning_month': pruningMonth,
        'seeds': seeds,
        'maintenance': maintenance,
        'care_guides': careGuides,
        'soil': soil,
        'growth_rate': growthRate,
        'drought_tolerant': droughtTolerant,
        'salt_tolerant': saltTolerant,
        'thorny': thorny,
        'invasive': invasive,
        'tropical': tropical,
        'indoor': indoor,
        'care_level': careLevel,
        'pest_susceptibility': pestSusceptibility,
        'flowers': flowers,
        'flowering_season': floweringSeason,
        'cones': cones,
        'fruits': fruits,
        'edible_fruit': edibleFruit,
        'harvest_season': harvestSeason,
        'leaf': leaf,
        'edible_leaf': edibleLeaf,
        'cuisine': cuisine,
        'medicinal': medicinal,
        'poisonous_to_humans': poisonousToHumans,
        'poisonous_to_pets': poisonousToPets,
        'description': description,
        'default_image': defaultImage?.toJson(),
        'other_images': otherImages,
        'xWateringQuality': xWateringQuality,
        'xWateringPeriod': xWateringPeriod,
        'xWateringAvgVolumeRequirement': xWateringAvgVolumeRequirement,
        'xWateringDepthRequirement': xWateringDepthRequirement,
        'xWateringBasedTemperature': xWateringBasedTemperature,
        'xWateringPhLevel': xWateringPhLevel,
        'xSunlightDuration': xSunlightDuration,
        'xTemperatureTolence': xTemperatureTolence,
        'xPlantSpacingRequirement': xPlantSpacingRequirement,
      };
}
