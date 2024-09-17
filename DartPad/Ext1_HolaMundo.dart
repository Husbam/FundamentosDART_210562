void main() {
 
  //Declarando una variable generica para almacenar mi nombre
  var myName = 'Jose';
  String myLastName = "Gomez";
  final int myDNI = 210562;
  late final int myAge;
  
  //Corregir mi nombre
  myName = "Jose Angel";
  //Esto ocasiona un error porque la variable está definida como final y no puede actualizar su valor
  //myDNI=210563;
  
  
 print('Hola $myName $myLastName, tu matricula es $myDNI y tu edad aún no la conozco porque no sé cuando naciste.');
  
  
  //Interponlando el valor de las variables con metodos
    
 print('Hola ${myName.toUpperCase()} ${myLastName.toUpperCase()}, tu matricula es $myDNI y tu edad aún no la conozco porque no sé cuando naciste.');
}