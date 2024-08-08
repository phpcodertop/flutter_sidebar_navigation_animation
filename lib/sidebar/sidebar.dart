import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sidebar_navigation_animation/bloc/navigation_bloc.dart';
import 'package:sidebar_navigation_animation/sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  Color bgColor = const Color(0xFF262AAA);
  final Duration _animationDuration = const Duration(milliseconds: 500);
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarStreamSink;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarStreamSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarStreamSink.close();
    super.dispose();
  }

  void changeOpenState() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarStreamSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarStreamSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          left: isSideBarOpenAsync.data! ? 0 : -screenWidth,
          bottom: 0,
          right: isSideBarOpenAsync.data! ? 0 : screenWidth - 45,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: bgColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const ListTile(
                        title: Text(
                          'Ahmed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        subtitle: Text(
                          'phpcodertop@gmail.com',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white24,
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: 'Home',
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(HomePageClickedEvent());
                          changeOpenState();
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: 'My Account',
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(MyAccountClickedEvent());
                          changeOpenState();
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: 'My Orders',
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(MyOrdersClickedEvent());
                          changeOpenState();
                        },
                      ),
                      MenuItem(
                        icon: Icons.card_giftcard,
                        title: 'Wishlist',
                        onTap: () {},
                      ),
                      const Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white24,
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: 'Settings',
                        onTap: () {},
                      ),
                      MenuItem(
                          icon: Icons.exit_to_app,
                          title: 'Logout',
                          onTap: () {}),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.8),
                child: GestureDetector(
                  onTap: changeOpenState,
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      height: 110,
                      width: 35,
                      color: bgColor,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                        progress: _animationController.view,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
