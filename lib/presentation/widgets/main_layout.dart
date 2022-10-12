import 'package:flutter/material.dart';
import 'package:getx_bank/consts.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final Widget? appBar;
  final Color? backgroundColor;

  const MainLayout({
    required this.child,
    this.appBar,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.darkPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar ??
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    bottom: 16.0,
                  ),
                  color: Theme.of(context).primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    'MoneyApp',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
            child,
          ],
        ),
      ),
    );
  }
}
