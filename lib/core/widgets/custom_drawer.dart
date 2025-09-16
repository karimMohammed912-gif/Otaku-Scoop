import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_scope/core/widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,

        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [HeadSection(), AnimeDrawerItems(), MangaDrawerItems()],
        ),
      ),
    );
  }
}

class AnimeDrawerItems extends StatelessWidget {
  const AnimeDrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Anime Categories",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 10),
        Divider(),
        DrawerItem(
          icon: Icons.home,
          title: 'Last Updated',
          ontap: () {
            context.go('/latest');
            Navigator.of(context).pop();
          },
        ),

        DrawerItem(
          icon: FontAwesomeIcons.fireFlameCurved,
          title: 'Top Anime',
          ontap: () {
            context.go('/');
            Navigator.of(context).pop();
          },
        ),

        DrawerItem(
          icon: FontAwesomeIcons.calendarDays,
          title: 'Sesonal Anime ',
          ontap: () {
            context.go('/seasonal');
            Navigator.of(context).pop();
          },
        ),
        DrawerItem(
          icon: FontAwesomeIcons.magnifyingGlass,
          title: "search",
          ontap: () {},
        ),

        DrawerItem(
          icon: FontAwesomeIcons.shuffle,
          title: 'Recommendation ',
          ontap: () {
            context.go('/recommendation');
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class MangaDrawerItems extends StatelessWidget {
  const MangaDrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Manga Categories",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Divider(),

        const DrawerItem(
          icon: FontAwesomeIcons.fireFlameCurved,
          title: 'Top Manga',
        ),
        DrawerItem(
          icon: FontAwesomeIcons.shuffle,
          title: 'Recommendation Manga',
        ),
      ],
    );
  }
}

class HeadSection extends StatelessWidget {
  const HeadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 50),
        Text(
          'Otaku Scope',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
