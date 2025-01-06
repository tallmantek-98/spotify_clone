import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/app_bar/app_bar.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/data/models/auth/signin_user_request.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_up.dart';

import '../../../service_locator.dart';
import '../../root/pages/home.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
        showBtn: true,
      ),
      bottomNavigationBar: _signupText(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'If You Need Any Support',
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Click Here',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            const SizedBox(height: 26),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SignInUserReq(
                    email: _email.text.toString(),
                    password: _password.text.toString(),
                  ),
                );

                result.fold(
                  (l) {
                    var snackBar = SnackBar(
                      content: Text(
                        l,
                        style: const TextStyle(color: AppColors.primary),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                        (route) => false);
                  },
                );
              },
              title: 'Sign In ',
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: 'Enter Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: _password,
      decoration: const InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignupPage(),
                ),
              );
            },
            child: const Text(
              'Register Now',
              style: TextStyle(
                color: Color(0xff288CE9),
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
