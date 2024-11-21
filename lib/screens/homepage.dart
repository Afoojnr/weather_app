import 'package:flutter/material.dart';
import 'dart:ui';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/backgrounds/bg.jpg')),
      ),
      child: const Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            _HeroDisplay(),
            Image(image: AssetImage('assets/images/house.png')),
            SizedBox(),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _ForeCastView(),
        ),
      ]),
    );
  }
}

class _HeroDisplay extends StatelessWidget {
  const _HeroDisplay();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          "Montreal",
          style: theme.textTheme.displaySmall!,
        ),
        SizedBox(
          height: 100,
          // width: 120,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text("19°",
                style: theme.textTheme.displayLarge!
                    .copyWith(fontWeight: FontWeight.w300)),
          ),
        ),
        Text("Mostly Clear", style: theme.textTheme.bodyLarge!.copyWith()),
        Text("H:24°C L:18°C",
            style: theme.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _ForeCastView extends StatefulWidget {
  const _ForeCastView();

  @override
  State<_ForeCastView> createState() => __ForeCastViewState();
}

class __ForeCastViewState extends State<_ForeCastView> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 5, 40, 8),
          height: 320,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border:
                  const Border(top: BorderSide(color: Colors.grey, width: 2)),
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 3,
                decoration: const BoxDecoration(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.white))),
                    child: const Text("Hourly Forecast"),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide.none)),
                    child: const Text("Weekly Forecast"),
                  ),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 0.3,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  _ForeCastItem(),
                  SizedBox(
                    width: 12,
                  ),
                  _ForeCastItem(
                    isActive: true,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  _ForeCastItem(),
                  SizedBox(
                    width: 12,
                  ),
                  _ForeCastItem(),
                  SizedBox(
                    width: 12,
                  ),
                  _ForeCastItem(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ForeCastItem extends StatelessWidget {
  final bool isActive;
  const _ForeCastItem({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF48319D) : Colors.transparent,
        border: Border.all(color: Colors.grey, width: 0.3),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
              color: Colors.black,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(0, 1.0),
              blurStyle: BlurStyle.outer)
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("12 AM"),
          Image(
            image: AssetImage('assets/icons/small/mcfw.png'),
            width: 35,
            height: 35,
          ),
          Text("19°")
        ],
      ),
    );
  }
}
