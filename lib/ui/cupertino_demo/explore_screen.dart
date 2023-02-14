import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

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
              largeTitle: Text('Explore'),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("Categories")),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index){
                            return const SizedBox();
                          }, separatorBuilder: (BuildContext context, int index){
                        return const Divider();
                      }, itemCount: 10),
                    ),
                  ),
                )

              ],
            ),
          ),
        ],
      ),

    );
  }
}


List<Category> catList = [
  Category(name: "Lorem", icon: CupertinoIcons.cube, iconColor: CupertinoColors.systemRed)
];

class Category{
  String name;
  IconData icon;
  Color iconColor;

  Category({
    required this.name,
    required this.icon,
    required this.iconColor
  });
}