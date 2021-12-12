import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  const ScheduleRowTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: AppFonts.basisGrotesquePro,
      fontWeight: FontWeight.w500,
      height: 1.3333,
    );
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '8:00',
              style: textStyle,
            ),
            Text(
              '10:00',
              style: textStyle,
            ),
          ],
        ),
        SizedBox(
          width: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ],
    );
  }
}
