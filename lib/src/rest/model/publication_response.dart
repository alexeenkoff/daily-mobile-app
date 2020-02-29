class PublicationResponse {
  final String id;
  final String name;
  final String image;
  final bool enabled;
  final String twitter;

  PublicationResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        enabled = json['enabled'],
        twitter = json['twitter'];
}
