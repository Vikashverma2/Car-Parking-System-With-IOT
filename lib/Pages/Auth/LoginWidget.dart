import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/AuthController.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: authController.loginEmail,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: "Email",
            prefixIcon: Icon(
              Icons.alternate_email_outlined,
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: authController.loginPwd,
          onFieldSubmitted: (s) {
            print("Click on Done button $s ");
            // authController.loginWithEmailAndPassword();
          },
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(
              Icons.lock_sharp,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // const Text(
        //   "Forgot your password?",
        //   style: TextStyle(
        //       color: Colors.blue,
        //       decoration: TextDecoration.underline,
        //       decorationColor: Colors.blue,
        //       fontSize: 15),
        // ),

        const SizedBox(height: 20),
        Obx(() => authController.isLoading.value
            ? const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              )
            : InkWell(
                onTap: () {
                  authController.loginWithEmailPassword();
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_open_sharp, color: Colors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )),
      ],
    );
  }
}
