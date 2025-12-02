class Medicine {
  final String barcode;
  final String genericName;
  final String brandName;
  final String dosage;
  final String form;
  final String activeIngredients;
  final String manufacturer;
  final String therapeuticClass;
  final String indications;
  final String contraindications;
  final String sideEffects;
  final String dosageInstructions;
  final String storage;
  final bool prescriptionRequired;
  final String notes;

  Medicine({
    required this.barcode,
    required this.genericName,
    required this.brandName,
    required this.dosage,
    required this.form,
    required this.activeIngredients,
    required this.manufacturer,
    required this.therapeuticClass,
    required this.indications,
    required this.contraindications,
    required this.sideEffects,
    required this.dosageInstructions,
    required this.storage,
    required this.prescriptionRequired,
    required this.notes,
  });

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      barcode: map['barcode'] ?? '',
      genericName: map['genericName'] ?? '',
      brandName: map['brandName'] ?? '',
      dosage: map['dosage'] ?? '',
      form: map['form'] ?? '',
      activeIngredients: map['activeIngredients'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      therapeuticClass: map['therapeuticClass'] ?? '',
      indications: map['indications'] ?? '',
      contraindications: map['contraindications'] ?? '',
      sideEffects: map['sideEffects'] ?? '',
      dosageInstructions: map['dosageInstructions'] ?? '',
      storage: map['storage'] ?? '',
      prescriptionRequired: map['prescriptionRequired'] ?? false,
      notes: map['notes'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'barcode': barcode,
      'genericName': genericName,
      'brandName': brandName,
      'dosage': dosage,
      'form': form,
      'activeIngredients': activeIngredients,
      'manufacturer': manufacturer,
      'therapeuticClass': therapeuticClass,
      'indications': indications,
      'contraindications': contraindications,
      'sideEffects': sideEffects,
      'dosageInstructions': dosageInstructions,
      'storage': storage,
      'prescriptionRequired': prescriptionRequired,
      'notes': notes,
    };
  }
}