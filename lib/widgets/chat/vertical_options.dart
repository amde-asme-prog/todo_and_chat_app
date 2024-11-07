import 'package:flutter/material.dart';
import 'package:todo_chat_app/widgets/chat/options_tile.dart';

class VerticalOptions extends StatelessWidget {
  const VerticalOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.over,
      itemBuilder: (context) => [
        PopupMenuItem(
          child:
              OptionsTile(ctx: context, title: 'Mute', icon: Icons.voice_chat),
        ),
        PopupMenuItem(
          child: OptionsTile(
              ctx: context, title: 'Video Call', icon: Icons.videocam_outlined),
        ),
        PopupMenuItem(
          child: OptionsTile(ctx: context, title: 'Search', icon: Icons.search),
        ),
        PopupMenuItem(
          child: OptionsTile(
              ctx: context, title: 'Delete Chat', icon: Icons.delete_outline),
        ),
      ],
      child: const Icon(Icons.more_vert),
    );
  }
}
