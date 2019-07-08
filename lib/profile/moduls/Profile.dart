class Profile {

  final String name;
  final String surname;
  final String image;
  final String description;

  Profile(this.name, this.surname, this.image, this.description);

  Profile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'],
        image = json["image"],
        description = json["description"];
}