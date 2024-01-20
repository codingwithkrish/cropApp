import 'package:cropapp/bloc/sellproduce/sellproduce_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget simpleText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
  );
}

Widget dropDown(bool isQuant, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.black,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: BlocBuilder<SellproduceBloc, SellproduceState>(
      builder: (context, state) {
        return StreamBuilder(
            stream: !isQuant
                ? BlocProvider.of<SellproduceBloc>(context).outDropdown
                : BlocProvider.of<SellproduceBloc>(context).outDropdownQuantity,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return DropdownButton<String>(
                value: !isQuant
                    ? BlocProvider.of<SellproduceBloc>(context).getDropdown
                    : BlocProvider.of<SellproduceBloc>(context)
                        .getDropdownQuantity,
                hint: Text(
                  'Select Crop',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                onChanged: (String? newValue) {
                  !isQuant
                      ? BlocProvider.of<SellproduceBloc>(context)
                          .setDropdown(newValue!)
                      : BlocProvider.of<SellproduceBloc>(context)
                          .setDropdownQuantity(newValue!);
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  // textAlign: TextAlign.center,
                ),
                items: !isQuant
                    ? BlocProvider.of<SellproduceBloc>(context)
                        .dropdownNames
                        .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          alignment: Alignment.center,
                          child: Text(value),
                        );
                      }).toList()
                    : BlocProvider.of<SellproduceBloc>(context)
                        .dropdownQuantity
                        .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          alignment: Alignment.center,
                          child: Text(value),
                        );
                      }).toList(),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24.0,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors
                      .transparent, // Set the underline color to transparent
                ),
                isExpanded: true,
              );
            });
      },
    ),
  );
}

Widget textFormField(TextEditingController controller, String hint) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    padding: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
      ),
    ),
  );
}

AppBar sellProduceHomePage() {
  return AppBar(
    title: Text(
      "Sell Produce",
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
    ),
    leading: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: Colors.lightBlue,
      ),
    ),
  );
}

Widget imagePicker(int count, BuildContext context) {
  return InkWell(
    onTap: () {
      BlocProvider.of<SellproduceBloc>(context)
          .add(PickImageEvent(count: count - 1));
    },
    child: Container(
      width: 150.0,
      height: 140.0,
      child: Column(
        children: [
          Image.asset(
            "assets/picture.png",
            height: 100,
          ),
          Text(
            "Image$count",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
    ),
  );
}
