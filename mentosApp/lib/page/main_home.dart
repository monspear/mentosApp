import 'package:flutter/material.dart';
import 'package:mentos/component/plus_post.dart';
import 'package:mentos/const/colors.dart';

class Post {
  String title;
  String contents;
  String hashtag;
  String people;
  String startDate;
  String endDate;
  bool isLiked;

  Post({
    required this.title,
    required this.contents,
    required this.hashtag,
    required this.people,
    required this.startDate,
    required this.endDate,
    this.isLiked = false,
  });
}

class MainHome extends StatefulWidget {
  final int number;

  const MainHome({
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<Post> posts = [];

  void openCreatePostPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlusPost()),
    );

    if (result != null && result is Map) {
      setState(() {
        Post post = Post(
          title: result['title'],
          contents: result['contents'],
          hashtag: result['hashtag'],
          people: result['people'],
          startDate: result['startDate'],
          endDate: result['endDate'],
        );
        posts.add(post);
      });
    }
  }

  void toggleLike(int index) {
    setState(() {
      posts[index].isLiked = !posts[index].isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(posts[index].title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(posts[index].contents),
                              Text(posts[index].hashtag),
                              SizedBox(height: 10),
                              Text('인원 : ${posts[index].people}명'),
                              Text('모집기간 : ${posts[index].startDate} ~ ${posts[index].endDate}'),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          posts[index].isLiked ? Icons.favorite : Icons.favorite_border,
                          color: posts[index].isLiked ? BLUE_COLOR : null,
                        ),
                        onPressed: () => toggleLike(index),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: BLUE_COLOR,
                        ),
                        onPressed: () {
                          // '+' 버튼을 눌렀을 때의 동작 구현
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCreatePostPage,
        child: Icon(Icons.add),
      ),
    );
  }
}
