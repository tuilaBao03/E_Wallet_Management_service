
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/menu_app_controller.dart';
import '../../models/user.dart';
import '../../responsive.dart';

class Header extends StatelessWidget {
  final User user;
  final String title; // Thêm biến title vào class
  final bool isAuth;
  const Header({
    super.key, required this.title, required this.user, required this.isAuth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (!Responsive.isMobile(context) )
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),

        if(isAuth)Expanded(child: SearchField()),
        if(isAuth)ProfileCard(user: user,)
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({
    super.key, required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Theme.of(context).colorScheme.onPrimary,),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text(user.firstName, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,),),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Theme.of(context).colorScheme.onPrimary,),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg",color: Theme.of(context).colorScheme.secondary,),
          ),
        ),
      ),
    );
  }
}
