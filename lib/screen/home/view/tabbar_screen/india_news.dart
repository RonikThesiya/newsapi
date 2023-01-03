import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/screen/home/modal/IndiaNews.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class India extends StatefulWidget {
  const India({Key? key}) : super(key: key);

  @override
  State<India> createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;


  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<IndiaNews>(
              future:
              homeProvidertrue!.indianewsmethod(
                  "${homeProvidertrue!.selectdata}"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  IndiaNews indiaNews = snapshot.data!;

                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                Button("business"),
                                Button("entertainment"),
                                Button("general"),
                                Button("health"),
                                Button("science"),
                                Button("sports"),
                                Button("technology"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: indiaNews.articles!.length,
                            itemBuilder: (context, index) {
                              return Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.3,
                                      decoration: BoxDecoration(
                                        color: Color(0xff3f3f3f),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                child: Container(
                                                    height: 120,
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: "${indiaNews
                                                          .articles![index]
                                                          .urlToImage}",
                                                      fit: BoxFit.fill,
                                                      placeholder: (context,_) =>
                                                        Image.network(
                                                            "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",fit: BoxFit.fill,),

                                                      errorWidget: (context,_,__)=>
                                                        Image.network(
                                                            "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",fit: BoxFit.fill,),

                                                    ),
                                                  // Image.network(
                                                  //   "${indiaNews.articles![index].urlToImage}",
                                                  //   fit: BoxFit.fill,
                                                  // ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Container(
                                                    height: 120,
                                                    width: 120,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: ListTile(
                                                            title: Column(
                                                              children: [
                                                                Text(
                                                                  "${indiaNews
                                                                      .articles![index]
                                                                      .title}",
                                                                  style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight
                                                                          .bold,
                                                                      color: Colors
                                                                          .white70),
                                                                  overflow: TextOverflow
                                                                      .visible,
                                                                ),
                                                              ],
                                                            ),
                                                            subtitle: Text(
                                                              "${indiaNews
                                                                  .articles![index]
                                                                  .description}",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white54),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, 'details',
                                                    arguments:
                                                    indiaNews.articles![index]
                                                        .url);
                                              },
                                              child: Text(
                                                  "Read News In Details")),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            )));
  }

  Widget Button(String? name) {
    return InkWell(
      onTap: () {
        homeProviderfalse!.datachange(name!);
      },
      child: Container(
        height: 40,
        width: 110,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text("$name",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
