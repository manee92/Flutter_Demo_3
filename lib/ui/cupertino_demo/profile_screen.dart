import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
              backgroundColor: CupertinoColors.extraLightBackgroundGray,
              border: Border(
                bottom: BorderSide.none,
              ),
              largeTitle: Text('Profile'),
          ),
          SliverFillRemaining(
            child: Column(
              children: const <Widget>[
                Text("Profile")

              ],
            ),
          ),
        ],
      ),

    );
  }
}
