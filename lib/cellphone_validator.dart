library cellphone_validator;

import 'package:cellphone_validator/src/cellphone_validator.dart';

export 'src/controllers/country_manager.dart';
export 'src/models/country.dart';
export 'src/view/phone_view/phone_validator_widget.dart';
export 'src/view/PhoneTextView/phoneView.dart';
export 'src/view/PhoneTextField/phoneTextField.dart';
export 'src/controllers/phone_validator.dart';
export 'cellphone_validator.dart';

final CellphoneValidator CellPhoneValidator = CellphoneValidatorImpl();