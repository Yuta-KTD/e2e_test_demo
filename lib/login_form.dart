import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('メールアドレス'),
          Semantics(
            label: 'メールアドレス入力',
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('パスワード'),
          Semantics(
            label: 'パスワード入力',
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            child: const Text('ログイン'),
            onPressed: () => showDialog(
                context: context,
                builder: (_) {
                  final isEntered = emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty;
                  return SimpleDialog(
                    title: Text(
                      isEntered ? 'ログインしました' : 'メールアドレスとパスワードを入力してください',
                      style: TextStyle(
                          color: isEntered ? Colors.black : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    children: [
                      SimpleDialogOption(
                        child: const Text(
                          'OK',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        onPressed: () {
                          if (isEntered) {
                            emailController.clear();
                            passwordController.clear();
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
