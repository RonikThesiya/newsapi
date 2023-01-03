import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/modal/NewsModal.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class TopNews extends StatefulWidget {
  const TopNews({Key? key}) : super(key: key);

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<NewsModal>(
      future: homeProvidertrue!.getnews(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {

          NewsModal newsModal = snapshot.data!;

          return ListView.builder(
              itemCount: newsModal.articles!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3f3f3f),
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Column(
                        children: [
                          Row(
                    children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Image.network("${newsModal.articles![index].urlToImage}",fit: BoxFit.fill,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              height: 120,
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${newsModal.articles![index].title}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white70),overflow: TextOverflow.visible,),
                                  Text("${newsModal.articles![index].description}",style: TextStyle(fontSize: 10,color: Colors.white54),overflow: TextOverflow.ellipsis,),
                                ],
                              )
                            ),
                          ),
                    ],
                          ),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, 'details',arguments: newsModal.articles![index].url);
                          }, child: Text("Read News In Details")),

                        ],
                      ),
                    ),

                  ],
                );
              });
        }

        return Center(child: CircularProgressIndicator());
      },
    )));
  }
}
