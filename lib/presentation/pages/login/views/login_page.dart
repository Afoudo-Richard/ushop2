import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/login/views/login_page_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return const LoginPageLayout();
  }
}
