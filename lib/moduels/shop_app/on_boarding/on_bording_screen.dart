import 'package:flutter/material.dart';
import 'package:shop_app_laith/component/components.dart';
import 'package:shop_app_laith/model/model.dart';
import 'package:shop_app_laith/moduels/shop_app/login_Screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnBordingScreen extends StatefulWidget {
  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {

  var boardController = PageController();

  bool isLast = false;

  List<BoardingModel> boarding = [

    BoardingModel(
        image: 'image/onboard_1.jpg',
        title: 'on board 1',
        body: 'On bord1Body'),
    BoardingModel(
        image: 'image/onboard_2.jpg',
        title: 'on board 2',
        body: 'On bord2Body'),
    BoardingModel(
        image: 'image/onboard_4.jpg',
        title: 'on board 3',
        body: 'On bord3Body'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                navigatTo(context, LoginScreen());
              },
              child: Text('SKIP',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold ),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    print('last');
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    print('not last');
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingIteam(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotHeight: 10,
                    expansionFactor: 4.0,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      // navigatTo(context,LoginScreen());
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) => LoginScreen()));
                      navigatToAndDelete(context, LoginScreen());
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.easeInCubic);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingIteam(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(
                '${model.image}',
              ),
              width: 600,
              height: 300,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
}
