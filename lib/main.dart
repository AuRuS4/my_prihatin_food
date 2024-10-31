import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[800]!),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    DonatePage(),
    RecipientPage(),
    PartnerPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism), label: 'Donate'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Recipient'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Partners'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/Universiti_Tenaga_Nasional_Main_Building_Tourism_Selangor.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "LET'S END WORLD HUNGER",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Connecting communities through the sharing of surplus food to combat hunger and foster goodwill.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _polaroidButton(
              context,
              title: 'News',
              description: 'Stay updated with the latest news.',
              image: 'assets/newsss.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsPage()),
                );
              },
            ),
            _polaroidButton(
              context,
              title: 'Chart',
              description: 'View our progress through statistics.',
              image: 'assets/Charttt.jpg',
              onTap: () {
                // Add functionality for the Chart button
              },
            ),
            _polaroidButton(
              context,
              title: 'Where You Can Find Us',
              description: 'Explore our locations on the map.',
              image: 'assets/mapssss.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocationPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              onPressed: () {
                // Navigate to the donate page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DonatePage()),
                );
              },
              child: const Text(
                'Donate Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _polaroidButton(
    BuildContext context, {
    required String title,
    required String description,
    required String image,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for news items.
    final newsList = [
      {'title': 'Food Bank Expands Reach', 'content': 'New centers open...'},
      {'title': 'Donation Drive Success', 'content': 'Over 1000 meals...'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return ListTile(
            title: Text(news['title']!),
            subtitle: Text(news['content']!),
          );
        },
      ),
    );
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Locations')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Bangi'),
            subtitle: const Text(
              'Universiti Tenaga Nasional (UNITEN), Putrajaya Campus, Jalan Kajang - Puchong, 43000 Kajang, Selangor',
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Kuala Lumpur'),
            subtitle: const Text(
              'The Lost Food Project, 471, Jalan Tiga, Kuala Lumpur',
            ),
          ),
        ],
      ),
    );
  }
}

/*class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = [
      {
        'name': 'Food Bank Malaysia',
        'description': 'Provides food aid to families in need across Malaysia.',
      },
      {
        'name': 'KPDN Food Bank Program',
        'description':
            'A government initiative to manage surplus food and reduce waste.',
      },
      {
        'name': 'NGO Base',
        'description':
            'A collaboration platform for NGOs addressing food insecurity.',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Our Partners')),
      body: ListView.builder(
        itemCount: partners.length,
        itemBuilder: (context, index) {
          final partner = partners[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    partner['name']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(partner['description']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} */

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  double? customAmount;
  String? paymentMethod;
  String? selectedCause;

  final _formKey = GlobalKey<FormState>(); // Key for form validation

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donate',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Attach form key for validation
          child: ListView(
            children: [
              const SizedBox(height: 20),

              // Donation Amount Selection
              Text(
                'Select Amount:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Wrap(
                spacing: 10.0,
                children: [
                  _amountButton(5),
                  _amountButton(10),
                  _amountButton(20),
                  _amountButton(50),
                ],
              ),
              const SizedBox(height: 20),

              // Custom Amount TextField
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Custom Amount',
                  prefixText: 'RM ',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    customAmount = double.tryParse(value);
                  });
                },
                validator: (value) {
                  if (customAmount == null || customAmount! <= 0) {
                    return 'Enter a valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Donation Cause Selection
              Text(
                'Select Donation Cause:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              DropdownButtonFormField<String>(
                value: selectedCause,
                items: const [
                  DropdownMenuItem(
                      child: Text('Emergency'), value: 'emergency'),
                  DropdownMenuItem(child: Text('Children'), value: 'children'),
                  DropdownMenuItem(child: Text('Conflict'), value: 'conflict'),
                  DropdownMenuItem(
                      child: Text('Nutrition'), value: 'nutrition'),
                  DropdownMenuItem(
                      child: Text('Climate Change'), value: 'climate_change'),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCause = value;
                  });
                },
                hint: const Text('Select a donation cause'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a cause';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Payment Method Selection
              Text(
                'Payment Method:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                items: const [
                  DropdownMenuItem(child: Text('Bank Transfer'), value: 'bank'),
                  DropdownMenuItem(child: Text('QR Payment'), value: 'qr'),
                ],
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
                hint: const Text('Select a payment method'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a payment method';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Donate Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (paymentMethod == 'bank') {
                      _showDialog(
                        'Bank Transfer Details',
                        'Please transfer to this account:\n\n0000 0000 0000 0000',
                      );
                    } else if (paymentMethod == 'qr') {
                      _showDialog(
                        'QR Payment',
                        'Please scan the QR code below:',
                      );
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Image.asset(
                            'assets/qrrr.jpg',
                            height: 150,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    _showDialog('Error',
                        'Please fill in all fields before confirming.');
                  }
                },
                child: const Text('Donate Now'),
              ),
              const SizedBox(height: 20),

              // Quote Section
              const Divider(height: 40, thickness: 2),
              const Text(
                'Inspiration:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                '“Don’t feel ashamed when giving little for charity; that is because there is always goodness in giving no matter how little.”\n- Ali Ibn Abi Talib (RA)',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _amountButton(double amount) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          customAmount = amount;
        });
      },
      child: Text('RM $amount'),
    );
  }
}

class RecipientPage extends StatelessWidget {
  const RecipientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipients',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecipientRegistrationPage()),
            );
          },
          child: const Text('Register Now'),
        ),
      ),
    );
  }
}

class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = [
      {
        'name': 'Food Bank Malaysia',
        'description': 'Provides food aid to families in need across Malaysia.',
      },
      {
        'name': 'KPDN Food Bank Program',
        'description':
            'A government initiative to manage surplus food and reduce waste.',
      },
      {
        'name': 'NGO Base',
        'description':
            'A collaboration platform for NGOs addressing food insecurity.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Our Partners',
          style: TextStyle(
            color: Colors.black, // Text color is black
            fontWeight: FontWeight.bold, // Bold font
          ),
        ),
        backgroundColor: Colors.green[800], // Dark green background
      ),
      body: ListView.builder(
        itemCount: partners.length,
        itemBuilder: (context, index) {
          final partner = partners[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    partner['name']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(partner['description']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Recipient Registration Page
class RecipientRegistrationPage extends StatelessWidget {
  const RecipientRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register as a Recipient'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Terms and Conditions:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('- Must be a registered NGO group.'),
              const Text('- Must actively engage in community work.'),
              const Text('- Provide valid documents upon request.'),
              const Text('- Must comply with food safety guidelines.'),
              const Text('- Subject to review and approval by the team.'),
              const SizedBox(height: 20),

              // Form Fields
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Identity Card Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your IC number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(labelText: 'NGO Body Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your NGO name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'NGO Registration Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the registration number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Contact Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the contact number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Type of NGO'),
                items: const [
                  DropdownMenuItem(
                      value: 'emergency', child: Text('Emergency')),
                  DropdownMenuItem(value: 'children', child: Text('Children')),
                  DropdownMenuItem(value: 'conflict', child: Text('Conflict')),
                  DropdownMenuItem(
                      value: 'nutrition', child: Text('Nutrition')),
                  DropdownMenuItem(
                      value: 'climate_change', child: Text('Climate Change')),
                ],
                onChanged: (value) {},
                validator: (value) {
                  if (value == null) {
                    return 'Please select a type of NGO';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const Text(
                'We will review your request and reach out as soon as possible.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Submit the form data to the database (to be implemented)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registration submitted')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
