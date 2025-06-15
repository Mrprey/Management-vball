# Development Rules

## General Principles

1. **DRY (Don't Repeat Yourself)**: Avoid code duplication. Whenever possible, reuse existing functions, classes, or components.
2. **KISS (Keep It Simple, Stupid)**: Keep the code simple and straightforward. Avoid unnecessary complexity.
3. **SOLID**: Follow the SOLID principles for software design:
   - **S**: Single Responsibility Principle
   - **O**: Open/Closed Principle
   - **L**: Liskov Substitution Principle
   - **I**: Interface Segregation Principle
   - **D**: Dependency Inversion Principle
4. **Reusability**: Prioritize creating reusable components to avoid rework.
5. **Modularity**: Divide the code into small, independent modules.
6. **Coupling**: Minimize coupling between modules to facilitate maintenance and testing.
7. **Cohesion**: Maintain high cohesion within each module, ensuring it has a single responsibility.

## Architecture Pattern

8. **MVVM Clean Architecture**: Follow the MVVM Clean Architecture pattern, organizing the project into well-defined layers:

   - **Presentation Layer**:
     - **Views**: UI components that display data and capture user input.
     - **ViewModels**: Mediators between Views and Domain layer, handling UI logic and state.
     - **Widgets**: Reusable UI components.

   - **Domain Layer**:
     - **Entities**: Core business objects.
     - **Use Cases**: Application-specific business rules.
     - **Repositories (Interfaces)**: Abstraction of data operations.
     - **Services (Interfaces)**: Abstraction of external services.

   - **Data Layer**:
     - **Repositories (Implementations)**: Concrete implementations of repositories.
     - **Data Sources**: Sources of data (local, remote).
     - **Models**: Data transfer objects (DTOs).

   - **Core Layer**:
     - **Constants**: Application-wide constants.
     - **Utils**: Utility functions and extensions.
     - **DI**: Dependency injection configuration.
     - **Exceptions**: Custom exceptions and error handling.

9. **Dependency Injection**: Use GetIt for dependency injection to maintain loose coupling and facilitate testing.

10. **State Management**: Use Provider for simple state management and reactivity in the presentation layer.

## Project Structure

### Directory Organization
```
lib/
├── presentation/
│   ├── views/          # Telas completas da aplicação
│   ├── widgets/        # Componentes reutilizáveis da UI
│   └── view_models/    # ViewModels para cada view
├── domain/
│   ├── entities/       # Modelos de domínio
│   ├── repositories/   # Interfaces dos repositórios
│   ├── use_cases/      # Casos de uso
│   └── services/       # Interfaces de serviços
├── data/
│   ├── repositories/   # Implementações dos repositórios
│   ├── data_sources/   # Fontes de dados
│   └── models/         # DTOs e modelos de dados
├── core/
│   ├── constants/      # Constantes globais
│   ├── utils/          # Utilidades e extensões
│   ├── di/             # Container de injeção de dependência
│   └── exceptions/     # Tratamento de exceções
└── main.dart           # Ponto de entrada da aplicação
```

## Project Constants

### What should be added to files in `lib/core/constants/`:
- **Colors**: All colors used in the project should be centralized in `colors.dart`.
- **Sizes**: Dimensions such as spacings, font sizes, and widths should be centralized in `sizes.dart`.
- **Borders**: Border styles, such as radii and widths, should be centralized in `borders.dart`.
- **Themes**: If necessary, create a `themes.dart` file to store theme configurations.
- **Icons**: If the project uses custom icons, create an `icons.dart` file to centralize them.

### What should be avoided:
- **Constants specific to a single screen or component**: These should be kept close to the corresponding component or screen.
- **Temporary or test constants**: These should not be added to global constants files.

### What can be removed:
- Constants that are no longer used anywhere in the project.
- Duplicated constants or those that can be replaced by existing ones.

## Code Conventions

9. **Avoid Comments in Code**: Avoid adding comments in the code. The code should be self-explanatory. If a comment is absolutely necessary, it must be written in English.

10. **Use English for Naming**: All file names, classes, functions, variables, and other identifiers must be written in English to maintain consistency and facilitate international collaboration.

11. **Consistent Error Handling**: Ensure that all error handling is consistent across the project. Use a centralized approach for logging and displaying errors to the user, avoiding redundant or scattered error management logic.

## Code Quality

- **Remove Unused Imports**: Ensure that all unused imports are removed from the code to maintain cleanliness and avoid unnecessary dependencies.

## Pull Request Guidelines

- **Description Format**: The description of a Pull Request must be written in Markdown format, in English, and include emojis to enhance readability and structure. The description must also be enclosed in a code block to allow easy copying. For example:

  ```markdown
  ### 🚀 Feature Description

  This PR introduces...

  ### 🛠️ Changes Made

  - Change 1
  - Change 2

  ### ✅ How to Test

  Steps to test the changes...
  ```

Following these rules ensures cleaner, more organized, and maintainable code.
