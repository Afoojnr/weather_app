import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/backgrounds/bg.jpg')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Column(
              children: [
                Text(
                  "Montreal",
                  style: theme.textTheme.displaySmall!
                  // .copyWith(color: theme.colorScheme.primary)
                  ,
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
                Text("Mostly Clear",
                    style: theme.textTheme.bodyLarge!.copyWith()),
                Text("H:24°C L:18°C",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            Image(image: AssetImage('assets/images/house.png')),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
