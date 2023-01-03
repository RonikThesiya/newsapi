import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/provider/home_provider.dart';
import 'package:newsapi/screen/home/view/bottombar_screens/news_home.dart';
import 'package:newsapi/screen/home/view/bottombar_screens/news_profile.dart';
import 'package:newsapi/screen/home/view/bottombar_screens/news_video.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {

    homeProvidertrue = Provider.of<HomeProvider>(context,listen: true);
    homeProviderfalse = Provider.of<HomeProvider>(context,listen: false);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Daily 24/7 News"),
        actions: [
          IconButton(onPressed: ()async{
            if(await Permission.camera.isDenied)
              {
                Permission.camera.request();
              }
          }, icon: Icon(Icons.camera_alt)),
        ],
      ),
      body: IndexedStack(
        index: homeProvidertrue!.i,
        children: [
          NewsHomeScreen(),
          VideoScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle),label: "Video"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        currentIndex: homeProvidertrue!.i,
        onTap: (index){
          homeProvidertrue!.bottomindex(index);
          },
      ),
    ));
  }
}
