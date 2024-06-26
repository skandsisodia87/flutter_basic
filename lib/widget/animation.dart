import 'dart:async';

import 'package:flutter/material.dart';

class BoxAnimation extends StatefulWidget {
  const BoxAnimation({super.key});

  @override
  State<BoxAnimation> createState() => _BoxAnimationState();
}

class _BoxAnimationState extends State<BoxAnimation> {
  var _height = 100.0;
  var _width = 100.0;
  bool flag = true;
  Color bgcolor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
                color: bgcolor, borderRadius: BorderRadius.circular(12)),
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (flag) {
                  _height = 200.0;
                  _width = 50.0;
                  bgcolor = Colors.green;
                } else {
                  _height = 100.0;
                  _width = 100.0;
                  bgcolor = Colors.red;
                }
                flag = !flag;
                setState(() {});
              },
              child: const Text("Animate"))
        ],
      ),
    );
  }
}

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});

  @override
  State<OpacityAnimation> createState() => OpacityAnimationState();
}

class OpacityAnimationState extends State<OpacityAnimation> {
  var _opacity = 1.0;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
            opacity: _opacity,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (flag) {
                  _opacity = 0.3;
                } else {
                  _opacity = 1.0;
                }
                setState(() {
                  flag = !flag;
                });
              },
              child: const Text("Animate"))
        ],
      ),
    );
  }
}

class CrossFadeAnimation extends StatefulWidget {
  const CrossFadeAnimation({super.key});

  @override
  State<CrossFadeAnimation> createState() => CrossFadeAnimationState();
}

class CrossFadeAnimationState extends State<CrossFadeAnimation> {
  bool flag = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        flag = !flag;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            firstChild: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
            ),
            secondChild: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/groot.jpg')),
            duration: const Duration(seconds: 2),
            firstCurve: Curves.easeInCubic,
            secondCurve: Curves.easeInCirc,
            crossFadeState:
                flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ],
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Image Click Event",
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContainerView(),
              ));
        },
        child: const SizedBox(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/groot.jpg"),
          ),
        ),
      ),
    );
  }
}

class ContainerView extends StatefulWidget {
  const ContainerView({super.key});

  @override
  State<ContainerView> createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  var _height = 200.0;
  var _weight = 200.0;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _height = 100.0;
        _weight = 100.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "Image Click Event",
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          curve: Curves.bounceInOut,
          width: _weight,
          height: _height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
        ),
      ),
    );
  }
}

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});
  @override
  State<TweenAnimation> createState() => TweenAnimationState();
}

class TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 50.0, end: 200.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: animation.value, width: animation.value, color: Colors.red),
    );
  }
}

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});
  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  final _circleRadius = [50.0, 100.0, 150.0, 200.0, 250.0];

  late Animation _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 5), lowerBound: 0.2);

    // If animation is in between 0.0 - 1.0 then not need to this we can use value directly from conteoller
    // _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: _circleRadius
            .map((radius) => Container(
                  width: radius * _animationController.value,
                  height: radius * _animationController.value,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue
                          .withOpacity(1.0 - _animationController.value)),
                ))
            .toList(),
      ),
    );
  }
}
