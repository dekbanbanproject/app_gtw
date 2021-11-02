import 'package:flutter/material.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShowSignOut extends StatelessWidget {
  const ShowSignOut({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListTile(  
            onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.clear().then(
                      (value) => Navigator.pushNamedAndRemoveUntil(
                          context, MyConstant.routeAuthen, (route) => false),
                    );
              },            
            tileColor: Colors.red.shade400,
            leading: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.white,
            ),
            title: ShowTitle(
              title: 'Signout',
              textStyle: MyConstant().h1White(),
            ),
            subtitle: ShowTitle(
              title: 'Sign Out And Go to Sign In',
              textStyle: MyConstant().h3white(),
            ),
          ),
        ],
      );
  }
}