import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/feature/home/bloc/home_bloc.dart';
import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/store.dart';
import 'package:xepa/app/widget/widgets.dart';

import '../../../widget/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeFetchData());
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.mainHorizontalMargin),
          child: MyAppBar(
            color: MyColors.primaryColor,
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Body(),
          ),
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const MenuCaroulsel(),
        // spacing,
        const StoreList(),
      ],
    );
  }
}

class MenuCaroulsel extends StatelessWidget {
  const MenuCaroulsel({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(width: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device().screenHeight * .2,
      padding: MySizes.mainHorizontalEdgeInsets,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          spacing,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoreList extends StatelessWidget {
  const StoreList({Key? key}) : super(key: key);

  final SizedBox spacing = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: MySizes.mainHorizontalEdgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estabelecimentos',
            style: MyTheme.typographyBlack.headline4.copyWith(fontWeight: FontWeight.w700),
          ),
          spacing,
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => state.status == FetchStatus.loading
                ? const CircularProgressIndicator()
                : state.stores.isEmpty
                    ? const Text('No stores available')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.stores
                            .map((store) => StoreItem(store: store))
                            .toList(),
                      ),
          ),
        ],
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  const StoreItem({Key? key, required this.store}) : super(key: key);

  final Store store;

  final SizedBox spacing = const SizedBox(width: 10);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(MyRouter.storeRoute, arguments: store),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: Device().screenHeight * .1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: MyApplicationHelper.parseImg(store.imagem ?? ''),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              spacing,
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      store.nome ?? '',
                      style: MyTheme.typographyBlack.headline5,
                    ),
                    Text(
                      store.tipo ?? '',
                      style: MyTheme.typographyBlack.headline6,
                    ),
                    Text(
                      store.tipo ?? '',
                      style: MyTheme.typographyBlack.default2.copyWith(color: MyColors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
