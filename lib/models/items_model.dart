class Items {
  final String img;
  final String title;
  final String subTitle;

  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
      img: "assets/images/onboardingscreen1.png",
      title: "BERRY JUICE",
      subTitle:
          "We provide a variety of fresh\njuices with various flavours.\n    Get fresh juices easily"),
  Items(
      img: "assets/images/onboardingscreen2.png",
      title: "BERRY JUICE",
      subTitle:
          "   A \"Moments of healthy sip\nThe best vitamin for your health"),
];
