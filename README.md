
# 📲 Flutter Translation App

Este projeto é um app de tradução construído em Flutter utilizando uma arquitetura escalável e testável baseada em **Clean Architecture** com suporte à persistência de histórico, estado reativo e testes automatizados.

---

## 🧱 Arquitetura

O projeto segue o padrão **Clean Architecture**, separando responsabilidades em camadas bem definidas:

```
lib/
├── core/                 # Utilitários globais (temas, ícones, formatos, etc.)
├── features/
│   ├── history/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   └── repositories/
│   │   └── presentation/
│   │       ├── providers/
│   │       └── widgets/
│   └── translation/
│       ├── domain/
│       ├── data/
│       └── presentation/
├── injector/             # Injeção de dependências com GetIt
└── main.dart             # Ponto de entrada
```

---

## 📦 Dependências principais

- [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod): Gerenciamento de estado reativo
- [`get_it`](https://pub.dev/packages/get_it): Injeção de dependência
- [`mockito`](https://pub.dev/packages/mockito): Mock para testes
- [`google_mlkit_translation`](https://pub.dev/packages/google_mlkit_translation): Tradução via MLKit
- [`shared_preferences`](https://pub.dev/packages/shared_preferences): Armazenamento local do histórico
- [`flutter_test`](https://pub.dev/packages/flutter_test): Framework nativo de testes do Flutter

---

## 🧠 Funcionalidades

- 🔤 Tradução de texto com seleção de idioma de origem e destino
- 📜 Histórico de traduções com persistência local
- 🔄 Atualização automática de estado com Riverpod
- 🧪 Testes unitários com cobertura dos principais fluxos
- 💡 Separação clara de responsabilidades (camadas `domain`, `data`, `presentation`)

---

## 🛠️ Camadas em Detalhe

### 📁 Domain
- `Entities`: Define os modelos de negócio (`TranslationHistoryEntity`, `TranslateTextParams`, etc).
- `Usecases`: Casos de uso como `GetTranslationHistoryUsecase`, `SaveTranslationUsecase`, `TranslateTextUsecase`.

### 📁 Data
- `Datasources`: Fontes de dados, como local com `SharedPreferences`.
- `Repositories`: Implementações dos contratos de repositórios definidos no domínio.

### 📁 Presentation
- `Providers`: `StateNotifier` + `Riverpod` para lógica de estado.
- `Widgets`: Componentes reutilizáveis.

---

## 🧪 Testes Automatizados

Os testes cobrem:

✅ Tradução com sucesso  
✅ Tratamento de erros  
✅ Adição ao histórico  
✅ Limpeza do histórico  
✅ Estado inicial vazio

### Estrutura de testes:
```
test/
├── providers/
│   ├── translate_text_provider_test.dart
│   └── history_provider_test.dart
├── mocks/
│   └── mocks.mocks.dart
```

Para rodar os testes:

```bash
flutter test
```

> Os testes utilizam `Mockito` com `@GenerateMocks` para gerar mocks de usecases e repositórios.

---

## 🧩 Injeção de Dependência

O arquivo `injector/injector.dart` configura o **GetIt** com todos os serviços e casos de uso:

```dart
final injector = GetIt.instance;

void setupDependencies() {
  injector.registerLazySingleton<TranslateTextUsecase>(() => TranslateTextUsecaseImpl(...));
  injector.registerLazySingleton<GetTranslationHistoryUsecase>(() => GetTranslationHistoryUsecaseImpl(...));
  injector.registerLazySingleton<SaveTranslationUsecase>(() => SaveTranslationUsecaseImpl(...));
}
```

---

## 🧬 Exemplo de fluxo: Tradução + Histórico

1. Usuário digita o texto.
2. Provider `translateTextProvider` chama o `TranslateTextUsecase`.
3. Ao concluir, salva o resultado com `SaveTranslationUsecase`.
4. O `HistoryNotifier` recarrega os dados com `GetTranslationHistoryUsecase`.

---

## 📄 Contribuindo

1. Faça um fork
2. Crie sua branch (`git checkout -b feature/sua-feature`)
3. Commit suas alterações (`git commit -m 'feat: nova feature'`)
4. Push na branch (`git push origin feature/sua-feature`)
5. Crie um Pull Request 🎉

---

## ✅ TODO Futuro

- 🔍 Busca no histórico
- 📤 Compartilhamento da tradução
- 🌐 Tradução de voz
- 🔁 Sincronização em nuvem

---

## 👨‍💻 Autor

**Hamze Jihad**  
[GitHub](https://github.com/hamzejihad) • [LinkedIn](https://linkedin.com/in/hamzejihad)

---

## 📝 Licença

Este projeto é licenciado sob a licença MIT.
