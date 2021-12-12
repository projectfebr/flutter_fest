import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  final ScheduleRowTimeWidgetConfiguration configuration;
  const ScheduleRowTimeWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 12,
      fontFamily: AppFonts.basisGrotesquePro,
      fontWeight: FontWeight.w500,
      height: 1.3333,
    );
    return SizedBox(
      width: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                configuration.startTime,
                style:
                    textStyle.copyWith(color: configuration._style.startColor),
              ),
              Text(
                configuration.finishTime,
                style:
                    textStyle.copyWith(color: configuration._style.finishColor),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Expanded(
                child: _DividerWidget(
                    color: configuration._style.startColor,
                    position: _DividerWidgetPosition.top),
              ),
              Expanded(
                child: _DividerWidget(
                    color: configuration._style.finishColor,
                    position: _DividerWidgetPosition.bottom),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _DividerWidgetPosition { top, bottom }

class _DividerWidget extends StatelessWidget {
  final Color color;
  final _DividerWidgetPosition position;
  const _DividerWidget({Key? key, required this.color, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(1);
    final borderRadius = position == _DividerWidgetPosition.top
        ? const BorderRadius.only(
            topLeft: radius,
            topRight: radius,
          )
        : const BorderRadius.only(
            bottomLeft: radius,
            bottomRight: radius,
          );
    return SizedBox(
      width: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Container(),
      ),
    );
  }
}

class _ScheduleRowTimeWidgetConfigurationProgressStyle {
  final Color startColor;
  final Color finishColor;

  const _ScheduleRowTimeWidgetConfigurationProgressStyle({
    required this.startColor,
    required this.finishColor,
  });
}

class ScheduleRowTimeWidgetConfiguration {
  final String startTime;
  final String finishTime;
  final ScheduleRowWidgetConfigurationProgressStatus progressStatus;

  _ScheduleRowTimeWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgressStatus.oncoming:
        return oncomingStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return inProgressStyle;
    }
  }

  ScheduleRowTimeWidgetConfiguration({
    required this.startTime,
    required this.finishTime,
    required this.progressStatus,
  });

  static const oncomingStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
      startColor: Color(0xB7FFFFFF), finishColor: Color(0xB7FFFFFF));

  static const pastStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
      startColor: Color(0xB752525E), finishColor: Color(0xB752525E));

  static const inProgressStyle =
      _ScheduleRowTimeWidgetConfigurationProgressStyle(
          startColor: Color(0xB752525E), finishColor: Color(0xB700BD13));
}
