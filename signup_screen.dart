import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/loginscreen1.dart';
import 'package:flutter_application_1/model_sign.dart';
import 'package:flutter_application_1/my_screen/main_screen.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}


class _SignUpScreensState extends State<SignUpScreens> {
  // void button(){}
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String gender = 'male';
  bool? isChecked = false;
  bool ispasswordvisible = true;
  bool ispasswordvisible2 = true;
  // @override
  // void dispose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   // confirmPasswordController2.dispose();
  //   dateController.dispose();
  //   super.dispose();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void SignUpScreens() async {
    try {
       await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
       final anonymouser = await auth.signInAnonymously();
       if(anonymouser.user != null){
         print("This is user email ${anonymouser.user! . uid}");
         final usermodel  = anonymous(
           email: emailController.text,
           name: nameController.text,
           dob: dateController.text,
           gender: gender,
         );
         await firestore.collection('user').doc(anonymouser.user!.uid).set(usermodel.tojason());
         print("The data you can enter is saved successfully");
         Navigator.push(context , MaterialPageRoute(builder: (context) => mainscreen()));
       }
  }
  catch(e) {
      print("Error occured try again : ${e.toString()}");
  }
  }
  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      // dateController.text = pickedDate.toString();
      dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome back',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Lets create an account for you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: ispasswordvisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.blue,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispasswordvisible = !ispasswordvisible;
                      });
                    },
                    icon: Icon(
                      ispasswordvisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 1),
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
                height: 20,
              ),
              // TextFormField(
              //   obscureText: ispasswordvisible2,
              //   decoration: InputDecoration(
              //     labelText: ' Confirm Password',
              //     prefixIcon: Icon(
              //       Icons.password,
              //       color: Colors.blue,
              //     ),
              //     suffixIcon: IconButton(
              //       onPressed: () {
              //         setState(() {
              //           ispasswordvisible2 = !ispasswordvisible2;
              //         });
              //       },
              //       icon: Icon(
              //         ispasswordvisible2
              //             ? Icons.visibility_off
              //             : Icons.visibility,
              //         color: Colors.blue,
              //       ),
              //     ),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //       borderSide: BorderSide(color: Colors.blue),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //       borderSide: BorderSide(color: Colors.blue),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //       borderSide: BorderSide(color: Colors.black, width: 1),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date of birth',
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onTap: pickDate,
              ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   'Gender',
              //   style: TextStyle(
              //       color: Colors.blue, fontWeight: FontWeight.bold),
              // ),
              // Row(
              //   children: [
              //     Radio(
              //       activeColor: Colors.blue,
              //       value: 'Male',
              //       groupValue: gender,
              //       onChanged: (value) {
              //         setState(() {
              //           gender = value.toString();
              //         });
              //       },
              //     ),
              //     Text('Male'),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Radio(
              //       activeColor: Colors.blue,
              //       value: 'Female',
              //       groupValue: gender,
              //       onChanged: (value) {
              //         setState(() {
              //           gender = value.toString();
              //         });
              //       },
              //     ),
              //     Text('Female')
              //   ],
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color.fromARGB(255, 9, 106, 243),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  Text(
                    'I accept terms and conditions.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: SignUpScreens,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Sign Up',

                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),

              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?'),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginscreen()),
                      );
                    },
                    child: Text(
                      'login ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
