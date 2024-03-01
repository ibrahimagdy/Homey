class OnBoardingContent {
  final String image;
  final String title;
  final String desc;

  OnBoardingContent(
      {required this.image, required this.title, required this.desc});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
    image: "assets/images/onboarding_1.png",
    title: "Find Your perfect Student Home",
    desc:
        "Our mobile app is designed specifically\nfor college students looking for rental\napartments. Browse through a wide\nrange of student-friendly properties\nright from your phone.",
  ),
  OnBoardingContent(
      image: "assets/images/onboarding_2.png",
      title: "Budget-Friendly Options",
      desc:
          "We understand that as a student,\nbudget is key. Our app provides a\nrange of affordable rental options to\nsuit your needs."),
  OnBoardingContent(
      image: "assets/images/onboarding_3.png",
      title: "Direct Landlord Contact",
      desc:
          "Connect directly with landlords or\nproperty managers through our app.\nAsk questions, schedule viewings, and\neven sign your lease, all within the app."),
];
