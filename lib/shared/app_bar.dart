import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rescue_spot/shared/theme.dart';
import 'package:rescue_spot/shared/widgets.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<bool> isSelected = List.generate(3, (index) => false);
  List<String> items = [
    'Find a pet',
    'About us',
    'get involved',
  ];
  List<bool> isHovered = List.generate(3, (index) => false);
  bool auth = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 800)
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 4),
                blurRadius: 4,
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  SvgImages.logoImages,
                  height: 25,
                  alignment: Alignment.topCenter,
                ),
                Spacer(),
                MenuItem(
                  title: "Find a Pet",
                  press: () {},
                ),
                MenuItem(
                  title: "About us",
                  press: () {},
                ),
                MenuItem(
                  title: "Get involved",
                  press: () {},
                ),
                Spacer(),
                MenuItem(
                  title: "Sign up",
                  press: () {},
                ),
                DefaultButton(
                  text: "Log in",
                  press: () {},
                ),
              ],
            ),
          );
        else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 4),
                blurRadius: 4,
              )
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  SvgImages.logoImages,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
                Spacer(),
                Container(
                  // width: 500,
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              isSelected[buttonIndex] = true;
                              isHovered[buttonIndex] = true;
                            } else {
                              isHovered[buttonIndex] = false;
                              isSelected[buttonIndex] = false;
                            }
                          }
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: isSelected[index]
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: MouseRegion(
                                onEnter: (event) => setState(() {
                                  isSelected[index]
                                      ? null
                                      : isHovered[index] = true;
                                }),
                                onExit: (event) => setState(() {
                                  isSelected[index]
                                      ? isHovered[index] = true
                                      : isHovered[index] = false;
                                }),
                                child: Text(
                                  items[index].toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: isHovered[index]
                                        ? AppColors.secondPrimaryColor
                                        : AppColors.primaryyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // MenuItem(
                //   title: "About us",
                //   press: () {},
                // ),
                // MenuItem(
                //   title: "Get involved",
                //   press: () {},
                // ),
                Spacer(),

                auth
                    ? Row(
                        children: [
                          MenuItem(
                            title: "Sign up",
                            press: () {},
                          ),
                          DefaultButton(
                            text: "Log in",
                            press: () {
                              setState(() {
                                auth = false;
                              });
                            },
                          ),
                        ],
                      )
                    : Row(children: [
                        SvgPicture.asset(SvgImages.userImages),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: VerticalDivider(),
                        ),
                        SvgPicture.asset(SvgImages.logoutImages),
                      ])
              ],
            ),
          );
        }
      },
    );
  }
}
