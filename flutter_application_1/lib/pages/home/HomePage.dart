import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/Net.dart';
import 'detail/DetailPage.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  // ignore: non_constant_identifier_names
  List<dynamic> _Listdata = [];

  late List<int> _currentIndex = [0,0,0];
  late List<PageController> _pageController;

  late List<Timer> _timer;
  
  @override
  initState() {
    _updata();
    super.initState();
    _pageController = List.generate(3, (index) => PageController(initialPage: _currentIndex[index]));

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    startTimer();
  });
  }
void startTimer() {
  //间隔两秒时间
  _timer = List.generate(3, (index){
    return Timer.periodic(Duration(milliseconds: 2000 + index * 500), (value) {
    _currentIndex[index]++;
    _currentIndex[index] %= 3;
    //触发轮播切换
    _pageController[index].animateToPage(_currentIndex[index],
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
    //刷新
    setState(() {

    });
  });
  });
  }
  _updata() async {
    // ignore: non_constant_identifier_names
    List Listdata = await display_goods();
    Listdata.shuffle();
    setState(() {
      _Listdata = Listdata;
    });
  }


  int n = 5;
  //int t = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
          children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(168, 7, 255, 226),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Text(
                                'Welcome!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 30),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Text(
                                'Find your Dream Space To Getaway!',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(
                                top: 20, left: 15, right: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(213, 12, 238, 178),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search something here...',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.amber,
                      //padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            margin: const EdgeInsets.only(
                                top: 5, left: 10, right: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: const Color.fromARGB(125, 180, 203, 205),
                            ),
                            child: PageView(
                              controller: _pageController[0],
                              pageSnapping: true,
                              children: [
                                Image.asset('./images/3.png',
                                    width: 200, height: 250, fit: BoxFit.fill),
                                Image.asset('./images/9.png',
                                    width: 200, height: 250, fit: BoxFit.fill),
                                Image.asset('./images/6.png',
                                    width: 200, height: 250, fit: BoxFit.fill),
                              ],
                            ),
                          ),
                          Container(
                              width: 200,
                              margin: const EdgeInsets.only(
                                  top: 5, left: 5, right: 10),
                              //padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                //color: Color.fromARGB(127, 6, 244, 252),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    padding: const EdgeInsets.all(5),
                                    color:
                                        const Color.fromARGB(125, 180, 203, 205),
                                    child: PageView(
                                      controller: _pageController[1],
                                      pageSnapping: true,
                                      children: [
                                        Image.asset('./images/3.png',
                                            width: 100,
                                            height: 125,
                                            fit: BoxFit.fill),
                                        Image.asset('./images/9.png',
                                            width: 100,
                                            height: 125,
                                            fit: BoxFit.fill),
                                        Image.asset('./images/6.png',
                                            width: 100,
                                            height: 125,
                                            fit: BoxFit.fill),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 120,
                                    padding: const EdgeInsets.all(5),
                                    color:
                                        const Color.fromARGB(125, 180, 203, 205),
                                    child: PageView(
                                      controller: _pageController[2],
                                      pageSnapping: true,
                                      children: [
                                        Image.asset('./images/3.png',
                                            width: 100,
                                            height: 125,
                                            fit: BoxFit.fill),
                                        Image.asset('./images/9.png',
                                            width: 100,
                                            height: 125,
                                            fit: BoxFit.fill),
                                        Image.asset('./images/6.png',
                                            width: 100,
                                            height: 125,
                                            fit: BoxFit.fill),
                                      ],
                                    ),
                                  )
                                ],
                              ))
                        ],
                      )),
                ),
                Container(
                  height: 150,
                  //color: Colors.amber,
                  padding: const EdgeInsets.only(top: 30,bottom: 50),
                  child: Row(
                    children: const [
                      Icon(Icons.radar,size: 50,),
                      SizedBox(width: 10,),
                      Text('Explore',style: TextStyle(fontSize: 40),)
                    ],
                  ),
                )
              ] +
              List.generate(5, (index) {
                return Container(
                  height: 300,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      image: Image.network('http://127.0.0.1:8000' + _Listdata[index]['picture'][0]).image,
                      fit: BoxFit.fill,
                  )),
                );
              }) +
              [
                Container(
                  height: 300,
                  //color: Colors.amber,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50,top: 70,bottom: 130),
                    child: Row(
                      children: [
                        Image.asset('./images/19.png'),
                        const SizedBox(width: 30,),
                        const Text('我是有底线的...',style: TextStyle(color: Color.fromARGB(255, 89, 241, 188)),),
                        IconButton(
                          onPressed: (() {
                          
                          }), 
                          icon: const Icon(Icons.refresh,color: Color.fromARGB(255, 88, 251, 216),)
                        )
                      ],                 
                    ),
                  ),
                ),
                const Divider()
              ]
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GridView.builder(
  //       itemCount: _Listdata.length,
  //       //itemCount: 1,
  //       itemBuilder: ((context, index) {
  //         if(index==1){
  //           return Container(
  //             height: 10,
  //             color: Colors.amber,
  //           );
  //         }
  //         return InkWell(
  //           onTap: () {
  //             Navigator.of(context).push((MaterialPageRoute(
  //               builder: (context) => DetailPage(_Listdata[index]),
  //             )));
  //           },
  //           child: Card(
  //             elevation: 20,
  //             //margin: const EdgeInsets.all(10),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   //margin: const EdgeInsets.all(10),
  //                   width: MediaQuery.of(context).size.width * 0.3,
  //                   height: MediaQuery.of(context).size.height * 0.1,
  //                   decoration: BoxDecoration(
  //                       image: DecorationImage(
  //                         // ignore: prefer_interpolation_to_compose_strings
  //                         image: Image.network('http://127.0.0.1:8000' +
  //                                 _Listdata[index]['picture'][0])
  //                             .image,
  //                         fit: BoxFit.fill,
  //                       ),
  //                       borderRadius: BorderRadius.circular(3)),
  //                 ),
  //                 ListTile(
  //                   title: Text(
  //                     _Listdata[index]['name'],
  //                     style: const TextStyle(fontSize: 20),
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                   subtitle: Text(
  //                     _Listdata[index]['summary'],
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ),
  //                 Row(
  //                   children: [
  //                     SizedBox(
  //                       width: 30,
  //                       height: 30,
  //                       child: ClipOval(
  //                           child: Image.network(
  //                         // ignore: prefer_interpolation_to_compose_strings
  //                         'http://127.0.0.1:8000' +
  //                             _Listdata[index]['userimage'],
  //                         fit: BoxFit.fill,
  //                       )),
  //                     ),
  //                     const SizedBox(
  //                       width: 10,
  //                     ),
  //                     Text(
  //                       _Listdata[index]['username'],
  //                       style: const TextStyle(fontSize: 12),
  //                     )
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       }),
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           crossAxisSpacing: 20,
  //           mainAxisSpacing: 10,
  //           //childAspectRatio: 1 / 1.3
  //           ));
  // }
}
