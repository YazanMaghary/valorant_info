import 'package:valorant_info/Module/agents/agents.dart';

import '../../Services/Network.dart';

class AgentsBrain {
  late Map<String, dynamic> agentsInfo;
  Agents agentBrain = Agents();
  Future<void> valorantAgentsStatus() async {
    agentsInfo = await NetworkHelper(url: "https://valorant-api.com/v1/agents")
        .getData();
    agentBrain.agents = agentsInfo['data'];
    agentBrain.length = agentBrain.agents.length;

    // ignore: avoid_print
    print(agentBrain.length);
  }

  String agentsName(int index) {
    return agentBrain.agents[index]['displayName'];
  }

  String agentsCategory(int index) {
    return agentBrain.agents[index]['role']['displayName'];
  }

  String agentImg(int index) {
    return agentBrain.agents[index]['displayIcon'];
  }

  String urlWave(int index) {
    return agentBrain.agents[index]['voiceLine']['mediaList'][0]['wave'];
  }

  List abilitiesDescription(int index) {
    for (var i = 0; i < 4; i++) {
      agentBrain.abiDescription
          .add("${agentBrain.agents[index]['abilities'][i]['description']}");
    }
    return agentBrain.abiDescription;
  }

  String abilitiesName(int index) {
    return agentBrain.agents[index]['abilities'][0]['displayName'];
  }

  String abilitiesName1(int index) {
    return agentBrain.agents[index]['abilities'][1]['displayName'];
  }

  String abilitiesName2(int index) {
    return agentBrain.agents[index]['abilities'][2]['displayName'];
  }

  String abilitiesName3(int index) {
    return agentBrain.agents[index]['abilities'][3]['displayName'];
  }

  String abilitiesImg(int index) {
    return agentBrain.agents[index]['abilities'][0]['displayIcon'];
  }

  String abilitiesImg1(int index) {
    return agentBrain.agents[index]['abilities'][1]['displayIcon'];
  }

  String abilitiesImg2(int index) {
    return agentBrain.agents[index]['abilities'][2]['displayIcon'];
  }

  String abilitiesImg3(int index) {
    return agentBrain.agents[index]['abilities'][3]['displayIcon'];
  }

  int abilitiesColor(int index) {
    agentBrain.formattedColor.add(
        '0xff' + "${agentBrain.agents[index]['backgroundGradientColors'][0]}");
    return int.parse(agentBrain.formattedColor[index]);
  }
}
