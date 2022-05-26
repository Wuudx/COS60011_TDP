import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({required this.user, Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _user;
  late DeviceDatabase database;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    database = Provider.of<DeviceDatabase>(context);
  }

  Widget _buildList(List<Point> pointsList) {
    List<Widget> list = [];
    int numberOfDivs = 0;
    for (Point point in pointsList) {
      if (numberOfDivs > 0 && numberOfDivs <= pointsList.length) {
        list.add(
          const Divider(
            thickness: 1,
            color: Color(0xFF607D8B),
            indent: 10,
            endIndent: 10,
          ),
        );
      }

      list.add(_tile(point, numberOfDivs + 1));
      numberOfDivs++;
    }

    return Column(
      children: list,
    );
  }

  Widget _tile(Point point, int index) {
    return Container(
      color: point.id == _user.id ? Colors.grey[350] : Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Text(
              '#$index',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 80,
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png",
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text('${point.firstName} ${point.lastName}')
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Text(
              '${point.points ?? 'N/A'}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Navigation bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).canPop() ? Navigator.of(context).pop() : null,
        ),
        title: const Text(
          Strings.ttlProfile,
          style: TextStyle(fontSize: 29),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: database.getAllIPoints(),
        builder: (context, AsyncSnapshot<List<Point>> futureSnapshot) {
          if (futureSnapshot.hasData) {
            return Column(
              //Profile Slab displaying User Information
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  height: 330,
                  decoration: const BoxDecoration(
                    color: Color(0xFF607D8B),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  //Profile Picture linked by network image
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png",
                            ),
                            radius: 50,
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Color(0xFF607D8B),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${_user.firstName} ${_user.lastName}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              //Displays user information Likes and Ranking within leaderboard
                              Text(
                                '#${(futureSnapshot.data!.indexWhere((element) => element.id == _user.id) + 1).toString()}',
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              const Text(
                                Strings.txtRank,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                _user.points.toString(),
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(
                                    0.9,
                                  ),
                                ),
                              ),
                              const Text(
                                Strings.txtLikes,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Displays the leaderboard
                const Text(
                  Strings.txtLeaderboard,
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: _buildList(futureSnapshot.data!),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              padding: const EdgeInsets.only(top: 40),
              height: 330,
              decoration: const BoxDecoration(
                color: Color(0xFF607D8B),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              //Profile Picture linked by network image
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png",
                        ),
                        radius: 50,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xFF607D8B),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${_user.firstName} ${_user.lastName}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          //Displays user information Likes and Ranking within leaderboard
                          Text(
                            "N/A",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const Text(
                            Strings.txtRank,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "N/A",
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(
                                  0.9,
                                )),
                          ),
                          const Text(
                            Strings.txtLikes,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
