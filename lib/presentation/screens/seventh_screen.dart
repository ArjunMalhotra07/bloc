import 'package:flutter/material.dart';
import 'package:test/logic/mixins/validator_mixin.dart';

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({super.key});

  @override
  State<SeventhScreen> createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> with ValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  String email = '', pass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [emailField(), passField(), submitButton()]),
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: ((newValue) {
        email = newValue.toString();
      }),
      // validator: validateEmail,
      decoration: const InputDecoration(
          labelText: "Email Address", hintText: "arjun03.malhotra@gmail.com"),
    );
  }

  Widget passField() {
    return TextFormField(
      obscureText: true,
      onSaved: ((newValue) {
        pass = newValue.toString();
      }),
      // validator: validatePasscode,
      keyboardType: TextInputType.visiblePassword,
      decoration:
          const InputDecoration(labelText: "Passcode", hintText: "Passcode"),
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: 150,
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            debugPrint(email);
            debugPrint(pass);
          }
        },
        color: Colors.lightBlue,
        child: const Center(child: Text("Submit")),
      ),
    );
  }
}
