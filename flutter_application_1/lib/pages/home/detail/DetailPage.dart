import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(this.data, {super.key});
  final Map data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List _picture;
  PageController _controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _picture = widget.data['picture'];
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment.center,
                //color: Colors.amber,
                child: PageView.builder(
                    controller: _controller,
                    itemCount: _picture.length,
                    itemBuilder: ((context, index) {
                      return Image.network(
                          'http://127.0.0.1:8000' + _picture[index]);
                    })),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.amber,
              ),
            ],
          ),
        ));
  }
}
