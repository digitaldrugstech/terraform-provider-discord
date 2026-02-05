.DEFAULT_GOAL := help
export PATH := /home/haffk/.local/go/bin:$(PATH)

.PHONY: build
build: ## Build the Terraform provider binary
	go build .

.PHONY: clean
clean: ## Remove build artifacts
	rm -f terraform-provider-discord

.PHONY: fmt
fmt: ## Format code with go fmt
	go fmt ./...

.PHONY: vet
vet: ## Run go vet for static analysis
	go vet ./...

.PHONY: test
test: ## Run tests
	go test ./...

.PHONY: help
help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'
