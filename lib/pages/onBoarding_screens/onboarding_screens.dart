import 'package:flutter/material.dart';
import 'package:homey/pages/login_screen/login_screen.dart';
import 'package:homey/pages/onBoarding_screens/onboarding_content.dart';

class OnBoarding extends StatefulWidget {
  static const String routeName = "onBoarding";

  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        itemCount: contents.length,
        controller: controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_screen.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    contents[i].image,
                  ),
                  SizedBox(height: mediaQuery.height * 0.03),
                  Text(
                    contents[i].title,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  Text(
                    contents[i].desc,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediaQuery.height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildContainer(index, context),
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.03),
                  SizedBox(
                    width: mediaQuery.width * 0.75,
                    height: mediaQuery.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        }
                        controller.nextPage(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.linear,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        currentIndex == contents.length - 1
                            ? "Get Started!"
                            : "Next",
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildContainer(int index, BuildContext context) {
    return Container(
      height: currentIndex == index ? 10 : 6,
      width: currentIndex == index ? 10 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
