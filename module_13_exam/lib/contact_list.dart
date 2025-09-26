import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {"name": "Javad", "phone": "01877-123417"},
      {"name": "Ferdous", "phone":"01757-234277"},
      {"name": "Hasan", "phone": "01745-979777"},
      {"name": "roman", "phone": "01745-772427"},
      {"name": "rakib", "phone": "01745-777232"},
      {"name": "jubayer", "phone": "01745-713147"},
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          "Contact List",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Hasan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "01945-777777",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[300],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),

                    child: const Text("Add"),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        contacts[index]["name"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      subtitle: Text(contacts[index]["phone"]!),
                      trailing: const Icon(Icons.phone, color: Colors.blue),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
