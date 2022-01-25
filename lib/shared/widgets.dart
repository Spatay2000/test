import 'package:flutter/material.dart';
import 'package:rescue_spot/shared/theme.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const MenuItem({
    Key? key,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Soleil',
            fontSize: 12.0,
            color: AppColors.primaryyColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const DefaultButton({
    required this.text,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: FlatButton(
        color: AppColors.defButtonColor,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        onPressed: press,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(fontSize: 12.0),
        ),
      ),
    );
  }
}
