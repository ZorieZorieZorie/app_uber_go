import 'package:flutter/material.dart';

void main() {
  runApp(UberGoApp());
}

class UberGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  String? _enteredEmail;
  String? _enteredAddress;

  void _login() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      setState(() {
        _enteredEmail = _emailController.text;
        _emailController.clear();
        _passwordController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa correo y contraseña.')),
      );
    }
  }

  void _submitAddress() {
    if (_addressController.text.isNotEmpty) {
      setState(() {
        _enteredAddress = _addressController.text;
        _addressController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa una dirección.')),
      );
    }
  }

  void _reset() {
    setState(() {
      _enteredEmail = null;
      _enteredAddress = null;
    });
  }

  void _pay() {
    if (_cardController.text.isNotEmpty && _cvcController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pago procesado exitosamente')),
      );
      // Llamar a la siguiente pantalla de calificación después del pago
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RatingScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa los datos de la tarjeta y CvC')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body: _enteredEmail == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Uber Go',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Ingresar'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          : _enteredAddress == null
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _addressController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Ingresa una dirección',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _submitAddress,
                            child: Text('Solicitar'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.green[200],
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.brown[400], 
                                      width: 50,
                                      height: double.infinity,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.blue[100], 
                                      ),
                                    ),
                                    Container(
                                      color: Colors.brown[400],
                                      width: 50,
                                      height: double.infinity,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[300], 
                              height: 60,
                              child: Center(
                                child: Text(
                                  "¡Tu ubicación!",
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: _reset,
                        child: Text('Reiniciar'),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Text(
                            'Servicio',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 3.0,
                                  color: Colors.blue.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\$ 00.00',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Text(
                            'Correo: $_enteredEmail',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Dirección: $_enteredAddress',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _cardController,
                            decoration: InputDecoration(
                              labelText: 'Tarjeta',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _cvcController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'CvC',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _pay,
                            child: Text('Pagar'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _reset,
                      child: Text('Reiniciar'),
                    ),
                  ],
                ),
    );
  }
}

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 0;
  final TextEditingController _opinionController = TextEditingController();

  void _submitRating() {
    // Mostrar el mensaje con la calificación
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gracias por calificar con $_rating estrellas')),
    );
    
    // Redirigir al Login para comenzar un nuevo viaje
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calificación',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Por favor califica el servicio',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Calificación:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < _rating ? Colors.yellow : Colors.grey,
                    size: 40,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _opinionController,
              decoration: InputDecoration(
                labelText: 'Danos tu opinión',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

