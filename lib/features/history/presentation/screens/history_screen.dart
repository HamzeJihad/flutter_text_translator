import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/history/presentation/providers/history_provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(historyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Traduções'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () => ref.read(historyProvider.notifier).clearHistory(),
          )
        ],
      ),
      body: historyAsync.when(
        data: (historyList) {
          if (historyList.isEmpty) {
            return const Center(child: Text('Nenhuma tradução encontrada.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final item = historyList[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(item.originalText),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('➡ ${item.translatedText}'),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('dd/MM/yyyy – HH:mm').format(item.date),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }
}
