class Get_profile_model {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Get_profile_model({
    this.id = 0,
    this.albumId = 0,
    this.url="",
    this.thumbnailUrl="",
    this.title="",

  });

  factory Get_profile_model.fromJson(Map<String, dynamic> json) => Get_profile_model(
    id: json["id"] ?? "",
    albumId: json["albumId"] ?? "",
    url: json["url"] ?? "",
    thumbnailUrl: json["thumbnailUrl"] ?? "",
    title: json["title"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "albumId": albumId,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
    "title": title,
  };
}
