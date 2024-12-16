import 'package:flutter/material.dart';
import 'package:lumos/features/wifi/widgets/password_dialog.dart';

import '../services/models/network.dart';

class AnimatedListItem extends StatelessWidget {
  final Network network;
  final Animation<double> animation;

  const AnimatedListItem({
    super.key,
    required this.network,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        )),
        child: ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => PasswordDialog(
                networkName: network.name,
              ),
            );
          },
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          horizontalTitleGap: 15,
          title: Text(network.name),
          leading: Icon(network.signal >= 3 ? Icons.network_wifi_3_bar : Icons.network_wifi),
        ),
      ),
    );
  }
}
