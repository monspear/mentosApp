// 스터디 생성 페이지
import 'package:flutter/material.dart';
import 'package:mentos/const/colors.dart';

class PlusPost extends StatefulWidget {
  @override
  _PlusPostState createState() => _PlusPostState();
}

class _PlusPostState extends State<PlusPost> {
  TextEditingController titleController = TextEditingController();   // titleController.text : 입력받은 제목 값
  TextEditingController contentsController = TextEditingController();    // contentsController.text : 입력받은 모집내용 값
  TextEditingController hashtagController = TextEditingController();      // hashtagController.text : 입력받은 해시태그 값
  TextEditingController peopleController = TextEditingController();   // peopleController.text : 입력받은 모집인원 수 값
  TextEditingController startDateController = TextEditingController();  // startDateController.text : 입력받은 모집기간(시작일) 값
  TextEditingController endDateController = TextEditingController();   // endDateController.text : 입력받은 모집기간(종료일) 값

  // 게시물 생성 메서드
  void createPost() {
    // 게시물 데이터 생성
    String title = titleController.text;
    String contents = contentsController.text;
    String hashtag = hashtagController.text;
    String people = peopleController.text;
    String startDate = startDateController.text;
    String endDate = endDateController.text;

    // main_home 페이지로 돌아가면서 게시물 데이터 전달
    Navigator.pop(context, {
      'title': title,
      'contents': contents,
      'hashtag': hashtag,
      'people': people,
      'startDate': startDate,
      'endDate': endDate,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스터디 생성'),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Positioned(
              child: Text(
                '제목',
                style: TextStyle(
                  color: BLUE_COLOR,
                ),
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: '제목을 입력해주세요',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25.0),
            Positioned(
              child: Text(
                '모집 내용',
                style: TextStyle(
                  color: BLUE_COLOR,
                ),
              ),
            ),
            Container(
              height: 200.0,
              child: TextField(
                maxLines: 7,
                controller: contentsController,
                decoration: InputDecoration(
                  hintText: '내용을 입력해주세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Positioned(
              child: Text(
                '해시태그',
                style: TextStyle(
                  color: BLUE_COLOR,
                ),
              ),
            ),
            TextField(
              controller: hashtagController,
              decoration: InputDecoration(
                hintText: '#해시태그',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25.0),
            Positioned(
              child: Text(
                '모집 인원',
                style: TextStyle(
                  color: BLUE_COLOR,
                ),
              ),
            ),
            TextField(
              controller: peopleController,
              decoration: InputDecoration(
                suffix: Text('명'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25.0),
            Positioned(
              child: Text(
                '모집 기간',
                style: TextStyle(
                  color: BLUE_COLOR,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: startDateController,
                    decoration: InputDecoration(
                      hintText: '시작일 입력',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextFormField(
                    controller: endDateController,
                    decoration: InputDecoration(
                      hintText: '종료일 입력',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: createPost,
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor, // 버튼의 배경색
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // 버튼의 모서리를 둥글게 설정
                ),
                minimumSize: Size(double.infinity, 50), // 버튼의 최소 크기를 설정
              ),
              child: Text('만들기'),
            ),
          ],
        ),
      ),
      )
    );
  }
}
