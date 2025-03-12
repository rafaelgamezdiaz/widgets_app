import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subTitle: 'Un contenedos estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'SnackBar and Dialogs',
    subTitle: 'Indicadores en Pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animated Container',
    subTitle: 'Statefull Widget animado',
    link: '/animated',
    icon: Icons.animation,
  ),
  MenuItems(
    title: 'UI Controls',
    subTitle: 'Flutter UI Controls',
    link: '/ui-controls',
    icon: Icons.car_rental_rounded,
  ),
  MenuItems(
    title: 'Tutorial',
    subTitle: 'Introducción de la aplicación',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
  MenuItems(
    title: 'Infinite Scroll & Pull to Refresh',
    subTitle: 'Scroll infinito y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
];
