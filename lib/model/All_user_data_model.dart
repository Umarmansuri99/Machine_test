class All_user_data_list {
  int id;
  String name;
  String email;
  String profilepicture;
  String location;
  String createdat;


  All_user_data_list({
    this.id = 0,
    this.name="",
    this.email="",
    this.location="",
    this.profilepicture="",
    this.createdat="",

  });

  factory All_user_data_list.fromJson(Map<String, dynamic> json) => All_user_data_list(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    location: json["location"] ?? "",
    profilepicture: json["profilepicture"] ?? "",
    createdat: json["createdat"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "location": location,
    "profilepicture": profilepicture,
    "createdat": createdat,
  };
}
