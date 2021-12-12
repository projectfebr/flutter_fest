import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  const ScheduleRowSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF101115),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: const [
              _SpeakerWidget(),
              _FavoriteButtonWidget(),
            ],
          ),
          const _DescriptionWidget(),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  const _SpeakerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarRadius = 12.0;
    return Row(
      children: const [
        CircleAvatar(
          radius: avatarRadius,
          foregroundImage: NetworkImage(
            'https://www.meme-arsenal.com/memes/54f17b77ced3591bebe54c4f1cb32967.jpg',
          ),
        ),
        SizedBox(width: 8),
        Text(
          'Иннокентий Хвастуновский',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: AppFonts.basisGrotesquePro,
            fontWeight: FontWeight.w500,
            height: 1.4285714286,
          ),
        ),
      ],
    );
  }
}

class _FavoriteButtonWidget extends StatelessWidget {
  const _FavoriteButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
