import 'package:flutter/material.dart';
import '../models/medicine.dart';

class DetailScreen extends StatelessWidget {
  final Medicine medicine;

  const DetailScreen({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.blue.shade600,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade600, Colors.blue.shade700],
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.medication,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  medicine.brandName,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  medicine.genericName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue.shade100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _buildChip(medicine.dosage),
                          const SizedBox(width: 8),
                          _buildChip(medicine.form),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey.shade50,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Prescription Warning
                  if (medicine.prescriptionRequired)
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          left: BorderSide(
                            color: Colors.red.shade500,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red.shade500,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recetë e Nevojshme',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red.shade800,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Ky bar kërkon recetë mjekësore për blerje.',
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Basic Info Card
                  _buildInfoCard(
                    context,
                    children: [
                      _buildInfoRow(
                        Icons.science,
                        'Përbërësit Aktivë',
                        medicine.activeIngredients,
                      ),
                      const Divider(height: 24),
                      _buildInfoRow(
                        Icons.category,
                        'Klasa Terapeutike',
                        medicine.therapeuticClass,
                      ),
                      const Divider(height: 24),
                      _buildInfoRow(
                        Icons.business,
                        'Prodhues',
                        medicine.manufacturer,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Indications
                  _buildDetailCard(
                    context,
                    icon: Icons.info_outline,
                    title: 'Indikacionet',
                    content: medicine.indications,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 16),

                  // Dosage
                  _buildDetailCard(
                    context,
                    icon: Icons.access_time,
                    title: 'Dozimi dhe Përdorimi',
                    content: medicine.dosageInstructions,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 16),

                  // Contraindications
                  _buildDetailCard(
                    context,
                    icon: Icons.block,
                    title: 'Kundërindikacionet',
                    content: medicine.contraindications,
                    color: Colors.red,
                  ),

                  const SizedBox(height: 16),

                  // Side Effects
                  _buildDetailCard(
                    context,
                    icon: Icons.warning_amber_rounded,
                    title: 'Efektet Anësore',
                    content: medicine.sideEffects,
                    color: Colors.orange,
                  ),

                  const SizedBox(height: 16),

                  // Storage
                  _buildDetailCard(
                    context,
                    icon: Icons.thermostat,
                    title: 'Ruajtja',
                    content: medicine.storage,
                    color: Colors.purple,
                  ),

                  // Notes
                  if (medicine.notes.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.yellow.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '⚠️',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Shënime të Rëndësishme',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow.shade900,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            medicine.notes,
                            style: TextStyle(
                              color: Colors.yellow.shade800,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, {required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey.shade400, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String content,
        required MaterialColor color,
      }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color.shade600, size: 20),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color.shade900,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              color: color.shade900,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}