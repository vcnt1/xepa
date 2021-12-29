// // To parse this JSON data, do
// //
// //     final viaCep = viaCepFromJson(jsonString);
//
// import 'dart:convert';
//
// ViaCep viaCepFromJson(String str) => ViaCep.fromJson(json.decode(str));
//
// String viaCepToJson(ViaCep data) => json.encode(data.toJson());
//
// class ViaCep {
//   ViaCep({
//     this.cep,
//     this.logradouro,
//     this.complemento,
//     this.bairro,
//     this.localidade,
//     this.uf,
//     this.ibge,
//     this.gia,
//     this.ddd,
//     this.siafi,
//   });
//
//   final String cep;
//   final String logradouro;
//   final String complemento;
//   final String bairro;
//   final String localidade;
//   final String uf;
//   final String ibge;
//   final String gia;
//   final String ddd;
//   final String siafi;
//
//   factory ViaCep.fromJson(Map<String, dynamic> json) => ViaCep(
//     cep: json["cep"],
//     logradouro: json["logradouro"],
//     complemento: json["complemento"],
//     bairro: json["bairro"],
//     localidade: json["localidade"],
//     uf: json["uf"],
//     ibge: json["ibge"],
//     gia: json["gia"],
//     ddd: json["ddd"],
//     siafi: json["siafi"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cep": cep,
//     "logradouro": logradouro,
//     "complemento": complemento,
//     "bairro": bairro,
//     "localidade": localidade,
//     "uf": uf,
//     "ibge": ibge,
//     "gia": gia,
//     "ddd": ddd,
//     "siafi": siafi,
//   };
// }
