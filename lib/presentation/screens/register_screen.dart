import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) => username = value,
              validator: (value) {
                if (value!.isEmpty || value.trim().isEmpty) {
                  return 'El nombre es requerido';
                } else if (value.length < 6) {
                  return 'El nombre debe tener al menos 6 caracteres';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingrese su nombre',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              onChanged: (value) => email = value,
              validator: (value) {
                final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegExp.hasMatch(value!)) {
                  return 'El correo no es válido';
                } else if (value.isEmpty || value.trim().isEmpty) {
                  return 'El correo es requerido';
                } else if (value.length < 6) {
                  return 'El correo debe tener al menos 6 caracteres';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Correo',
                hintText: 'Ingrese su correo',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              onChanged: (value) => password = value,
              validator: (value) {
                if (value!.isEmpty || value.trim().isEmpty) {
                  return 'El password es requerido';
                } else if (value.length < 6) {
                  return 'El password debe tener al menos 6 caracteres';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese su contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) return;

                  print('Username: $username');
                  print('Email: $email');
                  print('Password: $password');
                },
                icon: const Icon(Icons.save),
                label: const Text('Crear usuario')),
            const SizedBox(height: 20),
          ],
        ));
  }
}
