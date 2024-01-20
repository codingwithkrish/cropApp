import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bounding_box/bounding_box_bloc.dart';
import 'map_page.dart';

class BoundingBoxImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BoundingBoxBloc>(context).add(FetchImage());
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>MapPage()));
    });
    return Container(
      width: 50.0,
      height: 50,
      child: CustomPaint(
        painter: BoundingBoxPainter(),
        child: BlocBuilder<BoundingBoxBloc, BoundingBoxState>(
          builder: (context, state) {
            if(state is ImageFetchingLoading) return Center(child: CircularProgressIndicator(),);
            if(state is ImageFetchFailure) return Text("Unable To Load Image"+state.message);
            if(state is ImageFetched){
              return Image.memory(
                base64Decode(state.image),
                // Replace with your image URL
                fit: BoxFit.cover,
              );
            }
            return Text("Unable To Load Image");
          },
        ),
      ),
    );
  }
}

class BoundingBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Coordinates of the bounding box
    final double x1 = 73.08064632117748;
    final double y1 = 29.013036367930557;
    final double x2 = 73.08577537536621;
    final double y2 = 29.016389079729965;

    // Map the coordinates to the image size
    final double imageWidth = size.width;
    final double imageHeight = size.height;
    final Offset topLeft = Offset(x1 * imageWidth, y1 * imageHeight);
    final Offset bottomRight = Offset(x2 * imageWidth, y2 * imageHeight);

    // Draw the bounding box
    canvas.drawRect(Rect.fromPoints(topLeft, bottomRight), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
