class PlantAnatomy {
  String? part;
  List<dynamic>? color;

  PlantAnatomy({this.part, this.color});

  factory PlantAnatomy.fromJson(Map<String, dynamic> json) => PlantAnatomy(
        part: json['part'] as String?,
        color: json['color'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'part': part,
        'color': color,
      };
}
