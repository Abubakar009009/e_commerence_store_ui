class OrdersModel {
  final int total;
  final int subTotal;
  final List<String> items;
  final DateTime dateTime;
  final String? orderStatus;

  OrdersModel({
    required this.total,
    required this.subTotal,
    required this.items,
    required this.dateTime,
    required this.orderStatus,
  });
}
