import 'package:flutter/material.dart';
import 'package:tugas4tpm/data/users.dart';
import 'package:tugas4tpm/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Page', style: TextStyle(fontSize: 40)),
            SizedBox(height: 5),
            Text('Please login to continue'),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                label: Text('Username'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 12)),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;

                  for (var i = 0; i < usersList.length; i++) {
                    if (username == usersList[i].username &&
                        password == usersList[i].password) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      return;
                    } else {
                      setState(() {
                        error = 'Username or Password is wrong';
                      });
                    }
                  }
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
