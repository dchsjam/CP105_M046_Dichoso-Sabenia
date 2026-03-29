import 'dart:io';

List<Map<String, dynamic>> records = [];
int idCounter = 1;

void pause() {
  stdout.write("\nPress Enter to continue...");
  stdin.readLineSync();
}

// CREATE
void createRecord() {
  print("\n=== ADD NEW RECORD ===");
  stdout.write("Enter borrower name: ");
  String borrower = stdin.readLineSync()!;
  stdout.write("Enter item borrowed: ");
  String item = stdin.readLineSync()!;
  stdout.write("Enter date borrowed: ");
  String dateBorrowed = stdin.readLineSync()!;

  records.add({
    "id": idCounter++,
    "borrower": borrower,
    "item": item,
    "dateBorrowed": dateBorrowed,
    "returned": false
  });

  print("\n✅ Record added successfully!");
  pause();
}

// READ
void viewRecords() {
  print("\n=== BORROW RECORDS ===");
  if (records.isEmpty) {
    print("No records available.");
  } else {
    for (var r in records) {
      print("ID: ${r['id']} | Borrower: ${r['borrower']} | Item: ${r['item']} | Date: ${r['dateBorrowed']} | Returned: ${r['returned']}");
    }
  }
  pause();
}

// UPDATE
void updateRecord() {
  print("\n=== UPDATE RECORD ===");
  stdout.write("Enter record ID to mark as returned: ");
  int id = int.parse(stdin.readLineSync()!);

  for (var r in records) {
    if (r['id'] == id) {
      r['returned'] = true;
      print("\n✅ Record updated (marked as returned)!");
      pause();
      return;
    }
  }
  print("\n❌ Record not found.");
  pause();
}

// DELETE
void deleteRecord() {
  print("\n=== DELETE RECORD ===");
  stdout.write("Enter record ID to delete: ");
  int id = int.parse(stdin.readLineSync()!);

  records.removeWhere((r) => r['id'] == id);
  print("\n✅ Record deleted (if ID existed).");
  pause();
}

// MENU
void showMenu() {
  print("\n===============================");
  print(" BORROW AND RETURN TRACKER");
  print("===============================");
  print("1. Add Record");
  print("2. View Records");
  print("3. Mark as Returned");
  print("4. Delete Record");
  print("5. Exit");
  print("===============================");
}

void main() {
  while (true) {
    showMenu();
    stdout.write("Choose an option (1-5): ");
    String choice = stdin.readLineSync()!;
    switch (choice) {
      case '1':
        createRecord();
        break;
      case '2':
        viewRecords();
        break;
      case '3':
        updateRecord();
        break;
      case '4':
        deleteRecord();
        break;
      case '5':
        print("\nExiting system...");
        return;
      default:
        print("\nInvalid choice. Try again.");
        pause();
    }
  }
}
