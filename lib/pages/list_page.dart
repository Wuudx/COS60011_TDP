import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../data/numbers.dart';
import '../data/strings.dart';
import '../data/textstyles.dart';

class ListPage extends StatefulWidget {
  final int? intFilter;
  final String? textFilter;
  final List<dynamic> list;

  const ListPage(this.list, {Key? key, this.intFilter, this.textFilter}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String subtext = '';
  List<dynamic> listToShow = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  getData() async {
    setState(() {
      listToShow = widget.list
          .where((element) => element.description.toLowerCase().contains(subtext.toLowerCase()))
          .toList();
    });
  }

  Widget _buildListView() {
    if (listToShow.isNotEmpty) {
      int numberOfDivs = 0;
      int length = listToShow.length - 1;
      List<Widget> widgetList = [];
      for (var item in listToShow) {
        if (numberOfDivs > 0 && numberOfDivs <= length) {
          widgetList.add(
            const Opacity(
              opacity: 0.30000001192092896,
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          );
        }
        widgetList.add(_tile(item));
        numberOfDivs++;
      }
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.margin15,
            right: Dimensions.margin15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList,
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 120,
                color: Colors.red,
              ),
              Text(
                Strings.txtNoItemsToShow,
                textAlign: TextAlign.center,
                style: CustomTextStyles.formTextField(Colors.black.value),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _tile(dynamic item) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimensions.margin15,
          bottom: Dimensions.margin15,
        ),
        child: SizedBox(
          width: double.maxFinite,
          child: Text(
            '${item.description}',
            style: CustomTextStyles.formTextField(Colors.black.value),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.margin15,
          top: Dimensions.margin15,
          right: Dimensions.margin15,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimensions.margin15,
                      bottom: Dimensions.margin15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            Strings.ttlSelectCategory,
                            style: CustomTextStyles.formTextField(Colors.black.value),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(
                              MaterialCommunityIcons.close,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextField(
                    // keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        subtext = value;
                        getData();
                      });
                    },
                    maxLength: 20,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    maxLines: 1,
                    autofocus: false,
                    textCapitalization: TextCapitalization.sentences,
                    style: CustomTextStyles.formTextField(Colors.black.value),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      counterText: '',
                      hintText: Strings.hntSearch,
                      // hintStyle:
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(top: Dimensions.margin15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: Dimensions.margin15),
                      child: _buildListView(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
