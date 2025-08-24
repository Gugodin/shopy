import 'package:flutter/material.dart';

class HeaderProductsList extends StatelessWidget {
  const HeaderProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusBarHeight = MediaQuery.paddingOf(context).top + 15;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: theme.primaryColor,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Lista de compras',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  'Bienvenido a Shopy',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  'Los productos se listaran a continuacion',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 50,
              )),
        ],
      ),
    );
  }
}
