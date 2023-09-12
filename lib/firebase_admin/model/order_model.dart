class OrderModel {
  final List<String> items;
  final List<int> counts;
  final int total;
  final int subTotal;
  final DateTime dateTime;
  final String status;
  final String idCustomer;
  String vendorId;

  OrderModel({
    required this.items,
    required this.counts,
    required this.total,
    required this.subTotal,
    required this.dateTime,
    required this.status,
    required this.idCustomer,
    this.vendorId = '',
  });
}
