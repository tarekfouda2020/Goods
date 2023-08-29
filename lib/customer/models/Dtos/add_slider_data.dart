import 'dart:io';

class AddSliderData {
  final String lang, desc, duration;
  final File image;

  AddSliderData({
    required this.lang,
    required this.desc,
    required this.duration,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "description": desc,
        "duration": duration,
        "lang": lang,
        "img": image,
      };
}
