import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:newsapp/utils/app_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getsize(context);
    return Scaffold(
      backgroundColor: Color(0xFF1D1D1D),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppLayout.getHeight(90)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome\nBack!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF262626)),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Gap(AppLayout.getHeight(70)),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(45),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF262626),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_rounded),
                            prefixIconColor: Color(0xFF626262),
                            hintText: "Enter email",
                            hintStyle: TextStyle(color: Color(0xFF626262)),
                            border: InputBorder.none),
                      ),
                    ),
                    Gap(AppLayout.getHeight(30)),
                    Container(
                      height: AppLayout.getHeight(45),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF262626),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Color(0xFF626262),
                          hintText: "Enter password",
                          hintStyle: TextStyle(color: Color(0xFF626262)),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 20,
                          ),
                          suffixIconColor: Color(0xFF626262),
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Gap(AppLayout.getHeight(60)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            debugPrint("Sign in pressed");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3C4CA4),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(18)),
                          child: const Icon(Icons.keyboard_double_arrow_right),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
