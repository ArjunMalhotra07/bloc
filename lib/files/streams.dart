import "dart:async";

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final controller = StreamController();

  final order = Order('Chocolates');

  final baker = StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'Chocolate') {
      sink.add(Cake());
    } else {
      sink.addError('Cant bake that cake');
    }
  });
  controller.sink.add(order);

  controller.stream.map((order) => order.type).transform(baker).listen(
      (cake) => print('Heres your cake $cake'),
      onError: (err) => print(err));
}
