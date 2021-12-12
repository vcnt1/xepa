// import 'package:xepa/app/widget/widgets.dart';
// import 'package:xepa/app/config/config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bloc/session_barrel.dart';
//
// class CpfCnpjModal extends StatelessWidget {
//   const CpfCnpjModal({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => WillPopScope(
//         onWillPop: () {
//           Navigator.of(context).pop();
//           return Future.value(false);
//         },
//         child: BottomSheetContainer(
//           children: [
//             BottomSheetHeader(
//               title: 'Estabelecimentos',
//               subtitle: 'Escolha o estabelecimento que você deseja ver informações sobre.',
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: BlocBuilder<SessionBloc, SessionState>(
//                 builder: (context, state) {
//                   List<RadioItem> items = [
//                     RadioItem(
//                       title: Text(
//                         'Todos',
//                         style: MyTheme.typographyBlack.headline5,
//                       ),
//                     )
//                   ];
//
//                   for(final e in state.estabelecimentos) {
//                     items.add(
//                       RadioItem(
//                         value: e,
//                         title: Text(
//                           e.fantasia,
//                           style: MyTheme.typographyBlack.headline5,
//                         ),
//                         subtitle: Text(
//                           e.cpfCnpj,
//                           style: MyTheme.typographyBlack.headline6,
//                         ),
//                       ),
//                     );
//                   }
//
//                   return MyRadioList(
//                     initialValue: state.estabelecimentoSelected?.cpfCnpj ?? '',
//                     items: items,
//                     onTap: (value) => BlocProvider.of<SessionBloc>(context).add(
//                       SessionChangeEstabelecimento(estabelecimento: value),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       );
// }
