import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoftfluttertask/domain/model/product.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_colorgrid_container.dart';
import 'package:magdsoftfluttertask/presintation/ui/custom_widgets/custom_elevated_button.dart';
import 'package:magdsoftfluttertask/presintation/ui/itemview/item_view_viewmodel.dart';
import 'package:magdsoftfluttertask/presintation/ui/itemview/spesification_item.dart';

class ItemViewScreen extends StatefulWidget {
  static const String screenName = "itemViewScreen";
  const ItemViewScreen({super.key});

  @override
  State<ItemViewScreen> createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen> {
  String selectedTab = 'Overview';
  @override
  void initState() {
    super.initState();
    viewModel = TabSelectionCubit(); // Initialize the viewModel here
  }

  late TabSelectionCubit viewModel;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments as Products;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  CustomColorGridContainer(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 35,
                                    color: Color(0xffB1B1B1),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        '${product.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    Center(
                                      child: Text(
                                        'Type:  ${product.type}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .23,
                          width: MediaQuery.of(context).size.width * .8,
                          child: Card(
                            elevation: 15,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Image.network(
                                  product.image.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 10.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                    child: Image.asset(
                                      'assets/images/${product.company?.toLowerCase()}.png',
                                      fit: BoxFit.fill,
                                      scale: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${product.company} Official Store',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text("View Store",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffB1B1B1)))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Card(
                                  color: const Color(0xfff3f3f3),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 15),
                            const Text('Price',
                                style: TextStyle(
                                  color: Color(0xffB1B1B1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text('${product.price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: CustomElevatedButton(
                                elevation: 3,
                                radius: 10,
                                onPressed: () {},
                                label: 'Add To Cart'))
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    height: 1,
                    color: const Color(0xffB1B1B1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              viewModel.selectTab(TabSelection.overview);
                              selectedTab = 'Overview';
                            });
                          },
                          child: SpesificationItem(
                            text: 'Overview',
                            isSelected: selectedTab,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              viewModel.selectTab(TabSelection.spesification);
                              selectedTab = 'Spesification';
                            });
                          },
                          child: SpesificationItem(
                            text: 'Spesification',
                            isSelected: selectedTab,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              viewModel.selectTab(TabSelection.review);
                              selectedTab = 'Review';
                            });
                          },
                          child: SpesificationItem(
                            text: 'Review',
                            isSelected: selectedTab,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15.0),
                    child: BlocBuilder<TabSelectionCubit, TabSelection>(
                        builder: (context, state) {
                      if (state == TabSelection.overview) {
                        return Center(
                          child: Text(product.description!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB1B1B1))),
                        );
                      } else if (state == TabSelection.review) {
                        return const Center(
                          child: Text('Product Review'),
                        );
                      } else if (state == TabSelection.spesification) {
                        return const Center(
                          child: Text('Product Spesification',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB1B1B1))),
                        );
                      }
                      return Container();
                    }),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
