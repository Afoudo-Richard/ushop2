import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/register/views/enter_email_page_layout.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return const EnterEmailPageLayout();
  }
}
