import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/app_fonts.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  const ScheduleRowSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF101115),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 16, top: 4, right: 4, bottom: 16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: _SpeakerWidget()),
              _FavoriteButtonWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: const _DescriptionWidget(),
          ),
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
        Expanded(
          child: Text(
            'Иннокентий Христорожденнныйвсубботу',
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: AppFonts.basisGrotesquePro,
              fontWeight: FontWeight.w500,
              height: 1.4285714286,
            ),
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
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      iconSize: 24,
      onPressed: () {},
      icon: Image.asset(AppImages.bookmark),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      'Субъуктивность в оценке дизайне',
      maxLines: 2,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: Colors.white.withOpacity(0.88),
        fontSize: 18,
        fontFamily: AppFonts.steinback,
        fontWeight: FontWeight.w500,
        height: 1.22222,
      ),
    );
  }
}
