import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  late String _result;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    setState(() {
      _result = '';
    });
  }

  void calculateImc() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100.0;
    double imc = weight / (height * height);

    setState(() {
      _result = "IMC = ${imc.toStringAsPrecision(2)}\n";
      if (imc < 18.6)
        _result += "Abaixo do peso";
      else if (imc < 25.0)
        _result += "Peso ideal";
      else if (imc < 30.0)
        _result += "Levemente acima do peso";
      else if (imc < 35.0)
        _result += "Obesidade Grau I";
      else if (imc < 40.0)
        _result += "Obesidade Grau II";
      else
        _result += "Obesidade Grau IIII";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0), child: buildForm()));
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('CALCULADORA IMC'),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            resetFields();
          },
        )
      ],
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFormField(
              label: "Peso (kg)",
              error: "Insira seu peso!",
              controller: _weightController),
          buildTextFormField(
              label: "Altura (cm)",
              error: "Insira uma altura!",
              controller: _heightController),
          buildTextResult(),
          buildCalculateButton(),
        ],
      ),
    );
  }


  Padding buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _result,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.grey[500]
        ),
      ),
    );
  }


  Padding buildCalculateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side:
                  BorderSide(color: Colors.blue))),
          minimumSize: MaterialStateProperty.all<Size>(Size(150, 60)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            calculateImc();
          }
        },
        child: Text('CALCULAR', style: TextStyle(color: Colors.white)),
      ),
    );

  }

  TextFormField buildTextFormField(
      {required TextEditingController controller, String? error, required String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: (text) {
        return text!.isEmpty ? error : null;
      },

    );
  }
}

