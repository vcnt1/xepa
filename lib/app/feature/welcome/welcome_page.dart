import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/widget/widgets.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  SizedBox buttonSpacing = const SizedBox(height: 20);
  SizedBox sectionSpacing = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) => Container(
        color: MyColors.primaryColor,
        child: Padding(
          padding: MySizes.alternativeEdgeInsets,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comida barata',
                style: MyTheme.typographyWhite.headline1.copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                'é aqui',
                style: MyTheme.typographyWhite.headline1.copyWith(fontWeight: FontWeight.w800),
              ),
              sectionSpacing,
              MyButton.white(
                label: 'Eu quero!',
                onTap: () => Navigator.of(context).pushNamed(MyRouter.innerRoute),
              ),
              buttonSpacing,
              MyButton.outlined(
                label: 'Faça parte',
                onTap: () {},
              ),
              buttonSpacing,
              MyButton.outlined(
                label: 'Já sou xepeiro',
                onTap: () {},
              ),
              sectionSpacing,
              Center(
                child: MyLogo(
                  width: Device().screenWidth * .2,
                ),
              ),
            ],
          ),
        ),
      );
}
