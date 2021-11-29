class Detorders {
  String idDetorders;
  String idProductsDetorders;
  int amountDetorders;
  int totalDetorders;
  String idOrdersDetorders;

  Detorders(
      {required this.idDetorders,
      required this.idProductsDetorders,
      required this.amountDetorders,
      required this.totalDetorders,
      required this.idOrdersDetorders});
}

class DetordersDao {
  List<Detorders> detorders = [
    Detorders(
        idDetorders: '1',
        idProductsDetorders: '1',
        amountDetorders: 2,
        totalDetorders: 25000,
        idOrdersDetorders: '1')
  ];
}
