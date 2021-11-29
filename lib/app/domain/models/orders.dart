class Orders {
  String idOrders;
  String userClientsOrders;
  int totalOrders;

  Orders(
      {required this.idOrders,
      required this.userClientsOrders,
      required this.totalOrders});
}

class OrdersDAO {
  List<Orders> orders = [
    Orders(idOrders: '1', userClientsOrders: 'brayandavila', totalOrders: 25000)
  ];
}
