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
│   ├── views/          # Complete application screens
│   ├── widgets/        # Reusable UI components
│   └── view_models/    # ViewModels for each view
├── domain/
│   ├── entities/       # Domain models
│   ├── repositories/   # Repository interfaces
│   ├── use_cases/      # Use cases
│   └── services/       # Service interfaces
├── data/
│   ├── repositories/   # Repository implementations
│   ├── data_sources/   # Data sources
│   └── models/         # DTOs and data models
├── core/
│   ├── constants/      # Global constants
│   ├── utils/          # Utilities and extensions
│   ├── di/             # Dependency injection container
│   └── exceptions/     # Exception handling
└── main.dart           # Application entry point
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

11. **Small Functions**: Functions should be concise and limited to a maximum of 20 lines. If a function exceeds this limit, consider refactoring it into smaller, reusable functions.

## Code Quality

## Testing

12. **Test Structure**: Organize tests following the same structure as the application code:
    - `test/domain/` for domain layer tests (entities, use cases)
    - `test/data/` for data layer tests (repositories)
    - `test/presentation/` for presentation layer tests (views, view models)

13. **Test Types**:
    - **Unit Tests**: Test individual components in isolation (entities, use cases, view models)
    - **Widget Tests**: Test UI components and their interactions
    - **Integration Tests**: Test the interaction between different components

14. **Mocking and Fakes**:
    - Use `FakePlayerRepository` for testing use cases and view models
    - Use `Translations.setMockStrings()` for mocking translations in tests
    - Minimize dependencies on real implementations in tests

15. **Test Coverage**:
    - All domain entities should have tests
    - All use cases should have tests
    - All view models should have tests
    - Critical UI flows should have widget tests

16. **Naming Convention**:
    - Test files should be named `<thing_being_tested>_test.dart`
    - Test groups should describe the class or component being tested
    - Test cases should describe the behavior being tested in plain language

- **Remove Unused Imports**: Ensure that all unused imports are removed from the code to maintain cleanliness and avoid unnecessary dependencies.

## Domain-Specific Rules

### Volleyball Player Positions

17. **Valid Player Positions**: Players can only have the following volleyball positions:
   - **L** = Levantador (Setter)
   - **P1** = Ponteiro 1 (Outside Hitter 1) 
   - **P2** = Ponteiro 2 (Outside Hitter 2)
   - **O** = Oposto (Opposite)
   - **M1** = Meio de Rede 1 (Middle Blocker 1)
   - **M2** = Meio de Rede 2 (Middle Blocker 2)
   - **Lib** = Líbero (Libero)

18. **Position Validation**: All player positions must be validated against the allowed positions defined in `PlayerPositions` class. No custom positions are allowed.

19. **Position Display**: When displaying positions in the UI, always show both the position code and description (e.g., "L - Setter").

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

## Git Hooks

20. **Pre-Push Verification**: A pre-push hook is configured to run the following checks before allowing code to be pushed:
   - **Code Formatting**: Uses `dart format` to ensure all files in `lib` and `test` directories follow proper formatting standards
   - **Code Analysis**: Uses `flutter analyze` to detect potential errors, code smells, or violations of best practices
   
   If any issues are found, the push will be blocked, and the error will be displayed in the terminal. Always make sure your code passes these checks before attempting to push changes.

21. **How to Fix Formatting Issues**:
   - Run `dart format lib test` to automatically fix formatting issues
   - Review the changes made by the formatter and ensure they don't introduce any functional issues

22. **How to Fix Analysis Issues**:
   - Pay attention to the error messages from `flutter analyze`
   - Address each issue before pushing your changes
   - Common issues include unused imports, missing required parameters, and deprecated API usage
