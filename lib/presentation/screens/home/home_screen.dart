import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final List<MenuItems> menuItems = appMenuItems;

    return ListView.builder(
      //physics: const BouncingScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final menuItem = menuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItems menuItem;
  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: () {
        context.push(menuItem.link);

        //Navigator.pushNamed(context, menuItem.link);
        // Navigator.of(
        //   context,
        // ).push(MaterialPageRoute(builder: (context) => const ButtonsScreen()));

        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}
