import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "picture") String? picture,
    @JsonKey(name: "buyer") String? buyer,
    @JsonKey(name: "tags") List<String>? tags,
    @JsonKey(name: "status") Status? status,
    @JsonKey(name: "registered") String? registered,
  }) = _OrderModel;

  OrderEntity toEntity() {



   return OrderEntity(
        id: id,
        isActive: isActive,
        company: company,
        picture: picture,
        buyer: buyer,
        tags: tags,
        status: mappedStatus);
  }


  OrderStatus get mappedStatus {
    switch (status) {
      case Status.DELIVERED:
        return OrderStatus.DELIVERED;
      case Status.ORDERED:
        return OrderStatus.ORDERED;
      case Status.RETURNED:
        return OrderStatus.RETURNED;
      case null:
        return OrderStatus.ORDERED;
    }
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

enum Status {
  @JsonValue("DELIVERED")
  DELIVERED,
  @JsonValue("ORDERED")
  ORDERED,
  @JsonValue("RETURNED")
  RETURNED
}

final statusValues = EnumValues({
  "DELIVERED": Status.DELIVERED,
  "ORDERED": Status.ORDERED,
  "RETURNED": Status.RETURNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
