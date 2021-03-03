import 'package:instantsewa/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
        PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    contentPadding: const EdgeInsets.all(10),
  );
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset('images/photos/onBoarding1.png'),
          title: 'Select Service Provider',
          body: 'Choose service providers according to your preferences.',
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset('images/photos/onBoarding2.png'),
          title: 'Select Service Provider',
          body: 'Choose service providers according to your preferences.',
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset('images/photos/onBoarding4.png'),
          title: 'Select Service Provider',
          body: 'Choose service providers according to your preferences.',
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset('images/photos/onBoarding5.png'),
          title: 'Select Service Provider',
          body: 'Choose service providers according to your preferences.',
          decoration: pageDecoration),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: getPages(),
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.purple[200],
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        done: Text(
          'Get Started',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            backgroundColor: Colors.purple[200],
          ),
        ),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        onSkip: () {
          Navigator.pushNamed(context, loginRoute);
        },
        next: Icon(Icons.keyboard_arrow_right),
        onDone: () {
          Navigator.pushNamed(context, loginRoute);
        },
      ),
    );
  }
}
