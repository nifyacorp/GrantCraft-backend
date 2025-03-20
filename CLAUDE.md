# GrantCraft Backend Development Guide

## Build & Development Commands
- Install: `poetry install`
- Run dev server: `poetry run python -m reworkd_platform`
- Run single test: `poetry run pytest reworkd_platform/tests/path/to/test_file.py::test_function_name -v`
- Run all tests: `poetry run pytest`
- Type checking: `poetry run mypy reworkd_platform`
- Format code: `poetry run black reworkd_platform`
- Sort imports: `poetry run isort reworkd_platform`
- Lint: `poetry run flake8 reworkd_platform`

## Code Style Guidelines
- **Typing**: Strict typing required (mypy configured with `strict = true`)
- **Formatting**: Black formatting with 88 character line length
- **Imports**: Use isort with black profile, group stdlib/third-party/local imports
- **Docstrings**: Functions should have descriptive docstrings with parameter documentation
- **Error Handling**: Use try/except blocks with specific exceptions
- **Class Structure**: Abstract base classes with `@abstractmethod` for interfaces
- **Async**: Use async/await for database and external API operations
- **Testing**: Use pytest fixtures, mock external dependencies
- **Naming**: snake_case for variables/functions, PascalCase for classes
- **Environment**: Use `settings` module for accessing environment variables