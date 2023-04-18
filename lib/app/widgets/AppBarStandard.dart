import 'package:diwanapp/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarStandard extends StatelessWidget {
  final String title;
  final bool isHome;

  const AppBarStandard({super.key, required this.title, this.isHome = false});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: AppColor.primaryBlueColor,
      flexibleSpace: SizedBox(
        height: 71,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    if (isHome)
                      Scaffold.of(context).openDrawer();
                    else
                      Navigator.pop(context);
                  },
                  icon: Icon(
                    isHome ? Icons.menu : Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 18,
                  ),
                ),
                const UserAvatarNotification(),
              ]),
        ),
      ),
    );
  }
}

class UserAvatarNotification extends StatelessWidget {
  const UserAvatarNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/user_notification_icon.png',
        height: 42,
        width: 43,
      ),
    );
  }
}
