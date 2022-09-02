import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/reset_password/views/reset_password_page_layout.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ResetPasswordPage());
  }

  @override
  Widget build(BuildContext context) {
    return const ResetPasswordPageLayout();
  }
}
