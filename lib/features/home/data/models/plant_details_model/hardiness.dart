class Hardiness {
  String? min;
  String? max;

  Hardiness({this.min, this.max});

  factory Hardiness.fromJson(Map<String, dynamic> json) => Hardiness(
        min: json['min'] as String?,
        max: json['max'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
      };
}
