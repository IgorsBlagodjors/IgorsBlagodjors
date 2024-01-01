import 'package:flutter/material.dart';

class AddToFavoriteStarIcon extends StatefulWidget {
  final void Function() onPressed;
  final bool mutable;
  const AddToFavoriteStarIcon({
    super.key,
    required this.onPressed,
    required this.mutable,
  });

  @override
  State<AddToFavoriteStarIcon> createState() => _AddToFavoriteStarIconState();
}

class _AddToFavoriteStarIconState extends State<AddToFavoriteStarIcon> {
  late bool isPressed;
  @override
  void initState() {
    super.initState();
    isPressed = widget.mutable;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.mutable
          ? const Icon(
              Icons.star,
              color: Color(0xFFff9800),
            )
          : Icon(
              isPressed ? Icons.star : Icons.star_border,
              color: const Color(0xFFff9800),
            ),
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });
        widget.onPressed();
      },
    );
  }
}
