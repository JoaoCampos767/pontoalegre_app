import 'package:flutter/material.dart';
import 'package:pontoalegre/screen/singIn/singin_provider.dart';
import 'package:pontoalegre/widget/button/button_loading.dart';
import 'package:pontoalegre/widget/inputs/input.dart';
import 'package:provider/provider.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    final singInProvider = Provider.of<SingInProvider>(context);

    return Scaffold(
      body: _body(context, singInProvider),
    );
  }

  Widget _body(BuildContext ctx, SingInProvider singInProvider) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: singInProvider.keyLogin,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _email(ctx),
              _sized(),
              _password(ctx),
              _sized(),
              _button(ctx),
            ],
          ),
        ),
      ),
    );
  }

  Widget _email(BuildContext ctx) {
    return InputField(
      title: 'E-mail',
      inputType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.mail),
      obscureText: false,
      onChanged: (value) => ctx.read<SingInProvider>().changedEmail(value),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Usuario é obrigatorio';
        }
        return null;
      },
    );
  }

  Widget _password(BuildContext ctx) {
    return InputField(
      title: 'E-mail',
      inputType: TextInputType.visiblePassword,
      prefixIcon: const Icon(Icons.key),
      obscureText: true,
      onChanged: (value) => ctx.read<SingInProvider>().changedPassword(value),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Senha é obrigatorio';
        }
        return null;
      },
    );
  }

  Widget _button(BuildContext ctx) {
    return LoadingButton(
      title: 'Acessar',
      loading: ctx.read<SingInProvider>().singIn.loading,
      onPressed: () => ctx.read<SingInProvider>().onSubmitted(ctx),
    );
  }

  Widget _sized() => const SizedBox(height: 15);
}

// expected a value of type (dynamic) -> String?. but got one of type () => Map<dynamic, dynamic>
