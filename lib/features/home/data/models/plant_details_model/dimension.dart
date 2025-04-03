class Dimension {
  String? type;
  int? minValue;
  int? maxValue;
  String? unit;

  Dimension({this.type, this.minValue, this.maxValue, this.unit});

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
        type: json['type'] as String?,
        minValue: json['min_value'] as int?,
        maxValue: json['max_value'] as int?,
        unit: json['unit'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'min_value': minValue,
        'max_value': maxValue,
        'unit': unit,
      };
}
