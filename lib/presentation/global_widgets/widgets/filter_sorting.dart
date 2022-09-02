import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class FilterSorting extends StatefulWidget {
  const FilterSorting({Key? key}) : super(key: key);

  @override
  State<FilterSorting> createState() => _FilterSortingState();
}

class _FilterSortingState extends State<FilterSorting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SectionHeader(
              title: "Filter & Sorting",
              trailing: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  LineIcons.times,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  title: TabBar(
                    indicatorColor: primaryColor,
                    tabs: [
                      Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Sort",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Filter(),
                    Sort(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: paddingSize,
              vertical: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    backgroundColor: Colors.white,
                    border: const BorderSide(),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  child: CustomButton(
                    child: Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var selectedRange = RangeValues(0, 100);
  bool? checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Range",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RangeSlider(
                    activeColor: primaryColor,
                    values: selectedRange,
                    onChanged: (RangeValues newRange) {
                      setState(() {
                        selectedRange = newRange;
                      });
                    },
                    min: 0,
                    max: 100,
                    labels: RangeLabels(
                        '${selectedRange.start}', '${selectedRange.end}'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${selectedRange.start.toInt()}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\$ ${selectedRange.end.toInt()}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Computer",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              activeColor: Colors.green,
                              value: checkBoxValue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxValue = value;
                                });
                              }),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 10,
                      );
                    },
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Sort extends StatelessWidget {
  const Sort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: pagePadding,
          child: Column(
            children: const [
              SortItem(label: "Name (A-Z)"),
              SortItem(label: "Name (Z-A)"),
              SortItem(label: "Price (High-Low)"),
              SortItem(label: "Price (Low-High)"),
            ],
          )),
    );
  }
}

class SortItem extends StatefulWidget {
  const SortItem({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  State<SortItem> createState() => _SortItemState();
}

class _SortItemState extends State<SortItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              isChecked
                  ? const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                      child: Icon(
                        LineIcons.check,
                        color: Colors.white,
                        size: 13,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const Divider(
            height: 30,
          ),
        ],
      ),
    );
  }
}
