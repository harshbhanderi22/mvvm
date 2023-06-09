import 'package:flutter/material.dart';
import 'package:mvvm/utils/app_color.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final bool isLoading;

  const RoundButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                )
              : Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
