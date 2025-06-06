import 'package:flutter/material.dart';

import '../colors.dart';


class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool? resizeToAvoidBottomInset;
  final bool isCenterFAB;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.isCenterFAB = true,
    this.scaffoldKey, this.bottomNavigationBar, this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.bgGradientBlue,
            AppColors.white,
          ],
          stops: [
            0.0,
            0.5
          ]
        ),
      ),
      child: Scaffold(
        floatingActionButtonLocation: isCenterFAB ? FloatingActionButtonLocation.centerDocked : FloatingActionButtonLocation.endFloat,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
        key: scaffoldKey, // Use the scafsfoldKey here
        backgroundColor: Colors.transparent,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        body: body,
        drawer: drawer,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
