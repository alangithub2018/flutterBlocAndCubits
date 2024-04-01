import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: registerCubit.usernameChanged,
              errorMessage: username.errorMessage,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingrese su nombre',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              onChanged: registerCubit.emailChanged,
              errorMessage: email.errorMessage,
              decoration: const InputDecoration(
                labelText: 'Correo',
                hintText: 'Ingrese su correo',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              onChanged: registerCubit.passwordChanged,
              errorMessage: password.errorMessage,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese su contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
                onPressed: registerCubit.onSubmit,
                icon: const Icon(Icons.save),
                label: const Text('Crear usuario')),
            const SizedBox(height: 20),
          ],
        ));
  }
}
