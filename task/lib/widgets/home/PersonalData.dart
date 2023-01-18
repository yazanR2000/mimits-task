import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/view_models/AuthViewModel.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context,listen: false);
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          //margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Image(
            image: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              const TextSpan(text: "Hello, "),
              TextSpan(text: authProvider.userData['name'],style:const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.place_outlined),
            SizedBox(
              width: 10,
            ),
            Text("Irbid, Jordan"),
          ],
        ),
      ],
    );
  }
}
