import 'package:flutter/material.dart';
import 'package:food_app/Utils/colors.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final Color? color;

  const LoginButton({
    this.text = '',
    this.onPress,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: color != null
            ? MaterialStateProperty.all(color)
            : MaterialStateProperty.all(AppColor.LM_BUTTON_NORMAL_BLUE_6),
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      ),
      onPressed: onPress,
      child: Text(
        text,
      ),
    );
  }
}
