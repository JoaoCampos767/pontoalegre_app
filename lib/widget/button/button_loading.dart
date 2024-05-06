import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingButton extends StatefulWidget {
  final String _title;
  final Function() _onPressed;
  final bool _loading;

  const LoadingButton({super.key, required title, required onPressed, required loading})
      : _title = title,
        _onPressed = onPressed,
        _loading = loading;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () => widget._onPressed(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
        ),
        child: Center(
          child: widget._loading
              ? LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 25)
              : Text(
            widget._title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}