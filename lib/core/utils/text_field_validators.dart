import 'package:equatable/equatable.dart';

class TextFieldValidatorEntity extends Equatable {
  final bool Function(String) isValid;
  final String message;
  const TextFieldValidatorEntity({
    required this.isValid,
    required this.message,
  });

  @override
  List<Object> get props => [isValid, message];
}

TextFieldValidatorEntity quantityValidator = TextFieldValidatorEntity(
  isValid: (String val) => RegExp(r'^[0-9]+$').hasMatch(val),
  message: 'Please enter a valid quantity',
);

TextFieldValidatorEntity priceValidator = TextFieldValidatorEntity(
  isValid: (String val) => RegExp(r"^[1-9]\d*$").hasMatch(val),
  message: 'Please enter a valid price',
);

TextFieldValidatorEntity notContainWhiteSpace = TextFieldValidatorEntity(
  isValid: (String val) => !val.contains(' '),
  message: 'This field can’t contain a blank space',
);
