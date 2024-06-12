.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

install-dependencies: ## Runs commands to install various dependencies (Flutter packages, …)
	flutter pub get
	./security/vault.sh decrypt

run-tests: ## Runs the tests
	@echo "Ensure the *.mocks.dart files are generated by running 'flutter packages pub run build_runner build --delete-conflicting-outputs'"
	flutter test test/subjects/**/*_tests.dart --coverage --coverage-path="test/coverage/lcov.info"
	genhtml test/coverage/lcov.info -o test/coverage/html



run: ## Runs.
	flutter run 


