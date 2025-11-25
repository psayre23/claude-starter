.DEFAULT_GOAL := help

.PHONY: help setup

help:
	@echo "Claude Code Template Repository"
	@echo ""
	@echo "Available commands:"
	@echo "  make setup TARGET=<path>   Install templates to specified directory"
	@echo "  make help                  Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make setup TARGET=/path/to/your/project"
	@echo "  make setup TARGET=../my-app"
	@echo ""
	@echo "Note: If TARGET is not provided, the script will prompt you for a path."

setup:
	@bash scripts/setup.sh $(TARGET)
