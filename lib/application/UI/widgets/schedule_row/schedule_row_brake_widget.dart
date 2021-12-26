import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';
import 'package:flutter_fest/application/UI/themes/app_text_styles.dart';

class ScheduleRowBrakeWidget extends StatelessWidget {
  const ScheduleRowBrakeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: _BrakeDecoratorWidget(true)),
        const SizedBox(width: 16),
        Text(
          'ПЕРЕРЫВ',
          style: AppTextStyles.brakeTimeElementSmall.copyWith(color: AppColors.white88),
        ),
        const SizedBox(width: 16),
        const Expanded(child: _BrakeDecoratorWidget(false)),
      ],
    );
  }
}

class _BrakeDecoratorWidget extends StatelessWidget {
  final bool reversed;
  const _BrakeDecoratorWidget(this.reversed);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 7.0),
      painter: _BrakeDecoratorPainter(reversed),
    );
  }
}

class _BrakeDecoratorPainter extends CustomPainter {
  final bool reversed;

  _BrakeDecoratorPainter(this.reversed);

  @override
  void paint(Canvas canvas, Size size) {
    const spaceWidth = 6.96;
    const itemWidth = 2.96;
    const itemOffset = 7.13;

    final paint = Paint()
      ..color = AppColors.darkText
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final itemsCount = (size.width / itemOffset).floor() + 1;
    final margin = reversed ? size.width - ((itemsCount - 1) * itemOffset) : 0;

    for (var i = 0; i < itemsCount; i++) {
      final xOffset = i * spaceWidth + margin;
      final startPoint = Offset(xOffset + itemWidth, 0);
      final endPoint = Offset(xOffset, size.height);
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BrakeDecoratorPainter oldDelegate) {
    return reversed != oldDelegate.reversed;
  }
}
