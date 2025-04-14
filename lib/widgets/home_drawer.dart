import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/widgets/custom_text.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
            color: Colors.green,
            child: CustomText(text: "News App",
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15,),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context) => Home(), ));
            },
            leading: Icon(Icons.list,size: 35,),
            title: CustomText(text: "Categories",fontSize: 25,fontWeight: FontWeight.bold,),
          ),
          const SizedBox(height: 15,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.settings_rounded,size: 30,),
            title: CustomText(text: "Settings",fontSize: 25,fontWeight: FontWeight.bold,),
          ),
        ],
      ),
    );
  }
}
