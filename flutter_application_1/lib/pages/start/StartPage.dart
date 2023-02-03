import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/Net.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _PasswdController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();

  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('./images/1.jpg'),
              fit: BoxFit.contain)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _username = value;
              });
            },
            controller: _NameController,
            //autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              prefixIcon: Icon(Icons.account_circle),
              label: Text('请输入用户名'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            controller: _PasswdController,
            //autofocus: true,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                label: Text('请输入密码'),
                prefixIcon: Icon(Icons.password_sharp)),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              OutlinedButton.icon(
                  style: const ButtonStyle(
                      //overlayColor:MaterialStatePropertyAll(Color(123)),
                      ),
                  onPressed: () async {
                    if (_username == '') {
                      _errorDialog('用户名为空');
                      // _username = '';
                      // _password = '';
                      return;
                    }
                    if (_password == '') {
                      _errorDialog('密码为空');
                      // _username = '';
                      // _password = '';
                      return;
                    }

                    if (await User_Manage().login(_username, _password)) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/');
                    } else {
                      _PasswdController.clear();
                      _password = '';
                      _errorDialog('用户名或密码错误');
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('登陆')
              ),

              const SizedBox(width: 30,),

              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const RegPage(),));
                }, 
                child: const Text('没有账号？注册')
              )

            ],
          )
        ],
      ),
    ));
  }

  _errorDialog(content) {
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
                  child: const Text('确定'))
            ],
          );
        });
  }
}


class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {

  final TextEditingController _PasswdController = TextEditingController();
  final TextEditingController _PasswdController_2 = TextEditingController();
  final TextEditingController _NameController = TextEditingController();

  String _username = '';
  String _password = '';
  String _password_2 = '';

  _errorDialog(content) {
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
                  child: const Text('确定'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('./images/1.jpg'),
              fit: BoxFit.contain)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _username = value;
              });
            },
            controller: _NameController,
            //autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              prefixIcon: Icon(Icons.account_circle),
              label: Text('请输入用户名'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            controller: _PasswdController,
            //autofocus: true,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                label: Text('请输入密码'),
                prefixIcon: Icon(Icons.password_sharp)),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                _password_2 = value;
              });
            },
            controller: _PasswdController_2,
            //autofocus: true,
            obscureText: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                label: Text('请确认密码'),
                prefixIcon: Icon(Icons.password_sharp)),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              OutlinedButton.icon(
                  style: const ButtonStyle(
                      //overlayColor:MaterialStatePropertyAll(Color(123)),
                      ),
                  onPressed: () async {
                    if (_username == '') {
                      _errorDialog('用户名为空');
                      return;
                    }
                    if (_password == ''||_password_2 =='') {
                      _errorDialog('密码为空');
                      return;
                    }
                    if (_password != _password_2 ) {
                      _errorDialog('两次输入的密码不一致');
                      return;
                    }

                    if (await User_Manage().reg(_username, _password)) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/');
                    } else {
                      _NameController.clear();
                      _PasswdController.clear();
                      _PasswdController_2.clear();
                      _username = '';
                      _password = '';
                      _password_2 = '';
                      _errorDialog('用户名已存在');
                    }
                  },
                  icon: const Icon(Icons.join_right),
                  label: const Text('注册')
              ),
            ],
          )
        ],
      ),
    ));
  }
}