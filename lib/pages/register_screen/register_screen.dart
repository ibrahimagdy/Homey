import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:homey/core/services/snackbar_service.dart';
import 'package:homey/core/widgets/custom_text_form_field.dart';
import 'package:homey/pages/login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isViasble = true;
  bool confirmPasswordVisale = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: theme.primaryColor,
              size: 32,
            ),
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Sign up",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          const Shadow(
                            offset: Offset(0, 1.5),
                            color: Color.fromARGB(255, 66, 61, 61),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: mediaQuery.height * 0.67,
                    decoration: BoxDecoration(
                      color: const Color(0xff002445).withOpacity(0.45),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "You must enter your email";
                              }
                              var regularExpression = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                              if (!regularExpression.hasMatch(value)) {
                                return "Invalid email";
                              }
                              return null;
                            },
                            hintText: "Email",
                          ),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "You must enter your Name";
                              }
                              return null;
                            },
                            hintText: "Name",
                          ),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            controller: passwordController,
                            hintText: "Password",
                            obscureText: isViasble,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "You must enter your password";
                              }
                              var regularExpression = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if (!regularExpression.hasMatch(value)) {
                                return "Invalid Password";
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isViasble = !isViasble;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  isViasble == true ? "View" : "Hide",
                                  style: const TextStyle(
                                      color: Color(0xff14213D),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            controller: confirmPasswordController,
                            hintText: "Confirm Password",
                            obscureText: confirmPasswordVisale,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "You must enter your password";
                              }
                              if (value != passwordController.text) {
                                return "Password does't Match as above";
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                confirmPasswordVisale = !confirmPasswordVisale;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  confirmPasswordVisale == true
                                      ? "View"
                                      : "Hide",
                                  style: const TextStyle(
                                      color: Color(0xff14213D),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Row(
                            children: [
                              Text(
                                "By selecting agree and continue below,",
                                style: theme.textTheme.labelMedium!.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "I agree to Terms of service and privacy policy",
                                style: theme.textTheme.labelMedium!.copyWith(
                                    color: const Color(0xff7DD7DF),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 23),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 14),
                            ),
                            onPressed: () {
                              register();
                              // Navigator.pushNamed(
                              //     context, LoginScreen.routeName);
                            },
                            child: Text("Agree and Continue",
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: Colors.white, fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      if (email.isEmpty) {
        SnackBarService.showErrorMessage("Please Enter a valid email address");
        return;
      }
      if (password.isEmpty) {
        SnackBarService.showErrorMessage("Please Enter a valid password");
        return;
      }
      EasyLoading.show();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        EasyLoading.dismiss();
        SnackBarService.showSuccessMessage(
            "You have successfully created a new account");
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          EasyLoading.dismiss();
          SnackBarService.showErrorMessage(
              'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          EasyLoading.dismiss();
          SnackBarService.showErrorMessage(
              'The account already exists for that email.');
        }
      }
    }
  }
}
