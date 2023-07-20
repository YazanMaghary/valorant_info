import 'package:flutter/material.dart';
import 'package:valorant_info/constants.dart';

class myShowInfoWeaponWidget extends StatelessWidget {
  final String weaponImg;
  final List sknImg;
  final List sknName;
  final String weaponCategory;
  final int length;
  final String weaponName;
  const myShowInfoWeaponWidget(
      {super.key,
      required this.weaponImg,
      required this.weaponCategory,
      required this.weaponName,
      required this.sknImg,
      required this.length,
      required this.sknName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/backGround.jpg"),
            fit: BoxFit.cover,
          )),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    weaponCategory,
                    style: kStyleSmall,
                  ),
                  Text(
                    weaponName,
                    style: kStyleLargeBold,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(weaponImg),
                                fit: BoxFit.contain)),
                      )),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    flex: 5,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1),
                        itemCount: length - 1,
                        itemBuilder: (context, index) {
                          try {
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          // ignore: unnecessary_string_interpolations
                                          image: NetworkImage(
                                              "${sknImg[index]['displayIcon']}"),
                                          fit: BoxFit.contain)),
                                ),
                                Text('${sknName[index]['displayName']}')
                              ],
                            );
                          } catch (e) {
                            return const Text("Failed To Load");
                          }
                        }),
                  )
                ],
              ))),
    ));
  }
}
