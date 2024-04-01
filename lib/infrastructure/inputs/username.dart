import 'package:formz/formz.dart';

enum UsernameError { empty, length }

class Username extends FormzInput<String, UsernameError> {
  const Username.pure() : super.pure('');

  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {

    if (isValid || isPure) return null;

    if (displayError == UsernameError.empty) return 'El nombre es requerido';
    if (displayError == UsernameError.length) return 'El nombre debe tener al menos 6 caracteres';
    
    return null;
  }

  @override
  UsernameError? validator(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return UsernameError.empty;
    }
    if (value.length < 6) {
      return UsernameError.length;
    }
    return null;
  }
}
