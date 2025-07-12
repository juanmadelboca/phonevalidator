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

## Testing Numbers

| Country Code | Phone Number | Expected Validation | Country   |
|--------------|--------------|---------------------|-----------|
| +54          | 1123456789   | Valid               | Argentina |
| +1           | 2025550191   | Valid               | USA       |
| +1           | 4165550123   | Valid               | Canada    |
| +44          | 2079460958   | Valid               | UK        |
| +49          | 30123456     | Valid               | Germany   |
| +33          | 612345678   | Valid               |  France    |
| +34          | 612345678   | Valid               | Spain     |
| +55          | 11912345678  | Valid               | Brasil    |
| +52          | 5512345678   | Valid               | Mexico    |
| +91          | 9123456789   | Valid               | India     |
| +61          | 412345678    | Valid               | Australia |
| +81          | 7012345678   | Valid               | Japan     |
| +82          | 1012345678   | Valid               | South Korea |
| +7           | 9123456789   | Valid               | Russia    |
| +27          | 821234567    | Valid               | South Africa |
| +39          | 3123456789   | Valid               | Italy     |
| +86          | 13812345678  | Valid               | China     |
| +92          | 3001234567   | Valid               | Pakistan  |
| +234         | 8031234567   | Valid               | Nigeria   |
| +880         | 1712345678   | Valid               | Bangladesh |
| +20          | 1001234567   | Valid               | Egypt     |
| +62          | 81234567890  | Valid               | Indonesia |
| +63          | 9171234567   | Valid               | Philippines |
| +66          | 812345678    | Valid               | Thailand  |
| +966         | 501234567    | Valid               | Saudi Arabia |
| +98          | 9123456789   | Valid               | Iran      |
| +60          | 123456789    | Valid               | Malaysia  |
| +31          | 612345678    | Valid               | Netherlands |
| +48          | 500123456    | Valid               | Poland    |
| +40          | 712345678    | Valid               | Romania   |
| +380         | 501234567    | Valid               | Ukraine   |
| +56          | 912345678    | Valid               | Chile     |
| +57          | 3001234567   | Valid               | Colombia  |
| +51          | 912345678    | Valid               | Peru      |
| +58          | 4121234567   | Valid               | Venezuela |
| +213         | 512345678    | Valid               | Algeria   |
| +244         | 912345678    | Valid               | Angola    |
| +229         | 61234567     | Valid               | Benin     |
| +267         | 71234567     | Valid               | Botswana  |
| +226         | 61234567     | Valid               | Burkina Faso |





## Additional Information

*   **Found a Bug or Have a Feature Request?** Please file an issue on our [GitHub repository](https://github.com/DecksPlayer/phonevalidator/issues).
*   **Want to Contribute?** We welcome pull requests! Feel free to fork the repository and submit your changes.
*   **License**: This package is licensed under the Apache 2.0 License. See the `LICENSE` file for more details.
