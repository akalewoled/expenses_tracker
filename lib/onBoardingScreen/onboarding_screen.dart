import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  bool isLastPage = false;

  @override
  void initState() {
      _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        isLastPage = _pageController.page!.round() == demoData.length - 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) =>
                 OnboardContent(
                  image: demoData[index].image,
                  title: demoData[index].title,
                  description: demoData[index].description,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 60,
              
              child: ElevatedButton(
                
                onPressed: () {
                  if (isLastPage){
                    Navigator.pushNamed(context, '/login'); 
                  }else{
                 _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  }
                },
                style: ElevatedButton.styleFrom(
                   
                  shape: const CircleBorder(),
                ),
                child: Center(child: Icon(
                  Icons.arrow_forward,
                  color: Colors.pink,
  
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: 'assets/n06.png',
    title: 'Gain Financial Clarity',
    description: 'Start your journey to financial success with our Expense Tracker app. Track every penny you spend, analyze your spending patterns, and make informed decisions about your finances. Take control of your money and achieve your financial goals effortlessly.',
  ),
  Onboard(
    image: 'assets/no5.png',
    title: 'Budget Smarter, Spend Wisely',
    description: 'Empower yourself with our Expense Tracker app and revolutionize the way you manage your money. Set personalized budgets, receive real-time expense notifications, and optimize your spending for maximum savings. With our app by your side, financial freedom is within reach',
  ),
  Onboard(
    image: 'assets/no4.png',
    title: 'Simplify Your Finances',
    description: 'Simplify your financial life with our intuitive Expense Tracker app. Say goodbye to tedious manual tracking and hello to automated expense management. Streamline your finances, stay organized, and focus on what truly matters in life. Let our app be your financial companion on the road to prosperity.',
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ],
    );
  }
}
