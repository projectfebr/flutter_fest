import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';
import 'package:flutter_fest/application/UI/themes/app_text_styles.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;
  const ScheduleRowSessionWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: configuration._style.widgetBackground,
        borderRadius: BorderRadius.circular(20),
        gradient: RadialGradient(
          center: Alignment.topRight,
          colors: [
            const Color(0xFF00B90D),
            configuration._style.widgetBackground,
          ],
        ),
      ),
      padding: const EdgeInsets.only(left: 16, top: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: _SpeakerWidget(
                configuration: configuration,
              )),
              _FavoriteButtonWidget(
                configuration: configuration,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: _DescriptionWidget(
              configuration: configuration,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _SpeakerWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarRadius = 12.0;
    return Row(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          foregroundImage: NetworkImage(
            configuration.avatarUrl,
            // 'https://www.meme-arsenal.com/memes/54f17b77ced3591bebe54c4f1cb32967.jpg',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            configuration.speakerName,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: AppTextStyles.bookText.copyWith(color: configuration._style.speakerNameColor),
          ),
        ),
      ],
    );
  }
}

class _FavoriteButtonWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _FavoriteButtonWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      iconSize: 24,
      onPressed: () {},
      icon: Image.asset(
        configuration._favoriteStyle.favoriteIconButton,
        color: configuration._favoriteStyle.favoriteButtonColor,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _DescriptionWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      configuration.sessionTitle,
      maxLines: 2,
      overflow: TextOverflow.fade,
      style:
          AppTextStyles.steinbackNormalText.copyWith(color: configuration._style.sessionTitleColor),
    );
  }
}

class _ScheduleRowSessionWidgetConfigurationFavoriteStyle {
  final Color? favoriteButtonColor;
  final Color? widgetBackgroundGradient;
  final String favoriteIconButton;

  const _ScheduleRowSessionWidgetConfigurationFavoriteStyle({
    required this.favoriteIconButton,
    required this.favoriteButtonColor,
    required this.widgetBackgroundGradient,
  });
}

class _ScheduleRowSessionWidgetConfigurationProgressStyle {
  final Color widgetBackground;
  final Color speakerNameColor;
  final Color sessionTitleColor;

  const _ScheduleRowSessionWidgetConfigurationProgressStyle({
    required this.widgetBackground,
    required this.speakerNameColor,
    required this.sessionTitleColor,
  });
}

class ScheduleRowSessionWidgetConfiguration {
  final String avatarUrl;
  final String speakerName;
  final String sessionTitle;
  final bool isFavorite;
  final ScheduleRowWidgetConfigurationProgressStatus progressStatus;

  ScheduleRowSessionWidgetConfiguration({
    required this.avatarUrl,
    required this.speakerName,
    required this.sessionTitle,
    required this.isFavorite,
    required this.progressStatus,
  });

  _ScheduleRowSessionWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgressStatus.oncoming:
        return oncomingStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return oncomingStyle;
    }
  }

  _ScheduleRowSessionWidgetConfigurationFavoriteStyle get _favoriteStyle =>
      isFavorite ? isFavoriteStyle : isNotFavoriteStyle;

  static const oncomingStyle = _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: AppColors.darkSecondary,
    speakerNameColor: AppColors.darkText,
    sessionTitleColor: AppColors.white,
  );

  static const pastStyle = _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: Colors.transparent,
    speakerNameColor: AppColors.darkText48,
    sessionTitleColor: AppColors.darkText,
  );

  static const isFavoriteStyle = _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
    favoriteButtonColor: Colors.green,
    widgetBackgroundGradient: Colors.green,
    favoriteIconButton: AppImages.bookmarkFull,
  );

  static const isNotFavoriteStyle = _ScheduleRowSessionWidgetConfigurationFavoriteStyle(
    favoriteButtonColor: null,
    widgetBackgroundGradient: null,
    favoriteIconButton: AppImages.bookmark,
  );
}
