import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckAnimation extends StatefulWidget{
  ValueNotifier<bool> isValidPhoneNotifier;
  CheckAnimation({super.key, required this.isValidPhoneNotifier});
  @override
  State<CheckAnimation> createState() => _CheckAnimation();
}

class _CheckAnimation extends State<CheckAnimation>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return ValueListenableBuilder(valueListenable: widget.isValidPhoneNotifier..value, builder: (context,isValid,_){
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: isValid
              ? const Icon(
            key: Key('0'), Icons.check_circle_outline, color: Colors.green,)
              : const Icon(
              key: Key('1'), Icons.cancel_outlined, color: Colors.red),
        );
      } );

  }

}