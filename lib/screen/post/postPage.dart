import 'package:flutter/material.dart';
import 'package:newsapi/screen/post/postProvider.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              bool isSuccess =
                  await Provider.of<PostProvider>(context, listen: false)
                      .postApi("ronak", "Flutter");

              if (isSuccess) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Success")));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Failed")));
              }
            },
            child: Text("Submit"),
          ),
        ),
      ),
    );
  }
}
