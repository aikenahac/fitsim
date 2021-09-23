import 'package:fitsim/screens/home.screen.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 0.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              blurRadius: 2.0,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                icon: const Icon(Icons.home),
              ),
              CircleAvatar(
                  child: Image.network(
                      'https://icon-library.com/images/avatar-icon-png/avatar-icon-png-25.jpg')),
            ],
          ),
        ),
      ),
    );
  }
}
