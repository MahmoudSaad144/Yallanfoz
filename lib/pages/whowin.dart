import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallanfoz/controller/gamepage_controller.dart';

class WhoWinPage extends StatefulWidget {
  const WhoWinPage({super.key});

  @override
  State<WhoWinPage> createState() => _WhoWinPageState();
}

class _WhoWinPageState extends State<WhoWinPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_FloatingIcon> _icons = [];
  final controller = Get.find<GamePageController>();

  @override
  void initState() {
    super.initState();
    controller.WhoWin();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    final random = Random();
    for (int i = 0; i < 25; i++) {
      _icons.add(
        _FloatingIcon(
          icon: _getRandomIcon(),
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: 24 + random.nextDouble() * 20,
          speed: 5 + random.nextDouble() * 10,
          color: _getRandomColor(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getRandomIcon() {
    final icons = [
      Icons.star,
      Icons.celebration,
      Icons.emoji_events,
      Icons.favorite,
      Icons.flash_on,
    ];
    return icons[Random().nextInt(icons.length)];
  }

  Color _getRandomColor() {
    final colors = [
      Colors.white.withOpacity(0.3),
      Colors.amber.withOpacity(0.3),
      Colors.orange.withOpacity(0.3),
      Colors.yellow.withOpacity(0.3),
      Colors.pink.withOpacity(0.3),
    ];
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // خلفية متدرجة
          Container(width: width, height: height, color: Colors.black),

          // الخلفية المتحركة بالأيقونات
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: Size(width, height),
                painter: _FloatingIconsPainter(
                  icons: _icons,
                  animation: _controller,
                ),
              );
            },
          ),

          // الكلام المتحرك
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: width * 0.07,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black38,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ScaleAnimatedText('مبروك 🎉'),
                      TypewriterAnimatedText(
                        'لقد فاز الفريق (${controller.whowin.value})',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                  ),
                ),
              ),
            ),
          ),

          // زر الرجوع
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  await controller.UpdateMyGame(finished: true);
                  Get.offNamedUntil(
                    '/mygames',
                    (route) => route.settings.name == '/home',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'العودة للرئيسية',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// موديل الأيقونة المتحركة
class _FloatingIcon {
  final IconData icon;
  final double x;
  final double y;
  final double size;
  final double speed;
  final Color color;

  _FloatingIcon({
    required this.icon,
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.color,
  });
}

// الرسام المسؤول عن تحريك الأيقونات
class _FloatingIconsPainter extends CustomPainter {
  final List<_FloatingIcon> icons;
  final Animation<double> animation;

  _FloatingIconsPainter({required this.icons, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    for (final icon in icons) {
      final t = (animation.value * icon.speed) % 1;
      final dy = size.height * (icon.y - t + 1) % size.height;
      final dx = size.width * icon.x;

      final textPainter = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(icon.icon.codePoint),
          style: TextStyle(
            fontSize: icon.size,
            fontFamily: icon.icon.fontFamily,
            color: icon.color,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas, Offset(dx, dy));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
