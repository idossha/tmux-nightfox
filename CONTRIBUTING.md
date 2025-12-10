# Contributing to tmux-nightfox

Thank you for your interest in contributing to tmux-nightfox! This document provides guidelines and information for contributors.

## Development Setup

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/tmux-nightfox.git`
3. Create a feature branch: `git checkout -b feature/your-feature-name`

## Code Quality

This project uses several tools to maintain code quality:

- **shellcheck**: Static analysis for shell scripts
- **shfmt**: Shell script formatter
- **EditorConfig**: Consistent formatting across editors

### Running Quality Checks

```bash
# Run all checks
make check_scripts

# Run shellcheck only
make lint_shellcheck

# Run shfmt only (check formatting)
make lint_shfmt

# Format code with shfmt
shfmt -w -i 2 src/*.sh
```

## Adding New Themes

To add a new nightfox theme:

1. Add the theme colors to `src/palette_<themename>.sh`
2. Update the theme selection logic in `src/nightfox-main.sh`
3. Update the README.md with the new theme information

## Testing

Currently, the project has basic test infrastructure. To run tests:

```bash
# Run all tests (when implemented)
./tests/run_all_linux_tests.sh
```

## Pull Request Process

1. Ensure all quality checks pass
2. Update documentation if needed
3. Write clear commit messages
4. Create a pull request with a descriptive title and description

## License

By contributing to this project, you agree that your contributions will be licensed under the same MIT License that covers the project.
