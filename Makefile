.PHONY: all docker install install-dev install-export run test lint format clean

all: docker

docker:
	docker build . -t rhasspy/piper-recording-studio

install:
	uv sync

install-dev:
	uv sync --all-extras

install-export:
	uv sync --extra export

run:
	uv run python -m piper_recording_studio

run-export:
	uv run python -m export_dataset

test:
	uv run pytest

lint:
	uv run flake8 piper_recording_studio export_dataset
	uv run mypy piper_recording_studio export_dataset
	uv run pylint piper_recording_studio export_dataset

format:
	uv run black piper_recording_studio export_dataset
	uv run isort piper_recording_studio export_dataset

clean:
	rm -rf .venv .pytest_cache .mypy_cache
