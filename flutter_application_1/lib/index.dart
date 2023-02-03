// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/Net.dart';
import 'pages/home/HomePage.dart';
import 'pages/search/SearchPage.dart';
import 'pages/like/FavoritPage.dart';
import 'pages/account/AccountPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  var body = <Widget>[const MainBody(), const SearchPage(),const FavoritPage(),const AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        elevation: 20,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.purple,
            Colors.greenAccent,
            Colors.red,
          ], transform: GradientRotation(200))),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: (() {
        //       Navigator.pushNamed(context, '/sell');
        //     }),
        //     icon: const Icon(Icons.add),
        //     iconSize: 30,
        //   ),
        //   //IconButton(onPressed: (() {}), icon: const Icon(Icons.shopping_cart))
        // ],
      ),
      floatingActionButton: Container(
        width: 65,
        height: 65,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 10, 219, 163),
            borderRadius: BorderRadius.circular(40)),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sell');
          },
          backgroundColor: const Color.fromARGB(255, 11, 255, 186),
          isExtended: true,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      // FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/sell');
      //   },
      //   backgroundColor: Colors.purple,
      //   isExtended: true,
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: Drawer(
      //     backgroundColor: const Color.fromARGB(154, 119, 111, 211),
      //     child: Column(
      //       children: [
      //         UserAccountsDrawerHeader(
      //           onDetailsPressed: () =>
      //               Navigator.pushNamed(context, '/account'),
      //           currentAccountPictureSize: const Size.square(89),
      //           //margin: EdgeInsets.only(bottom: 6),
      //           decoration: const BoxDecoration(
      //               color: Color.fromARGB(184, 82, 143, 204),
      //               borderRadius:
      //                   BorderRadius.vertical(bottom: Radius.circular(30))),
      //           accountName: const Text(
      //             'LAFD',
      //             style: TextStyle(fontSize: 17),
      //           ),
      //           accountEmail:
      //               const Text('xs@LAFD.com', style: TextStyle(fontSize: 14)),
      //           currentAccountPicture: ClipOval(
      //               child: Image.asset(
      //             './images/1.jpg',
      //             fit: BoxFit.fill,
      //           )),
      //         ),
      //         const SizedBox(
      //           height: 30,
      //         ),
      //         const drawerList(Icons.favorite, Colors.red, '我的收藏'),
      //         const Divider(
      //             color: Color.fromARGB(
      //               255,
      //               99,
      //               129,
      //               102,
      //             ),
      //             thickness: 2),
      //         const drawerList(Icons.shop_2, Colors.white30, '我的订单'),
      //         const Divider(
      //             color: Color.fromARGB(255, 99, 129, 102), thickness: 2),
      //         const drawerList(Icons.settings, Colors.white70, '设置'),
      //         const SizedBox(
      //           height: 400,
      //         ),
      //         IconButton(
      //             onPressed: () => _logoutDialog('确定退出?'),
      //             icon: const Icon(Icons.logout))
      //       ],
      //     )),
      body: Stack(
        children: [
          body[_currentIndex],
          Positioned(
              bottom: 34,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 11, 255, 186)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (() {
                        setState(() {
                          _currentIndex = 0;
                        });
                      }),
                      icon: const Icon(Icons.home),
                      color: _currentIndex == 0 ? const Color.fromARGB(255, 6, 127, 95) : Colors.black,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: (() {
                        setState(() {
                          _currentIndex = 1;
                        });
                      }),
                      icon: const Icon(Icons.search),
                      color: _currentIndex == 1 ? const Color.fromARGB(255, 6, 127, 95) : Colors.black,
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    IconButton(
                      onPressed: (() {
                        setState(() {
                          _currentIndex = 2;
                        });
                      }),
                      icon: const Icon(Icons.favorite),
                      color: _currentIndex == 2 ? const Color.fromARGB(255, 6, 127, 95) : Colors.black,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: (() {
                        setState(() {
                          _currentIndex = 3;
                        });
                      }),
                      icon: const Icon(Icons.account_circle),
                      color: _currentIndex == 3 ? const Color.fromARGB(255, 6, 127, 95) : Colors.black,
                    )
                  ],
                ),
              ))
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 10, 219, 163),
      //   onTap: (value) {
      //     setState(() {
      //       _currentIndex = value;
      //     });
      //   },
      //   currentIndex: _currentIndex,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.book_sharp,size: 30,), label: '商品'),
      //     BottomNavigationBarItem(icon: Icon(Icons.account_circle,size: 30,), label: '我的')
      //   ],
      // )
    );
  }

  _logoutDialog(content) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('取消')),
              TextButton(
                  onPressed: () {
                    User_Manage().logout();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'start');
                  },
                  child: const Text('确定'))
            ],
          );
        });
  }
}

// ignore: camel_case_types
class drawerList extends StatelessWidget {
  final _icon, _color, _name;
  const drawerList(this._icon, this._color, this._name, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (_name == '我的收藏') {
          Navigator.pushNamed(context, '/favorit');
        } else if (_name == '我的订单') {
          Navigator.pushNamed(context, '/deal');
        } else {
          Navigator.pushNamed(context, '/setting');
        }
      },
      leading: Icon(
        _icon,
        size: 30,
        color: _color,
      ),
      title: Text(
        _name,
        style: const TextStyle(
          color: Color.fromARGB(253, 50, 166, 166),
          fontSize: 20,
          //fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
