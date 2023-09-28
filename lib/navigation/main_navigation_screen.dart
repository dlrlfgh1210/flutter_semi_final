import 'package:flutter/material.dart';
import 'package:flutter_semi_final/home/home_screen.dart';
import 'package:flutter_semi_final/navigation/nav_tab.dart';
import 'package:flutter_semi_final/post/views/post_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  static const routeName = "Navigation";
  static const routeURL = "/Navigation";
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "post",
  ];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const PostScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  isSelected: _selectedIndex == 0,
                  icon: Icons.house_outlined,
                  selectedIcon: Icons.house,
                  onTap: () => _onTap(0),
                ),
                NavTab(
                  isSelected: _selectedIndex == 1,
                  icon: Icons.pending_actions_outlined,
                  selectedIcon: FontAwesomeIcons.pen,
                  onTap: () => _onTap(1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
