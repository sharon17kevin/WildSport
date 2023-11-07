import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wild_sport/controllers/teamsController.dart';
import 'package:wild_sport/controllers/userController.dart';
import 'package:wild_sport/helperPages/pickTeam1.dart';
import 'package:wild_sport/models/fantasyModel.dart';
import 'package:wild_sport/models/playerModel.dart';
import 'package:flutter/src/widgets/image.dart' as Image1;
import 'package:wild_sport/models/userModel.dart';

class DrawerCard extends StatefulWidget {
  @override
  State<DrawerCard> createState() => _DrawerCardState();
}

class _DrawerCardState extends State<DrawerCard> {
  @override
  Widget build(BuildContext context) {
    TeamController teamController = Get.find<TeamController>();
    List<Player> players = teamController.getPlayers;
    List<Player> displayListCopy =   List<Player>.from(teamController.displayList.value);
    var display_list = teamController.displayList;
    UserController _userController = Get.find<UserController>();

    void updateList(String value) {
      display_list.value = displayListCopy.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    }
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
              child: TextField(
                style: TextStyle(
                    color: Colors.black
                ),
                onChanged: (value) => teamController.searchDisplayList(value),
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
              child: Container(
                width: Get.width * 0.53,
                child: Obx(
                      ()=> ListView.builder(
                      itemCount: teamController.displayListCopy.value.length,
                      itemBuilder: (context, index) {
                        return PlayerTile(
                          title: teamController.displayListCopy.value[index].name,
                          subtitle: teamController.displayListCopy.value[index].fantasyPrice,
                          player: teamController.displayListCopy.value[index],
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerTile extends StatelessWidget {
  final String title;
  final int subtitle;
  final Player player;

  PlayerTile({required this.title, required this.subtitle, required this.player});
  @override
  Widget build(BuildContext context) {
    UserController _userController = Get.find<UserController>();
    bool? shouldIgnore() {
      List<String>? players = _userController.myUser.fantasyTeam?.map((e) => e.player).toList();
      return players?.contains(player.id);
    }
    void showSnackbar() {
      Get.snackbar(
        'Confirmation',
        '${player.name} was just transferred in',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        isDismissible: true,
        icon: Icon(Icons.info)
      );
    }
    void showPriceError() {
      Get.snackbar(
          'Invalid',
          'Cannot afford ${player.name}',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          isDismissible: true,
          backgroundColor: Colors.red,
          icon: Icon(Icons.info)
      );
    }

    void showDialogBox() {
      var cost = _userController.calcCost();
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Confirm Transfer',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          content: Container(
            padding: EdgeInsets.all(10),
            height: 120,
            child: Column(
              children: [
                Text('Transfer In',
                  style: TextStyle(
                      color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15
                  ),
                ),
                Text(player.name,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    color: Colors.black54
                  ),
                ),
                Text('₦ ${player.fantasyPrice}m',
                  style:  TextStyle(
                    color: Colors.green,
                    fontSize: 15
                  ),
                ),
                Text('Cost: ${cost} points',
                  style:  TextStyle(
                      color: Colors.black,
                      fontSize: 15
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async{
                int availableBank = _userController.myUser.bank! + _userController.bankToAdd.value;
                if (player.fantasyPrice <= availableBank) {
                  User newUser = _userController.myUser;
                  String playerPosition = _userController.myToUpdate;
                  await _userController.updateFantasyTeam(newUser, player, playerPosition);
                  _userController.updateFantasy(player, playerPosition);
                  _userController.myUser.bank = availableBank - player.fantasyPrice;
                  await _userController.updateBank(_userController.myUser);
                  _userController.updateTransferValues();
                  Get.back();
                  _userController.xOffset.value = 0.0;
                  _userController.yOffset.value = 0.0;
                  _userController.scaleFactor.value = 1.0;
                  _userController.isDrawerOpen.value = false;
                  _userController.update();
                  showSnackbar();
                } else {
                  showPriceError();
                }

              },
              child: Text('Confirm',
                style: GoogleFonts.inter(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        )
      );
    }
    return IgnorePointer(
      ignoring: shouldIgnore()!,
      child: Container(
        padding: EdgeInsets.all(5),
        color: shouldIgnore()!? Colors.red.shade200: Colors.transparent,
        child: ListTile(
          onTap: () async {
            //FocusScope.of(context).unfocus();
            showDialogBox();
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
          title: Text(title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),
          ),
          subtitle: Text('Price: $subtitle',
            style: TextStyle(
              color:Get.isDarkMode? Colors.white : Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}