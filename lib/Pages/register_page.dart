import 'package:flutter/material.dart';

class RegistirationPage extends StatefulWidget {
  const RegistirationPage({Key? key}) : super(key: key);

  @override
  State<RegistirationPage> createState() => _RegistirationState();
}

class _RegistirationState extends State<RegistirationPage> {
  //our form key
  final _formKey = GlobalKey<FormState>();
  //editing Controller
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
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

    // lastName TextField
    final lastNameField = TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      style: TextStyle(color: Colors.grey),
      keyboardType: TextInputType.name,
      onSaved: (input) {
        lastNameEditingController.text = input!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_pin_rounded, color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        hintText: 'Last Name',
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
      //validator: () {},
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
      //validator: () {},
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
      //validator: () {},
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
        onPressed: () {},
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
                      lastNameField,
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
}
