import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/feature/bag/bloc/bag_barrel.dart';
import 'package:xepa/app/feature/home/bloc/home_barrel.dart';
import 'package:xepa/app/repository/store_repository.dart';

class MyBlocs extends StatelessWidget {
  const MyBlocs({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
      providers: [
        BlocProvider<BagBloc>(
          create: (BuildContext context) => BagBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(
            storeRepository: context.read<StoreRepository>(),
          ),
        ),
      ],
      child: child,
    );
}
