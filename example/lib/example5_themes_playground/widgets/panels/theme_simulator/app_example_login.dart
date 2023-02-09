import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_images.dart';
import '../../../../shared/widgets/universal/svg_asset_image.dart';

/// An example that show what an app using the theme might look like
class AppExampleLogin extends StatelessWidget {
  const AppExampleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: const LoginColumn(),
    );
  }
}

class LoginColumn extends StatefulWidget {
  const LoginColumn({super.key});

  @override
  State<LoginColumn> createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Function to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const int numberOfPoints = 5;
    final double halfWidth = size.width / 2;
    final double externalRadius = halfWidth;
    final double internalRadius = halfWidth / 2.5;
    final double degreesPerStep = degToRad(360 / numberOfPoints);
    final double halfDegreesPerStep = degreesPerStep / 2;
    final Path path = Path();
    final double fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final MediaQueryData media = MediaQuery.of(context);
    debugPrint('Media size ${media.size}');

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sign In',
              style: textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'No account?',
                  style: textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Make account'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'Email',
                hintText: 'Enter your email address',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                labelText: 'Password',
                hintText: 'Minimum 8 chars',
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: () {
                    _confettiController.play();
                  },
                  child: ConfettiWidget(
                    confettiController: _confettiController,
                    numberOfParticles: 20,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    colors: const <Color>[
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.red,
                      Colors.indigo,
                      Colors.orange,
                      Colors.purple
                    ],
                    createParticlePath: drawStar,
                    canvas: Size.infinite,
                    child: Text(
                      'Sign In',
                      style: textTheme.titleMedium!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: SvgAssetImage(
                assetName: AppImages.verified,
                color: theme.colorScheme.primary,
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
