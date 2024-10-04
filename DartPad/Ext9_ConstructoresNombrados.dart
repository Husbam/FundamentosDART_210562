void main() {
    final mySquare = Square(side: 18);

    print("""
          Lado del Cuadrado: ${mySquare.side}
          Área que ocupa: ${mySquare.calculateArea()}""");

    mySquare.side = -32;

}
class Square {
    double _side;


    Square({required double side})
    : _side = side;


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