import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _numberController = TextEditingController();
  //final _passwordController = TextEditingController();
  Country selectedCountry = Country(
      phoneCode: '90',
      countryCode: 'TR',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Turkiye',
      example: 'Turkiye',
      displayName: 'Turkiye',
      displayNameNoCountryCode: 'TR',
      e164Key: '');

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(45, 48, 45, keyboardSpace + 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Hoşgeldiniz'),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _numberController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Telefon numaranız',
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  showCountryPicker(
                                      context: context,
                                      countryListTheme: const CountryListThemeData(
                                        bottomSheetHeight: 500,
                                      ),
                                      onSelect: (value) {
                                        setState(() {
                                          selectedCountry = value;
                                        });
                                      });
                                },
                                child: Text(
                                  '${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}',
                                  
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        /*TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Şifreniz',
                          ),
                        ),*/
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Giriş yap'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
