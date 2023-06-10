// 로그인 페이지
import 'package:flutter/material.dart';
import 'package:mentos/page/signup_page.dart';
import 'package:mentos/page/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class login_page extends StatelessWidget {
  final loginIdController = TextEditingController();  // loginIdController.text : 입력받은 ID 값
  final loginPwController = TextEditingController();  // loginPwController.text : 입력받은 PW 값

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 240.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>
            [
              SizedBox(height: 40.0),
              TextFormField(
                controller: loginIdController,
                decoration: InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: loginPwController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment(1.0, 0.0),
                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    '회원가입하기',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 50.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blueAccent,
                  elevation: 7.0,
                  child: InkWell(
                    onTap: () async {
                      final flaguser = FirebaseFirestore.instance
                          .collection('users')
                          .doc(loginIdController.text); // db에 사용자가 입력한 id가 있는지
                      final snapshot = await flaguser.get();
                      final db_id = snapshot.data()!['userid'];
                      final db_password = snapshot.data()!['userpassword'];
                     
                      debugPrint("id = ${loginIdController.text}");
                      debugPrint("password = ${loginPwController.text}");
                      debugPrint("id = $db_id");
                      debugPrint("password = $db_password");
                      
                      if (db_id == loginIdController.text &&
                          db_password == loginPwController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("로그인 성공"),
                        ));

                        await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("로그인 실패"),
                        ));
                      }
                      
                    },  // 로그인 버튼 눌렀을 때 실행될 함수
                    child: Center(
                      child: Text(
                        '로그인',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
