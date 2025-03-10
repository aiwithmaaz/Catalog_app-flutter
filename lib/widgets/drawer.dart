import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/thems.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/v2/D5603AQESSdgx5Nd_FA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1727857000851?e=1740614400&v=beta&t=zUvZccwHoWbiC3WjQ-TDOy0ZUd4YB1LQ_3eB_Zhlg0k";
    return Drawer(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Muhammad Maaz"),
                accountEmail: Text("Muhammadmaazasif35@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Mytheme.darkbluisColor,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Mytheme.darkbluisColor,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Mytheme.darkbluisColor,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Mytheme.darkbluisColor,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Theme.of(context).elevatedButtonTheme.style?.backgroundColor?.resolve({}),
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Mytheme.darkbluisColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
