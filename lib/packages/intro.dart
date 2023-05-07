import 'package:flutter/material.dart';
import 'package:pdpui_intro_4/packages/strings.dart';

import 'homepage.dart';


class IntroPage extends StatefulWidget {
  static String id = "intro_page";
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {

    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;

              });
            },
            controller: pageController,
            children: [
              makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
              ),
              makePage(
                  reverse: true,
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent
              ),
              makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                  skip: "Skip"

              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildIndicator(),
            ),
          )

        ],

      ),
    );
  }

  Widget makePage({image, title, content, reverse = false, skip = ""}){

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 50,right: 50,bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(title, textAlign: TextAlign.center,style: const TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 30,),
              Text(content, textAlign: TextAlign.center, style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400
              ),),
              const SizedBox(height: 30,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(image),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),


            ],
          ),


        ),



        Container(
          padding: const EdgeInsets.only(bottom: 70,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, HomePage.id);
                },
                child:  Text(skip, style: const TextStyle(color: Colors.red, fontSize: 22,letterSpacing: 0.1 ,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        )
      ],
    );

  }

  Widget indicator(bool isActive){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> buildIndicator(){
    List<Widget> indicators = [];
    for(int i = 0; i <3; i++){
      if(currentIndex == i){
        indicators.add(indicator(true));
      }else{
        indicators.add(indicator(false));
      }
    }
    return indicators;
  }

}

