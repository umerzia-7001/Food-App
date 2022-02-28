import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../Utils/colors.dart';
import '../../../config/size_config/size_config.dart';
import '../../auth/provider/auth_providers.dart';

class OrderHomeDrawer extends StatefulWidget {
  OrderHomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _OrderHomeDrawerState createState() => _OrderHomeDrawerState();
}

class _OrderHomeDrawerState extends State<OrderHomeDrawer> {
  final SizeConfig _config = SizeConfig();

  @override
  void initState() {
    super.initState();
  }

  Widget buildSegment(String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: 15, color: AppColor.grey7, fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Auth authModel = Provider.of<Auth>(context, listen: false);
    return Drawer(
      child: Container(
        color: AppColor.LM_BACKGROUND_BASIC,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            ListTile(
                tileColor: Colors.white,
                dense: true,
                leading: SvgPicture.asset(
                  "assets/images/drawer_logout_icon.svg",
                  color: AppColor.LM_BORDER_NORMAL_GREY7,
                ),
                minLeadingWidth: 5,
                title: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      color: AppColor.LM_BORDER_NORMAL_GREY7,
                      fontWeight: FontWeight.w400),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColor.LM_BORDER_NORMAL_GREY7,
                  size: 25,
                ),
                onTap: () async {
                  authModel.logout(context);
                }),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
