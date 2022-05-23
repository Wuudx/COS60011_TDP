import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Navigation bar
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 29),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
      //Profile Slab displaying User Information
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.only(top : 40),
              height: 330,
              decoration: BoxDecoration(
                  color: Color(0xFF607D8B),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              //Profile Picture linked by network image
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png"),
                        radius: 50,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(shape: BoxShape.circle ,color: Colors.white),child: Icon(Icons.edit,color: Color(0xFF607D8B),),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Name",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          //Displays user information Likes and Ranking within leaderboard
                          Text(
                            "45",
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                          Text("Rank",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("335",
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(0.9))),
                          Text("Likes",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        
                        ],
                        
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
            //Displays the leaderboard
            Text(
              "Leaderboard",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png"),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Full Name")
                          ],
                        ),
                        leading: Text("#${index + 1}" ,style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Text(
                            "${(20000 / (index + 1)).toString().substring(0, 5)}",style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(thickness: 1,color: Color(0xFF607D8B),indent: 10,endIndent: 10,),
                    itemCount: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}