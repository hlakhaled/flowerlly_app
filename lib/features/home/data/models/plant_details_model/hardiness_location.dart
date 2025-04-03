class HardinessLocation {
  String? fullUrl;
  String? fullIframe;

  HardinessLocation({this.fullUrl, this.fullIframe});

  factory HardinessLocation.fromJson(Map<String, dynamic> json) {
    return HardinessLocation(
      fullUrl: json['full_url'] as String?,
      fullIframe: json['full_iframe'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'full_url': fullUrl,
        'full_iframe': fullIframe,
      };
}
