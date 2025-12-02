import '../models/medicine.dart';

class MockData {
  static final Map<String, Medicine> medicines = {
    '8001090001634': Medicine(
      barcode: '8001090001634',
      genericName: 'Paracetamol',
      brandName: 'Panadol',
      dosage: '500mg',
      form: 'Tabletë',
      activeIngredients: 'Paracetamol 500mg',
      manufacturer: 'GlaxoSmithKline',
      therapeuticClass: 'Analgezikë dhe Antipiretikë',
      indications: 'Përdoret për lehtësimin e dhimbjes së lehtë deri në mesatare dhe uljen e temperaturës.',
      contraindications: 'Alergjia ndaj paracetamolit, sëmundjet e rënda të mëlçisë.',
      sideEffects: 'Rrallë: reaksione alergjike, probleme me mëlçinë në doza të larta.',
      dosageInstructions: 'Të rritur: 1-2 tableta çdo 4-6 orë. Maksimumi 8 tableta në 24 orë.',
      storage: 'Ruhet në temperaturë dhome, larg dritës dhe lagështirës.',
      prescriptionRequired: false,
      notes: 'Mos tejkaloni dozën e rekomanduar.',
    ),
    '5029849000110': Medicine(
      barcode: '5029849000110',
      genericName: 'Ibuprofen',
      brandName: 'Nurofen',
      dosage: '400mg',
      form: 'Tabletë të veshura',
      activeIngredients: 'Ibuprofen 400mg',
      manufacturer: 'Reckitt Benckiser',
      therapeuticClass: 'Antinflamatorë jo-steroidë (NSAID)',
      indications: 'Dhimbje, inflamacion, ethe. Përdoret për dhimbje koke, dhëmbësh, menstruale, dhe dhimbje muskulare.',
      contraindications: 'Ulçera gastrike aktive, astmë e rëndë, dështim i rëndë i zemrës, trimestri i tretë i shtatzënisë.',
      sideEffects: 'Probleme gastrike, marrje mendsh, dhimbje koke, reaksione alergjike.',
      dosageInstructions: 'Të rritur: 1 tabletë 3 herë në ditë me ushqim. Maksimumi 1200mg në 24 orë.',
      storage: 'Ruhet në temperaturë dhome (nën 25°C), larg lagështirës.',
      prescriptionRequired: false,
      notes: 'Merrni me ushqim për të minimizuar efektet anësore gastrike.',
    ),
    '8470001575234': Medicine(
      barcode: '8470001575234',
      genericName: 'Amoxicillin',
      brandName: 'Amoxil',
      dosage: '500mg',
      form: 'Kapsula',
      activeIngredients: 'Amoxicillin 500mg (si trihidrat)',
      manufacturer: 'GlaxoSmithKline',
      therapeuticClass: 'Antibiotikë - Penicilinë',
      indications: 'Infeksione bakteriale: infeksione të sistemit respirator, infeksione të traktit urinar, infeksione të lëkurës.',
      contraindications: 'Alergjia ndaj penicilinës ose cefalosporinave, mononukleoza infektive.',
      sideEffects: 'Diarre, të vjella, skuqje të lëkurës, kandidoza.',
      dosageInstructions: 'Të rritur: 1 kapsulë 3 herë në ditë për 7-10 ditë. Përfundoni kursin e plotë të trajtimit.',
      storage: 'Ruhet në temperaturë dhome, larg lagështirës dhe dritës.',
      prescriptionRequired: true,
      notes: 'RËNDËSISHME: Përfundoni gjithë kursin antibiotik edhe nëse ndjeheni më mirë.',
    ),
  };

  static Medicine? getMedicineByBarcode(String barcode) {
    return medicines[barcode];
  }

  static List<Medicine> searchMedicines(String query) {
    if (query.isEmpty) return [];

    final lowerQuery = query.toLowerCase();
    return medicines.values.where((medicine) {
      return medicine.genericName.toLowerCase().contains(lowerQuery) ||
          medicine.brandName.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  static List<Medicine> getAllMedicines() {
    return medicines.values.toList();
  }
}