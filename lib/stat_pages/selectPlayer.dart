import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/image.dart' as Image1;

class SelectPlayer extends StatefulWidget {
  @override
  State<SelectPlayer> createState() => _SelectPlayerState();
}

class _SelectPlayerState extends State<SelectPlayer> {
  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    var display_list = List.from(players).obs;

    void updateList(String value) {
      display_list.value = players.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    }
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 10,),
                  SizedBox(width: 5,),
                  Text('Back')
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Select A Player'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 70,
            child: TextField(
              style: TextStyle(
                color: Colors.black
              ),
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Get.isDarkMode? Colors.white30: Colors.black12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter Player Name',
                hintStyle: TextStyle(
                  color: Get.isDarkMode? Colors.white : Colors.black
                ),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Get.isDarkMode? Colors.white : Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              ()=> ListView.builder(
                itemCount: display_list.value.length,
                itemBuilder: (context, index) {
                  return PlayerTile(
                    title: display_list.value[index].name,
                    subtitle: display_list.value[index].position,
                    player: display_list.value[index]
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Player player;

  PlayerTile({required this.title, required this.subtitle, required this.player});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Get.back(result: player);
      },
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Get.isDarkMode? Colors.white30 : Colors.black12,
        child: Image1.Image.asset(
          'assets/icons/playerPlaceholder.webp',
          height: 40,
          width: 40,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle,
        style: TextStyle(
          color: Colors.black
        ),
      ),
      trailing: Icon(Icons.add),
    );
  }
}
