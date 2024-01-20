import 'package:cropapp/bloc/sellproduce/sellproduce_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bounding_box/bounding_box_bloc.dart';
import 'presentation/constants/colors.dart';
import 'presentation/sell_produce.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusColor,
    ));
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (create)=>SellproduceBloc()),
        BlocProvider(create: (create)=>BoundingBoxBloc())
      ],
      child: MaterialApp(
        title: 'Crop App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          appBarTheme: AppBarTheme(color: greenColor),
          colorScheme: ColorScheme.fromSeed(seedColor: greenColor),
          useMaterial3: true,
        ),
        home: SellProduce(),
      ),
    );
  }
}
