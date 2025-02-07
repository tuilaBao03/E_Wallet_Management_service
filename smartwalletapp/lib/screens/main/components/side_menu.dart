import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/locallization/app_localizations.dart';

class SideMenu extends StatelessWidget {
  final Function(int) onMenuTap;

  const SideMenu({super.key, required this.onMenuTap});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () => onMenuTap(1),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("Transaction"),
            svgSrc: "assets/icons/menu_tran.svg",
            press: () => onMenuTap(2),
          ),

          DrawerListTile(
            title: AppLocalizations.of(context).translate("MyCard"),
            svgSrc: "assets/icons/menu_doc.svg",
            press: () => onMenuTap(3),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("Store"),
            svgSrc: "assets/icons/menu_store.svg",
            press: () => onMenuTap(4),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("Notifications"),
            svgSrc: "assets/icons/menu_notification.svg",
            press: () => onMenuTap(5),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("My Profile"),
            svgSrc: "assets/icons/menu_profile.svg",
            press: () => onMenuTap(6),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("Setting"),
            svgSrc: "assets/icons/menu_setting.svg",
            press: () => onMenuTap(7),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("Wallet"),
            svgSrc: "assets/icons/menu_task.svg",
            press: () => onMenuTap(8),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("ParkingSpotManagement"),
            svgSrc: "assets/icons/menu_task.svg",
            press: () => onMenuTap(9),
          ),
          DrawerListTile(
            title: AppLocalizations.of(context).translate("SpotOwnerManagement"),
            svgSrc: "assets/icons/menu_task.svg",
            press: () => onMenuTap(10),
          ),


        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onPrimary, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
