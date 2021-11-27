import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/usersModel.dart';
// import 'package:gtw/models/infoorg_model.dart';
// import 'package:gtw/models/infousers_model.dart';
// import 'package:gtw/models/usersModel.dart';
// import 'package:gtw/models/usersModel.dart';
// import 'package:gtw/models/usersModel.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:gtw/widgets/show_image.dart';
import 'package:gtw/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                builAppname(),
                buildUser(size),
                buildPassword(size),
                buildSubmitlogin(size),
                buildsetpass(),
                buildtesthn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildsetpass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Forgot Password ?',
          textStyle: MyConstant().h3dark(),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/reset'),
          child: const Text('Reset Password'),
        ),
      ],
    );
  }

  Row buildtesthn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'TEST ?',
          textStyle: MyConstant().h3dark(),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/hn'),
          child: const Text('HN Test'),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/tdbs'),
          child: const Text('Chart Test'),
        ),
      ],
    );
  }

  Row buildSubmitlogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.2,
          child: ElevatedButton(
            style: MyConstant().mybuttonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String username = usernameController.text;
                String password = passwordController.text;
                print('## username = $username, password = $password');
                checkAuthen(username: username, password: password);
                // checkAuthen();
              }
            },
            child: Text('Login'),
          ),
        ),
      ],
    );
  }

  // Future<void> checkAuthen() async {
  //   if (passwordController.text.isNotEmpty &&
  //       usernameController.text.isNotEmpty) {
  //     var res = await http.post(
  //         Uri.parse("${MyConstant.domain}/gtw/api/signin.php?isAdd=true"),
  //         headers: {'Accept': 'application/json'},
  //         body: ({
  //           'username': usernameController.text,
  //           'password': passwordController.text
  //         }));

  //     if (res.statusCode == 200) {
  //       final body = jsonDecode(res.body);
  //       // print("Login Token" + body["personid"]);
  //       // MyDialog().normalDialog(context, 'Token', '$body["token"]');
  //       // final body = jsonDecode(response.toString());0839808239
  //       // print("Login Token" + body["token"]);
  //       // var body = json.decode(res.body);
  //       print(body);

  //       // SharedPreferences preferences = await SharedPreferences.getInstance();
  //       //  String? personid = preferences.getString('personid');
  //       // await preferences.setString("login", body["token"]);

  //       // print('###personid ===> $personid');

  //       Navigator.pushNamedAndRemoveUntil(
  //           context, MyConstant.routeHnPage, (route) => false);
  //     } else {
  //       MyDialog().normalDialog(context, 'ไม่มีในฐานข้อมูล', 'Password ผิด');
  //     }
  //   } else {
  //     MyDialog().normalDialog(context, 'ไม่มี ในฐานข้อมูล', 'Username ผิด');
  //   }
  // }

  Future<Null> checkAuthen({String? username, String? password}) async {
    String apiCheckAuthen =
        '${MyConstant.domain}/gtw/api/signin.php?isAdd=true&username=$username';
    await Dio().get(apiCheckAuthen).then((value)async {
      print('## value for API ===> $value');
      if (value.toString() == 'null') {
        MyDialog().normalDialog(
            context, 'ไม่มี $username ในฐานข้อมูล', 'Username ผิด');
      } else {
        for (var item in json.decode(value.data!)) {
          UsersModel model = UsersModel.fromMap(item);
          if (password == model.password) {
            String type = model.type;
            print('## value for API ===> $type');

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString('type', type);
            preferences.setString('fullname', model.fullname);
            preferences.setString('personid', model.personid);
            preferences.setString('positionid', model.positionid);
            preferences.setString('depsubsubid', model.depsubsubid);

            switch (type) {
              case 'US':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeUserPage, (route) => false);
                break;
              case 'PO':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routePoPage, (route) => false);
                break;
              case 'HN':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeHnPage, (route) => false);
                break;
              case 'AD':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeAdminPage, (route) => false);
                break;
              default:
            }
          } else {
            // Authen False
            MyDialog().normalDialog(context, 'กรุณาลองใหม่', 'รหัสผ่านผิด ?');
          }
        }
      }
    });
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: size * 0.5,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก Password';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: statusRedEye
                      ? Icon(
                          Icons.remove_red_eye,
                          color: MyConstant.info,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: MyConstant.info,
                        )),
              labelStyle: MyConstant().h2(),
              labelText: 'Password ',
              prefixIcon: Icon(
                Icons.lock_open,
                color: MyConstant.info,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size * 0.5,
          child: TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก username';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h2(),
              labelText: 'Username ',
              prefixIcon: Icon(
                Icons.account_circle,
                color: MyConstant.info,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row builAppname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          child: ShowTitle(
            title: MyConstant.appName,
            textStyle: MyConstant().h1(),
          ),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 90),
          width: size * 0.4,
          child: ShowImage(path: MyConstant.img4),
        ),
      ],
    );
  }
}
