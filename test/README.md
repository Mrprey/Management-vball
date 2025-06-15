# Testes da Aplicação

Este diretório contém os testes automatizados para o projeto Management Vball, organizados seguindo a arquitetura MVVM Clean.

## Estrutura dos Testes

Os testes estão organizados seguindo a mesma estrutura da aplicação:

```
test/
  ├── data/                   # Testes da camada de dados
  │   ├── repositories/       # Implementações fake dos repositórios 
  │   └── player_repository_test.dart
  ├── domain/                 # Testes da camada de domínio
  │   ├── entities/           # Testes das entidades 
  │   │   └── player_test.dart
  │   └── use_cases/          # Testes dos casos de uso
  │       └── player_use_cases_test.dart
  ├── presentation/           # Testes da camada de apresentação
  │   ├── views/              # Testes das views
  │   │   └── player_view_test.dart
  │   └── view_models/        # Testes dos view models
  │       └── player_view_model_test.dart
  └── translations_test.dart  # Testes das traduções
```

## Tipos de Testes

1. **Testes de Unidade**
   - Entidades do domínio
   - Casos de uso
   - ViewModels
   - Repositórios

2. **Testes de Widget**
   - Views e componentes de UI

3. **Testes de Integração**
   - Integração entre ViewModels e repositórios
   - Sistema de traduções

## Mocking e Fakes

Para facilitar os testes, utilizamos:

- `FakePlayerRepository`: uma implementação de teste do repositório de jogadores
- `Translations.setMockStrings()`: método para configurar traduções de teste

## Executando os Testes

Para executar todos os testes:

```bash
fvm flutter test
```

Para executar um arquivo específico de teste:

```bash
fvm flutter test test/domain/entities/player_test.dart
```

## Boas Práticas

1. Mantenha os testes pequenos e focados em uma única funcionalidade
2. Use mocks ou fakes para isolar a unidade sendo testada
3. Siga a convenção de nomeação: `describe_what_it_tests_test.dart`
4. Para testes de widget, prefira testar comportamentos em vez de detalhes de implementação
5. Sempre atualize os testes quando a funcionalidade mudar
