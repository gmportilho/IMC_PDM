import 'package:flutter/material.dart';

class ImcScreen extends StatefulWidget {
  @override
  _ImcScreenState createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  final  txtPesoCtrl =  TextEditingController();

  final  txtAlturaCtrl =  TextEditingController();

  double imc = 0;
  String image = 'assets/images/abaixo.png';

  void calculaIMC() {
    double peso = double.parse(txtPesoCtrl.text);
    double altura = double.parse(txtAlturaCtrl.text);
    double imc = peso / (altura*altura);
    
    if(imc < 17){
      image = 'assets/images/magreza.png';
    }
    else if(imc < 18.49) {
      image = 'assets/images/abaixo.png';
    }
    else if(imc < 24.99) {
      image = 'assets/images/ideal.png';
    }
    else if(imc < 29.99) {
      image = 'assets/images/sobre.png';
    }
    else  {
      image = 'assets/images/obesidade.png';
    }

    

    setState(() {
      this.imc = imc;
    });
    
  }

  //executei o setState(), ele executa novamente o método build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Peso",
                      hintText: "Peso em kg.",
                    ),
                    keyboardType: TextInputType.number,
                    controller: txtPesoCtrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Altura",
                      hintText: "Altura em m.",
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                      
                    ),
                    controller: txtAlturaCtrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Calcular IMC",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => calculaIMC(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Seu IMC é de  ${imc.toStringAsFixed(2)}"),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Image.asset(image)),
          ),
        ],
      ),
    );
  }
}
