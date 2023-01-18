import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/HomeViewModel.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, doctorsProvider, _) {
        if (doctorsProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: doctorsProvider.doctors.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 239, 234, 234),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          doctorsProvider.doctors[index]['doctorImageURL'],
                        ),
                        radius: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorsProvider.doctors[index]['doctorName'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () async {
                                await doctorsProvider.lunchEmail(doctorsProvider
                                    .doctors[index]['doctorEmail']);
                              },
                              leading: const Icon(Icons.email_outlined),
                              title: Text(
                                doctorsProvider.doctors[index]['doctorEmail'],
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () async {
                                await doctorsProvider.lunchPhone(doctorsProvider
                                    .doctors[index]['phoneNumber']);
                              },
                              leading: const Icon(Icons.phone_android_rounded),
                              title: Text(
                                doctorsProvider.doctors[index]['phoneNumber'],
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () async {
                                double lat = double.parse(doctorsProvider
                                    .doctors[index]['address']['latitude']);
                                double long = double.parse(doctorsProvider
                                    .doctors[index]['address']['longitude']);
                                await doctorsProvider.lunchMap(lat, long);
                              },
                              title: Text(
                                doctorsProvider.doctors[index]['address']
                                        ['city'] +
                                    '-' +
                                    doctorsProvider.doctors[index]['address']
                                        ['country'],
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.date_range),
                        label: const Text("Mondayʠ june 22"),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.schedule),
                        label: const Text("08:00 PM"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
