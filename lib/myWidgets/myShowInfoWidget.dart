import 'package:flutter/material.dart';
import 'package:valorant_info/constants.dart';

class myShowInfoWidget extends StatelessWidget {
  final List desc;
  final List abiName;
  final List abiImg;
  final String agentImg;
  final String agentCategory;
  final String agentName;
  myShowInfoWidget(
      {super.key,
      required this.desc,
      required this.abiName,
      required this.abiImg,
      required this.agentImg,
      required this.agentCategory,
      required this.agentName});

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
                    agentCategory,
                    style: kStyleSmall,
                  ),
                  Text(
                    agentName,
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
                                image: NetworkImage(agentImg),
                                fit: BoxFit.contain)),
                      )),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                      flex: 3,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 2),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Image(
                                  image: NetworkImage(abiImg[index]),
                                  width: 100,
                                  height: 100,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor:
                                          ThemeData.dark().backgroundColor,
                                      content: Text(
                                        desc[index],
                                        style: const TextStyle(
                                            fontSize: 32, color: Colors.white),
                                      ),
                                    ));
                                  },
                                  child: Text(
                                    abiName[index],
                                    style: kStyleMedium,
                                  ),
                                ),
                              ],
                            );
                          }))
                ],
              ))),
    ));
  }
}
