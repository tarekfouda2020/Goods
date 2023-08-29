
// ignore_for_file: file_names

class SliderModel{
  final String image;
  final String? link;

  SliderModel({required this.image, required this.link});

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    image: json["img"],
    link: json["link"],
  );
}