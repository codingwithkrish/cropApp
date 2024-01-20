import 'dart:developer';

import 'package:cropapp/bloc/sellproduce/sellproduce_bloc.dart';
import 'package:cropapp/presentation/bounding_box_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/colors.dart';
import 'helper_widget.dart';

class SellProduce extends StatelessWidget {
  TextEditingController varietyNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController expectedQuantityController = TextEditingController();
  SellProduce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusColor,
    ));
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          if (varietyNameController.text.isEmpty ||
              priceController.text.isEmpty ||
              noteController.text.isEmpty ||
              expectedQuantityController.text.isEmpty ||
              BlocProvider.of<SellproduceBloc>(context).getDropdown ==
                  "Select Crop") {
            final snackBar = SnackBar(
              content: Text('Please Fill All The Details'),
              duration: Duration(seconds: 3), // Adjust the duration as needed
            );

            // Show the Snackbar
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else{
            var json = {
              "Type Of Crop":
              BlocProvider.of<SellproduceBloc>(context).getDropdown,
              "Variety": varietyNameController.text,
              "Expected Quantity": expectedQuantityController.text,
              "Quantity Type":
              BlocProvider.of<SellproduceBloc>(context).getDropdownQuantity,
              "Price ": priceController.text,
              "Note": noteController.text
            };
            log(json.toString());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BoundingBoxImage()));

          }
         },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xff709301),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "Add my Produce",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListView(
            children: [
              simpleText("Type  of Crop"),
              dropDown(false, context),
              simpleText("Variety"),
              textFormField(varietyNameController, 'Variety of Product'),
              simpleText("Expected Quantity"),
              Row(
                children: [
                  Expanded(
                      child: textFormField(
                          expectedQuantityController, "Quantity")),
                  Expanded(
                    child: dropDown(true, context),
                  ),
                ],
              ),
              BlocBuilder<SellproduceBloc, SellproduceState>(
                builder: (context, state) {
                  return StreamBuilder(
                      stream: BlocProvider.of<SellproduceBloc>(context)
                          .outDropdownQuantity,
                      builder: (context, snapshot) {
                        return simpleText(
                            "Price (per ${BlocProvider.of<SellproduceBloc>(context).getDropdownQuantity})");
                      });
                },
              ),
              textFormField(priceController, 'Type your price'),
              simpleText("Note"),
              textFormField(noteController, 'Write something'),
              simpleText("Images"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imagePicker(1, context),
                    imagePicker(2, context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: sellProduceHomePage(),
    );
  }
}
