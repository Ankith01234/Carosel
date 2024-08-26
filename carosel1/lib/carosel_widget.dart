import 'package:carosel1/login.dart';
import 'package:flutter/material.dart';

class CaroselWidget extends StatefulWidget {
  const CaroselWidget({super.key});

  @override
  State<CaroselWidget> createState() => _CaroselWidgetState();
}

class _CaroselWidgetState extends State<CaroselWidget> {
  List<String> myImages = [
    "Images/Photo1.png",
    "Images/Photo2.png",
    "Images/Photo3.png",
    "Images/Photo4.png"
  ];

  PageController pageController = PageController();

  List<Widget> pages = [];

  List<Color> myColors = [
    Colors.brown.shade400,
    Colors.deepPurpleAccent.shade100,
  ];

  int selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = List.generate(
        myImages.length, (index) => ImageHolder(imagePath: myImages[index]));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              selectIndex = selectIndex+1;
            });
            if(selectIndex==4)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              selectIndex=3;
            }
            else
            {
              pageController.jumpToPage(selectIndex);
            }
          },
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_forward),
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 60,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: myImages.length,
                      onPageChanged: (value) {
                        setState(() {
                          selectIndex = value;
                        });
                      },
                      itemBuilder: (BuildContext context, index) {
                        return pages[index];
                      }),
                ),
                Positioned(
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: myImages.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: selectIndex == index ? 8 : 6,
                                    backgroundColor: selectIndex == index
                                        ? Colors.blueGrey
                                        : Colors.white,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()));
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageHolder extends StatelessWidget {
  const ImageHolder({super.key, required this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
            // color: Colors.,
            child: Image.asset(
          imagePath!,
        )),
      ),
    );
  }
}
