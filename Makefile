.DEFAULT_GOAL := help
# Add Go to PATH if not already available
GO_BIN := $(or $(shell command -v go 2>/dev/null),$(HOME)/.local/go/bin/go)
export PATH := $(dir $(GO_BIN)):$(PATH)

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
