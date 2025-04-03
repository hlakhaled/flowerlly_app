class DefaultImage {
  int? license;
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
  String? regularUrl;
  String? mediumUrl;
  String? smallUrl;
  String? thumbnail;

  DefaultImage({
    this.license,
    this.licenseName,
    this.licenseUrl,
    this.originalUrl,
    this.regularUrl,
    this.mediumUrl,
    this.smallUrl,
    this.thumbnail,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) => DefaultImage(
        license: json['license'] as int?,
        licenseName: json['license_name'] as String?,
        licenseUrl: json['license_url'] as String?,
        originalUrl: json['original_url'] as String?,
        regularUrl: json['regular_url'] as String?,
        mediumUrl: json['medium_url'] as String?,
        smallUrl: json['small_url'] as String?,
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'license': license,
        'license_name': licenseName,
        'license_url': licenseUrl,
        'original_url': originalUrl,
        'regular_url': regularUrl,
        'medium_url': mediumUrl,
        'small_url': smallUrl,
        'thumbnail': thumbnail,
      };
}
