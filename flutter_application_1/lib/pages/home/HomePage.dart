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

  @override
  initState() {
    _updata();
    super.initState();
  }

  _updata() async {
    // ignore: non_constant_identifier_names
    List Listdata = await display_goods();
    Listdata.shuffle();
    setState(() {
      _Listdata = Listdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _Listdata.length,
        //itemCount: 1,
        itemBuilder: ((context, index) {
          if(index==1){
            return Container(
              height: 10,
              color: Colors.amber,
            );
          }
          return InkWell(
            onTap: () {
              Navigator.of(context).push((MaterialPageRoute(
                builder: (context) => DetailPage(_Listdata[index]),
              )));
            },
            child: Card(
              elevation: 20,
              //margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    //margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          // ignore: prefer_interpolation_to_compose_strings
                          image: Image.network('http://127.0.0.1:8000' +
                                  _Listdata[index]['picture'][0])
                              .image,
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  ListTile(
                    title: Text(
                      _Listdata[index]['name'],
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      _Listdata[index]['summary'],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    //padding: const EdgeInsets.only(left: 20, bottom: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: ClipOval(
                              child: Image.network(
                            // ignore: prefer_interpolation_to_compose_strings
                            'http://127.0.0.1:8000' +
                                _Listdata[index]['userimage'],
                            fit: BoxFit.fill,
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _Listdata[index]['username'],
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            //childAspectRatio: 1 / 1.3
            ));
  }
}
