import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/HomeViewModel.dart';

class UpcomingApointment extends StatelessWidget {
  const UpcomingApointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, docProvider, _) {
        if (docProvider.isLoading) {
          return const SizedBox();
        }
        Random random = new Random();
        int randomNumber1 = random.nextInt(docProvider.doctors.length);
        int randomNumber2 = random.nextInt(docProvider.doctors.length);
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Upcoming Apointment"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color((random.nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(docProvider
                                  .doctors[randomNumber1]['doctorImageURL']),
                              radius: 30,
                            ),
                            Text(docProvider.doctors[randomNumber1]
                                ['doctorName']),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.date_range),
                              label: const Text(
                                "Sunday. Aug 22 ",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.schedule),
                              label: const Text(
                                "At 10:00 AM ",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color((random.nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(docProvider
                                  .doctors[randomNumber2]['doctorImageURL']),
                              radius: 30,
                            ),
                            Text(docProvider.doctors[randomNumber2]
                                ['doctorName']),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.date_range),
                              label: const Text(
                                "Sunday. Aug 22 ",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.schedule),
                              label: const Text(
                                "At 10:00 AM ",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
