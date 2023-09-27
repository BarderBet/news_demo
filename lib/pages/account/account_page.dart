import 'package:flutter/material.dart';
import 'package:news_demo/global.dart';
import 'package:news_demo/provider/app.dart';
import 'package:news_demo/utils/utils.dart';
import 'package:news_demo/values/values.dart';
import 'package:news_demo/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

Widget _buildUserHeader() {
  return Container(
    height: duSetWidth(333),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            height: duSetWidth(333),
            decoration: const BoxDecoration(
              color: AppColors.primaryBackground,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: duSetWidth(2),
                  decoration: const BoxDecoration(
                    color: AppColors.tabCellSeparator,
                  ),
                  child: Container(),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 40,
          right: 20,
          bottom: 21,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: duSetWidth(198),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: duSetWidth(108),
                        height: duSetWidth(108),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                width: duSetWidth(108),
                                height: duSetWidth(108),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  boxShadow: const [
                                    Shadows.primaryShadow,
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(duSetWidth(108) / 2),
                                  ),
                                ),
                                child: Container(),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              child: Image.asset(
                                'assets/images/account_header.png',
                              ),
                            ),
                            Positioned(
                              top: 10,
                              height: duSetWidth(88),
                              width: duSetWidth(88),
                              child: Image.asset(
                                "assets/images/account_header.png",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      child: Text(
                        Global.profile.displayName ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: duSetFontSize(24),
                        ),
                      ),
                    ),
                    Text(
                      "@boltrogers",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w400,
                        fontSize: duSetFontSize(16),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: duSetWidth(44),
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color.fromARGB(255, 41, 103, 255),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Get Premium - \$9.99",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(18),
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

Widget _buildCell(
    {String? title,
    String? subTitle,
    int? number,
    bool hasArrow = false,
    VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: duSetWidth(60),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: duSetWidth(60),
              decoration: const BoxDecoration(
                color: AppColors.primaryBackground,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: duSetWidth(1),
                    decoration: const BoxDecoration(
                      color: AppColors.tabCellSeparator,
                    ),
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                number == null
                    ? Container()
                    : Container(
                        margin: const EdgeInsets.only(right: 11),
                        child: Text(
                          number.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                            fontSize: duSetFontSize(18),
                          ),
                        ),
                      ),
                hasArrow == false
                    ? Container()
                    : Container(
                        width: duSetWidth(24),
                        height: duSetWidth(24),
                        margin: const EdgeInsets.only(right: 20),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryText,
                        ),
                      ),
              ],
            ),
          ),
          title == null
              ? Container()
              : Positioned(
                  left: 20,
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(18),
                    ),
                  ),
                ),
          subTitle == null
              ? Container()
              : Positioned(
                  right: 20,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(18),
                    ),
                  ),
                ),
        ],
      ),
    ),
  );
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    // final appstate =  Provider.of<AppState>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildUserHeader(),
          divider10Px(),

          _buildCell(
            title: "Email",
            subTitle: "boltrogers@gmail.com",
          ),
          divider10Px(),

          _buildCell(
            title: "Favorite channels",
            number: 12,
            hasArrow: true,
          ),
          _buildCell(
            title: "Bookmarks",
            number: 294,
            hasArrow: true,
          ),
          _buildCell(
            title: "Popular categories",
            number: 7,
            hasArrow: true,
          ),
          divider10Px(),

          _buildCell(
            title: "Newsletter",
            hasArrow: true,
          ),
          _buildCell(
            title: "Settings",
            hasArrow: true,
          ),
          divider10Px(),

          // _buildCell(
          //   title: "Switch Gray Filter",
          //   hasArrow: true,
          //   onTap: () => appstate.switchGrayFilter(),
          // ),
          // _buildCell(
          //   title: "Log out",
          //   hasArrow: true,
          //   // onTap: () => goLoginPage(context),
          // ),
          // divider10Px(),
        ],
      ),
    );
  }
}
