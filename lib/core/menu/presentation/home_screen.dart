import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Utils/colors.dart';
import 'package:food_app/core/menu/model/model.dart';
import 'package:provider/provider.dart';

import '../../../config/size_config/size_config.dart';
import '../provider/food_provider.dart';
import '../widgets/grid_container.dart';
import '../widgets/home_drawer.dart';

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
    final FoodViewModel foodviewModel =
        Provider.of<FoodViewModel>(context, listen: false);
    foodviewModel.initList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final SizeConfig _config = SizeConfig();

  int selectedTag = 0;

  // final List<FoodItems> filteredFoods = [];

  @override
  Widget build(BuildContext context) {
    final FoodViewModel foodViewModel =
        Provider.of<FoodViewModel>(context, listen: true);

    List<FoodItems> menuItems = foodViewModel.filteredFoods;

    return Scaffold(
        drawer: OrderHomeDrawer(),
        appBar: AppBar(
          backgroundColor: AppColor.LM_BORDER_ACTIVE_BLUE6,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: SizedBox(
                height: const Size.fromHeight(50).height,
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
                                    foodViewModel.currentFilter =
                                        DummyInfo.tags[position];

                                    selectedTag = position;
                                    if (position == 0) {
                                      // getting all menu items
                                      foodViewModel.initList();
                                    } else {
                                      // getting filtered menu items
                                      foodViewModel.getData(position);
                                    }
                                  });
                                },
                                child: Card(
                                  color: foodViewModel.currentFilter ==
                                          DummyInfo.tags[position]
                                      ? AppColor.blue4
                                      : AppColor.LM_BACKGROUND_BASIC,
                                  elevation: 5,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Center(
                                          child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              DummyInfo.tags[position],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      color: Colors.black),
                                            ),
                                          ),
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
        body: GridView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) => GridContainer(
            name: menuItems[index].name!,
            image: menuItems[index].image!,
            cuisine: menuItems[index].cuisine!,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
        ));
  }
}

// ALTERNATE METHOD FOR REAL TIME FIRESTORE CHANGES

// to get contunuous stream of data from firestore
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