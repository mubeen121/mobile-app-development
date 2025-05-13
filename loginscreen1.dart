import 'package:flutter/material.dart';
import 'package:flutter_application_1/forget.dart';
import 'package:flutter_application_1/signup_screen.dart';
import 'package:flutter_application_1/my_screen/main_screen.dart';
import 'package:auth_buttons/auth_buttons.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final formkey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(23),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Text(
                'Welcome here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.red,
                ),
              ),
              Text(
                'Let you can sign here first',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),

              SizedBox(
                height: 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email can  be empty';
                  }
                  if (!value.contains('@')) {
                    return 'Invalid email type';
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password can be empty';
                  }
                  if (value.length < 8) {
                    return 'password must be at least 8 character';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => forgetpassword()));
                  },
                  child: Text('forgot your password'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate())
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mainscreen()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have account ?',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreens()));
                      print('signup clicked');
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],

              ),
              SizedBox(
                height: 20,
              ),
              GoogleAuthButton(
                // text: "Google",
                themeMode: ThemeMode.light,
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              GithubAuthButton(themeMode: ThemeMode.light,
                // text: "Github",
                onPressed: (){},
              ),
              SizedBox(
                height: 20,
              ),
              FacebookAuthButton(themeMode: ThemeMode.light,

                // text: "Facebook",
                onPressed: () {},),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
