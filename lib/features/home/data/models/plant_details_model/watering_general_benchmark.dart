class WateringGeneralBenchmark {
  dynamic value;
  String? unit;

  WateringGeneralBenchmark({this.value, this.unit});

  factory WateringGeneralBenchmark.fromJson(Map<String, dynamic> json) {
    return WateringGeneralBenchmark(
      value: json['value'] as dynamic,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
      };
}
