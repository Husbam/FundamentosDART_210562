void main() {
    final mySquare = Square(side: 18);

    print("""
          Lado del Cuadrado: ${mySquare.side}
          Área que ocupa: ${mySquare.calculateArea()}""");

    mySquare.side = -32;
    print(""" El lado del cuadrado es de : ${mySquare._side}
    su área es de : ${mySquare.area} """);
    final mySquare2 = Square(side: -7);
    print(""" El lado del cuadrado es de : ${mySquare2._side}
    su área es de : ${mySquare2.area} """);

}
class Square {
    double _side;


    Square({required double side})
      : assert(side > 0, 'El valor del lado debe de ser mayor a 0'),
       _side = side;


    double get area {
        return _side * _side;
    }

    double get side {
        return _side;
    }


    set side(double value) {
        print("Asignando un nuevo valor al lado: $value");

        if (value < 0) throw 'El valor del lado debe ser mayor a 0.';

        _side = value;
    }


    double calculateArea() {
        return _side * _side;
    }
}