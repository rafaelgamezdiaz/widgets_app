import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

enum Transportation { car, bike, airplane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool _developerMode = false;
  bool wantsBreakfast = true;
  bool wantsLauch = true;
  bool wantsDinner = false;

  String message = '';

  final Map<Transportation, String> transportationMessages = {
    Transportation.car: 'Me transporto en Carro',
    Transportation.bike: 'Me transporto en Bici',
    Transportation.airplane: 'Me transporto en Avión',
    Transportation.boat: 'Me transporto en Bote',
    Transportation.submarine: 'Me transporto en Submarino',
  };

  Transportation selectedTransportation = Transportation.car;
  Transportation selectedTransportationTwo = Transportation.car;

  String getTransportationMessage(Transportation selectedOption) {
    return transportationMessages[selectedOption] ?? 'Desconocida';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('SwitchTile'),
              SwitchListTile(
                title: const Text('Developer Mode'),
                subtitle: const Text('Aditional controls'),
                value: _developerMode,
                onChanged:
                    (value) => setState(() {
                      _developerMode = !_developerMode;
                    }),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('RadioList Normal'),

              RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('viajar en Auto'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged:
                    (value) => setState(() {
                      selectedTransportation = value as Transportation;
                    }),
              ),
              RadioListTile(
                title: const Text('By Bike'),
                subtitle: const Text('viajar en Bici'),
                value: Transportation.bike,
                groupValue: selectedTransportation,
                onChanged:
                    (value) => setState(() {
                      selectedTransportation = value as Transportation;
                    }),
              ),
              RadioListTile(
                title: const Text('By Airplane'),
                subtitle: const Text('viajar en Avión'),
                value: Transportation.airplane,
                groupValue: selectedTransportation,
                onChanged:
                    (value) => setState(() {
                      selectedTransportation = value as Transportation;
                    }),
              ),
              RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('viajar en Bote'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged:
                    (value) => setState(() {
                      selectedTransportation = value as Transportation;
                    }),
              ),
              RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('viajar en Submarino'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged:
                    (value) => setState(() {
                      selectedTransportation = value as Transportation;
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('RadioList Desplegable'),

              ExpansionTile(
                title: Text('Vehículo de Transporte'),
                subtitle: Text(
                  getTransportationMessage(selectedTransportationTwo),
                ),
                children: [
                  RadioListTile(
                    title: const Text('By Car'),
                    subtitle: const Text('viajar en Auto'),
                    value: Transportation.car,
                    groupValue: selectedTransportationTwo,
                    onChanged:
                        (value) => setState(() {
                          selectedTransportationTwo = value as Transportation;
                        }),
                  ),
                  RadioListTile(
                    title: const Text('By Bike'),
                    subtitle: const Text('viajar en Bici'),
                    value: Transportation.bike,
                    groupValue: selectedTransportationTwo,
                    onChanged:
                        (value) => setState(() {
                          selectedTransportationTwo = value as Transportation;
                        }),
                  ),
                  RadioListTile(
                    title: const Text('By Airplane'),
                    subtitle: const Text('viajar en Avión'),
                    value: Transportation.airplane,
                    groupValue: selectedTransportationTwo,
                    onChanged:
                        (value) => setState(() {
                          selectedTransportationTwo = value as Transportation;
                        }),
                  ),
                  RadioListTile(
                    title: const Text('By Boat'),
                    subtitle: const Text('viajar en Bote'),
                    value: Transportation.boat,
                    groupValue: selectedTransportationTwo,
                    onChanged:
                        (value) => setState(() {
                          selectedTransportationTwo = value as Transportation;
                        }),
                  ),
                  RadioListTile(
                    title: const Text('By Submarine'),
                    subtitle: const Text('viajar en Submarino'),
                    value: Transportation.submarine,
                    groupValue: selectedTransportationTwo,
                    onChanged:
                        (value) => setState(() {
                          selectedTransportationTwo = value as Transportation;
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Other thing'),
              CheckboxListTile(
                title: const Text('Quiere Desayuno?'),
                value: wantsBreakfast,
                onChanged:
                    (value) => setState(() {
                      wantsBreakfast = !wantsBreakfast;
                    }),
              ),
              CheckboxListTile(
                title: const Text('Quiere Almorzar?'),
                value: wantsLauch,
                onChanged:
                    (value) => setState(() {
                      wantsLauch = !wantsLauch;
                    }),
              ),
              CheckboxListTile(
                title: const Text('Quiere Cenar?'),
                value: wantsDinner,
                onChanged:
                    (value) => setState(() {
                      wantsDinner = !wantsDinner;
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
