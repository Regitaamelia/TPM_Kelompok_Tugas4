import 'package:flutter/material.dart';
import 'package:kelompok_tpm/menu_utama.dart';

class MenuLogin extends StatefulWidget {
  const MenuLogin({Key? key}) : super(key: key);

  @override
  State<MenuLogin> createState() => _MenuLoginState();
}

class _MenuLoginState extends State<MenuLogin> {
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffDAF5FF),
        appBar: AppBar(
          backgroundColor: Color(0xff19376D),
          title: Text('Login Screen'),
        ),
        body: ListView(children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 110),
              width: 300,
              child: Column(
                children: [
                  Image.asset("assets/bg.png", width: 500, height: 200),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: TextFormField(
                      enabled: true,
                      onChanged: (value) {
                        username = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: '   Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      enabled: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintText: '   Password',
                      ),
                    ),
                  ),
                  Card(
                    //color: Color(0xff19376D),
                    child: Container(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff19376D), // background
                        ),
                        onPressed: () {
                          String text = "";
                          if (username == "tugastpm" && password == "12345") {
                            text = "Login Success";
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return MenuUtama();
                                }));
                          } else {
                            text = "Login Failed";
                          }
                          SnackBar snackBar = SnackBar(
                            content: Text(text),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Text("Log In"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Forgot password?"),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}