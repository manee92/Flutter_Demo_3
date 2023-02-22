import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/new_event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
              backgroundColor: CupertinoColors.extraLightBackgroundGray,
              border: Border(
                bottom: BorderSide.none,
              ),
              leading: Icon(CupertinoIcons.person_2),
              largeTitle: Text('Home'),
              trailing: Icon(CupertinoIcons.add_circled)),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CupertinoSearchTextField(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,vertical: 8
                    ),
                    style: const TextStyle(fontSize: 18),
                    controller: textController,
                    placeholder: 'Search',
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  CupertinoColors.extraLightBackgroundGray,
                              child: Icon(
                                CupertinoIcons.calendar,
                                color: CupertinoColors.systemRed,
                                size: 80,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Find new events",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                            "Register for upcoming event details with your account",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18)),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: width,
                          child: CupertinoButton(
                            color: CupertinoColors.activeBlue,
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {}
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) => const NewEventsScreen(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: const [
                              Icon(
                                CupertinoIcons.calendar_badge_plus,
                                color: CupertinoColors.activeBlue,
                                size: 40,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Add new events",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ],
                          )),
                          const Expanded(
                            flex: 0,
                              child: Icon(
                            CupertinoIcons.chevron_forward,
                            color: CupertinoColors.separator,
                            size: 30,
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
