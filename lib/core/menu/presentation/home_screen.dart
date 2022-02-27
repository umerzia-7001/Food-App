import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Utils/colors.dart';
import 'package:food_app/core/menu/model/model.dart';
import 'package:provider/provider.dart';

import '../../../config/dummy_into.dart';
import '../../../config/size_config/size_config.dart';
import '../provider/food_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _OrderHomeScreenState createState() => _OrderHomeScreenState();
}

class _OrderHomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initList() async {
    final QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance.collection('Foods').get();
    final List<DocumentSnapshot> resultDocument = result.docs;

    //filteredFoods.removeWhere((item) => item.cuisine != select);
    filteredFoods.clear();
    resultDocument.forEach((value) {
      FoodItems item = FoodItems(
          name: value['name'],
          image: value['image'],
          cuisine: value['cuisine']);
      filteredFoods.add(item);
    });
    setState(() {});
  }

  // List<String> DummyInfo = ['italian', 'mexican', 'indian'];
  final SizeConfig _config = SizeConfig();

  int selectedTag = 0;

  final List<FoodItems> filteredFoods = [];

  getData(int index) async {
    String name = '';
    String cuisine = '';
    String image = '';

    String select = '';
    final FoodViewModel foodViewModel =
        Provider.of<FoodViewModel>(context, listen: false);

    if (index == 0) {
      select = 'italian';
    } else if (index == 1) {
      select = 'mexican';
    } else if (index == 2) {
      select = 'indian';
    } else if (index == 3) {
      select = '';
    }
    final QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance
            .collection('Foods')
            .where(
              'cuisine',
              isEqualTo: select,
            )
            .get();
    final List<DocumentSnapshot> resultDocument = result.docs;

    //filteredFoods.removeWhere((item) => item.cuisine != select);
    filteredFoods.clear();
    resultDocument.forEach((value) {
      FoodItems item = FoodItems(
          name: value['name'],
          image: value['image'],
          cuisine: value['cuisine']);
      filteredFoods.add(item);
      name = value['name'];
      cuisine = value['cuisine'];
      image = value['name'];
      print("Mobile name: " + name);
      print("cuisine: " + cuisine);
      print("image: " + image);
      print(filteredFoods);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Foods').snapshots();
    final FoodViewModel foodViewModel =
        Provider.of<FoodViewModel>(context, listen: false);

    //getData(0);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.LM_BORDER_ACTIVE_BLUE6,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: SizedBox(
                height: const Size.fromHeight(55).height,
                width: SizeConfig.screenWidthDp,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: _config.sw(12).toDouble(),
                      ),
                      SizedBox(
                        height: _config.sh(40).toDouble(),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: DummyInfo.tags.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int position) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    // foodViewModel.currentFilter =
                                    //     DummyInfo.tags[position];

                                    selectedTag = position;
                                    getData(position);
                                  });
                                },
                                child: Card(
                                  color: foodViewModel.currentFilter ==
                                          DummyInfo.tags[position]
                                      ? AppColor.LM_BORDER_INFO_BLUE6
                                      : AppColor.UI_GREY,
                                  elevation: 0,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Center(
                                          child: Row(
                                        children: [
                                          Text(
                                            DummyInfo.tags[position],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  shape: BoxShape.circle),
                                              child: Text(
                                                DummyInfo.tags[position]
                                                    .toLowerCase()
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        color: Colors.grey[600],
                                                        fontSize: 12,
                                                        height: 0.75,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ))
                                        ],
                                      ))),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: filteredFoods.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                leading: Text(filteredFoods[position].name!),
                title: Text(filteredFoods[position].cuisine!),
              );
            }));
    //   StreamBuilder<QuerySnapshot>(
    //     stream: _usersStream,
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return Text('Something went wrong');
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Text("Loading");
    //       }

    //       return ListView(
    //         children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //           Map<String, dynamic> datas =
    //               document.data()! as Map<String, dynamic>;
    //           FoodItems userData = FoodItems.fromJson(datas);

    //           return ListTile(
    //             leading: Image.network(datas['image']),
    //             title: Text(datas['name']),
    //             subtitle: Text(datas['cuisine']),
    //           );
    //         }).toList(),
    //       );
    //     },
    //   ),
    // );
  }
}
