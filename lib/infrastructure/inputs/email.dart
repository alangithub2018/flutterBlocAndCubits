import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');

  const Email.dirty(String value) : super.dirty(value);

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  String? get errorMessage {

    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) return 'El correo es requerido';
    if (displayError == EmailError.format) return 'No tiene el formato de correo electronico';
    
    return null;
  }

  @override
  EmailError? validator(String? value) {

    if (value == null || value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
