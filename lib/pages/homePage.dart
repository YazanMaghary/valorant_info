// ignore: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:valorant_info/Module/agents/agentsbrain.dart';
import 'package:valorant_info/Services/Network.dart';
import 'package:valorant_info/myWidgets/myButton.dart';
import '../constants.dart';
import '../myWidgets/myShowInfoWeaponWidget.dart';
import '../myWidgets/myShowInfoWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  List weapon = [];
  int? length;
  bool? isAgent;
  AgentsBrain agentsBrain = AgentsBrain();

  // Future<void> valorantAgentsStatus() async {
  //   Map<String, dynamic> agentsInfo =
  //       await NetworkHelper(url: "https://valorant-api.com/v1/agents")
  //           .getData();
  //   length = agentsInfo['data'].length;
  //   Agent = agentsInfo['data'];
  //   // name = agentsInfo['data'][counter]['displayName'];
  //   // agnetsCategory = agentsInfo['data'][counter]['role']['displayName'];
  //   // img = agentsInfo['data'][counter]['fullPortrait'];
  //   // bcColor = agentsInfo['data'][counter]['backgroundGradientColors'];
  //   // ignore: avoid_print
  //   print(length);
  // }

  Future<void> valorantWeaponsStatus() async {
    Map<String, dynamic> weaponsInfo =
        await NetworkHelper(url: "https://valorant-api.com/v1/weapons")
            .getData();
    length = weaponsInfo['data'].length;
    weapon = weaponsInfo['data'];
    // name = agentsInfo['data'][counter]['displayName'];
    // agnetsCategory = agentsInfo['data'][counter]['role']['displayName'];
    // img = agentsInfo['data'][counter]['fullPortrait'];
    // bcColor = agentsInfo['data'][counter]['backgroundGradientColors'];
    // ignore: avoid_print
    print(length);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/backGround2.jpg"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Headers
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Learn\nValorant Game",
                          style: kStyleLargeBold,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  "images/icon.jpeg",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(222)),
                          width: 50,
                          height: 50,
                        )
                      ],
                    )),
                // Buttons
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myButton(
                            name: "Agents",
                            fun: () async {
                              isAgent = true;
                              await agentsBrain.valorantAgentsStatus();
                              setState(() {});
                            }),
                        const SizedBox(
                          width: 20,
                        ),
                        myButton(
                            name: "Weapons",
                            fun: () async {
                              await valorantWeaponsStatus();
                              isAgent = false;
                              setState(() {});
                            })
                      ],
                    )),
                //Agents
                Expanded(
                  flex: 4,
                  child: GridView.builder(
                      padding: const EdgeInsets.only(top: 40),
                      physics: const BouncingScrollPhysics(),
                      itemCount: isAgent == true ? 23 : weapon.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: isAgent == true ? 100 : 0,
                          crossAxisSpacing: 20,
                          crossAxisCount: isAgent == true ? 2 : 1),
                      itemBuilder: (context, index) {
                        if (isAgent == true) {
                          if (index == 9) {
                            return const Placeholder();
                          } else {
                            return Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(
                                          agentsBrain.abilitiesColor(index)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16))),
                                ),
                                Positioned(
                                    top: 20,
                                    left: 10,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      width: 40,
                                      height: 40,
                                      child: IconButton(
                                        onPressed: () async {
                                          final player = AudioPlayer();
                                          await player.play(UrlSource(
                                              agentsBrain.urlWave(index)));
                                          // var result =
                                          //     await player.getDuration();
                                          // print(result?.inSeconds);
                                        },
                                        icon: const Icon(
                                          Icons.play_arrow_sharp,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    width: 90,
                                    height: 200,
                                    bottom: 10,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return myShowInfoWidget(
                                                desc: agentsBrain
                                                    .abilitiesDescription(
                                                        index),
                                                abiName: [
                                                  agentsBrain
                                                      .abilitiesName(index),
                                                  agentsBrain
                                                      .abilitiesName1(index),
                                                  agentsBrain
                                                      .abilitiesName2(index),
                                                  agentsBrain
                                                      .abilitiesName3(index),
                                                ],
                                                abiImg: [
                                                  agentsBrain
                                                      .abilitiesImg(index),
                                                  agentsBrain
                                                      .abilitiesImg1(index),
                                                  agentsBrain
                                                      .abilitiesImg2(index),
                                                  agentsBrain
                                                      .abilitiesImg3(index),
                                                ],
                                                agentImg:
                                                    agentsBrain.agentImg(index),
                                                agentCategory: agentsBrain
                                                    .agentsCategory(index),
                                                agentName: agentsBrain
                                                    .agentsName(index));
                                          },
                                        ));
                                      },
                                      child: Image(
                                        image: NetworkImage(
                                          agentsBrain.agentImg(index),
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                Positioned(
                                    bottom: 20,
                                    left: 10,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          agentsBrain.agentsCategory(index),
                                          style: kStyleSmall,
                                        ),
                                        Text(
                                          agentsBrain.agentsName(index),
                                          style: kStyleSmallBold,
                                        )
                                      ],
                                    ))
                              ],
                            );
                          }
                        } else {
                          if (weapon.isEmpty) {
                            return const CircularProgressIndicator();
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return myShowInfoWeaponWidget(
                                            sknName: weapon[index]['skins'],
                                            length:
                                                weapon[index]['skins'].length,
                                            sknImg: weapon[index]['skins'],
                                            weaponImg:
                                                '${weapon[index]['displayIcon']}',
                                            weaponCategory: index ==
                                                    (length! - 1)
                                                ? 'Melle'
                                                : '${weapon[index]['shopData']['categoryText']}',
                                            weaponName:
                                                "${weapon[index]['displayName']}");
                                      },
                                    ));
                                  },
                                  child: Image(
                                    image: NetworkImage(
                                      '${weapon[index]['displayIcon']}',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(index == (length! - 1)
                                        ? 'Melle'
                                        : weapon[index]['shopData']
                                            ['categoryText']),
                                    Text(
                                      weapon[index]['displayName'],
                                      style: kStyleSmallBold,
                                    )
                                  ],
                                )
                              ],
                            );
                          }
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
