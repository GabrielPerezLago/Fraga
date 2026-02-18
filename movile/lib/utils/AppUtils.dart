class AppUtils {
  String? getUrlImages(String img) {
    final Map<String, String> images = {
      "setas": "assets/images/setas.jpg",
      "senderismo": "assets/images/senderismo.jpeg",
      "yoga": "assets/images/yoga.jpg",
      "ciclismo": "assets/images/ciclismo.jpg"
    };

    return images[img];
  }
}