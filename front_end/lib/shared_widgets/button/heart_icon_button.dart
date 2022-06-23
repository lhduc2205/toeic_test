import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class HeartIconButton extends StatefulWidget {
  HeartIconButton({
    Key? key,
    this.isFav = false,
    this.splashRadius,
    this.iconSize,
  }) : super(key: key);

  bool isFav;
  final double? splashRadius;
  final double? iconSize;

  @override
  State<HeartIconButton> createState() => _HeartIconButtonState();
}

class _HeartIconButtonState extends State<HeartIconButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_controller);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.iconSize ?? 20, end: 30),
          weight: 30,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: widget.iconSize ?? 20),
          weight: 30,
        ),
      ],
    ).animate(_controller);

    _controller.addListener(() {
      // print(_controller.value);
      // print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => widget.isFav = true);
      } else {
        setState(() => widget.isFav = false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return CustomIconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            widget.isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
