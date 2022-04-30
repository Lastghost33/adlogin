import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/user_model.dart';
import 'home_page.dart';

class RegistirationPage extends StatefulWidget {
  const RegistirationPage({Key? key}) : super(key: key);

  @override
  State<RegistirationPage> createState() => _RegistirationState();
}

class _RegistirationState extends State<RegistirationPage> {
  final _auth = FirebaseAuth.instance;
  //our form key
  final _formKey = GlobalKey<FormState>();
  //editing Controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final passwordConfirmEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Fistname TextField
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      style: TextStyle(color: Colors.grey),
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First name can not be empty Master");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a Valid Name Master (Min. 3 Character kyu!)  ");
        }
        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (input) {
        firstNameEditingController.text = input!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        hintText: 'First Name',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // secondName TextField
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      style: TextStyle(color: Colors.grey),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name can not be empty Master");
        }
        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (input) {
        secondNameEditingController.text = input!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_pin_rounded, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        hintText: 'Second Name',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // email TextField
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      style: TextStyle(color: Colors.grey),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Email Master";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a Valid email Master");
        }
        return null;
      },
      onSaved: (input) {
        emailEditingController.text = input!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail_outline_rounded, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Passsword TextField
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      style: TextStyle(color: Colors.grey),
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login Master");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password Master (Min. 6 Character kyu!)  ");
        }
        return null;
      },
      onSaved: (input) {
        passwordEditingController.text = input!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // PassswordConfirm TextField
    final passwordConfirmField = TextFormField(
      autofocus: false,
      controller: passwordConfirmEditingController,
      obscureText: true,
      style: TextStyle(color: Colors.grey),
      validator: (value) {
        if (passwordConfirmEditingController.text !=
            passwordEditingController.text) {
          return "Nyaaa! Password dont match Master";
        }
        return null;
      },
      onSaved: (input) {
        passwordConfirmEditingController.text = input!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        hintText: 'Confirm Password',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.grey[100],
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.grey[800],
      extendBodyBehindAppBar: true,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45),
                      firstNameField,
                      SizedBox(height: 20),
                      secondNameField,
                      SizedBox(height: 20),
                      emailField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 20),
                      passwordConfirmField,
                      SizedBox(height: 30),
                      signUpButton,
                      SizedBox(height: 30),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user models
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(
        msg: "Account created Successfully Nyaaaaaa!", timeInSecForIosWeb: 5);
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false);
  }
}
