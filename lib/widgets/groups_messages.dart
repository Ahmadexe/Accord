import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';

class GroupMessages extends StatelessWidget {
  final snap;
  const GroupMessages({required this.snap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 0,
        right: 0
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: secondaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(snap['senderName'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Text(snap['message'], style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}