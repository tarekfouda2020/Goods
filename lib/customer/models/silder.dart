class SliderModel {
  final String title, description, img, link;
  final int type;

  SliderModel({
    required this.title,
    required this.description,
    required this.img,
    required this.link,
    required this.type,
  });
  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        title: json["title"],
        description: json["description"],
        img: json["img"],
        link: json["link"],
        type: json["type"],
      );
}
