# Cellphone Validator
A powerful and easy-to-use Flutter package for validating and formatting international phone numbers. Includes a customizable country code picker and provides detailed information for hundreds of countries.
![Screenshot 1](https://raw.githubusercontent.com/DecksPlayer/phonevalidator/main/assets/0.png)
![Screenshot 2](https://raw.githubusercontent.com/DecksPlayer/phonevalidator/main/assets/3.png)
![Screenshot 3](https://raw.githubusercontent.com/DecksPlayer/phonevalidator/main/assets/2.png)
<br />

## Features

*   **Real-time Validation**: Instantly check if a phone number is valid as the user types.
*   **Automatic Formatting**: Applies the correct formatting mask to the phone number automatically.
*   **Integrated Country Picker**: A clean UI widget that combines a country code dropdown with the phone number input field.
*   **Reactive Controller**: Built with a `ValueNotifier`-based controller to easily listen for changes to the phone number's validity and value.
*   **Rich Country Data**: Includes country names (with translations), ISO codes, dial codes, and flag emojis.

## Getting Started

To start using the package, add the `cellphone_validator` dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cellphone_validator: ^1.0.3 # Replace with the latest version
```

Then, run `flutter pub get` in your terminal to install the package.

## Usage

Here is a practical example of how to implement the `PhoneValidatorWidget`.

### 1. Import the Package
```dart
import 'package:cellphone_validator/src/view/phone_view/phone_validator_widget.dart';
import 'package:cellphone_validator/src/controllers/phone_validator.dart';
```

### 2. Create a PhoneValidator Controller

First, create a `ValueNotifier` in your `State` to hold the `PhoneValidator` instance. This will manage the state of the phone input.

```dart
class _MyHomePageState extends State<MyHomePage> {
  // The controller that manages the widget's state.
  // You can specify a default language.
  final ValueNotifier<PhoneValidator> phoneValidator =
      ValueNotifier(PhoneValidator(lang: 'en'));

  // ... rest of your state
}
```

### 3. Add the Widget to your UI

Place the `PhoneValidatorWidget` in your widget tree and pass it the controller you just created.

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Phone Validator Example")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The main widget for phone number input
          PhoneValidatorWidget(
            phoneValidator: phoneValidator.value,
          ),
        ],
      ),
    ),
  );
}
```

### 4. Listen for Changes

You can listen to the `isValidPhoneNotifier` within the controller to react to changes in the phone number's validity in real-time.

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    // ... your AppBar
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhoneValidatorWidget(
            phoneValidator: phoneValidator.value,
          ),
          SizedBox(height: 20),
          // Listen to the notifier to show validation results
          ListenableBuilder(
            listenable: phoneValidator.value.isValidPhoneNotifier,
            builder: (context, _) {
              final isValid = phoneValidator.value.isValidPhoneNotifier.value;
              final phoneNumber = phoneValidator.value.phone;
              
              if (!isValid) {
                return Text('Invalid phone', style: TextStyle(color: Colors.red));
              }
              
              return Text(
                'Valid Phone: $phoneNumber',
                style: TextStyle(color: Colors.green),
              );
            },
          ),
        ],
      ),
    ),
  );
}
```

## Additional Information

*   **Found a Bug or Have a Feature Request?** Please file an issue on our [GitHub repository](https://github.com/DecksPlayer/phonevalidator/issues).
*   **Want to Contribute?** We welcome pull requests! Feel free to fork the repository and submit your changes.
*   **License**: This package is licensed under the Apache 2.0 License. See the `LICENSE` file for more details.
