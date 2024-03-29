// To parse this JSON data, do
//
//     final walletRechargeResponse = walletRechargeResponseFromJson(jsonString);
//https://app.quicktype.io/
import 'dart:convert';

WalletRechargeResponse walletRechargeResponseFromJson(String str) => WalletRechargeResponse.fromJson(json.decode(str));

String walletRechargeResponseToJson(WalletRechargeResponse data) => json.encode(data.toJson());

class WalletRechargeResponse {
  WalletRechargeResponse({
   required this.recharges,
   required this.links,
   required this.meta,
   required this.success,
   required this.status,
  });

  List<Recharge> recharges;
  Links links;
  Meta meta;
  bool success;
  int status;

  factory WalletRechargeResponse.fromJson(Map<String, dynamic> json) => WalletRechargeResponse(
    recharges: List<Recharge>.from(json["data"].map((x) => Recharge.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(recharges.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
    "success": success,
    "status": status,
  };
}

class Recharge {
  Recharge({
   required this.amount,
   required this.payment_method,
   required this.approval_string,
   required this.date,
  });

  String amount;
  String payment_method;
  String approval_string;
  String date;

  factory Recharge.fromJson(Map<String, dynamic> json) => Recharge(
    amount: json["amount"],
    payment_method: json["payment_method"],
    approval_string: json["approval_string"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "payment_method": payment_method,
    "approval_string": approval_string,
    "date": date,
  };
}

class Links {
  Links({
   required this.first,
   required this.last,
   required this.prev,
   required this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
   required this.currentPage,
   required this.from,
   required this.lastPage,
   required this.path,
   required this.perPage,
   required this.to,
   required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}
