FROM python:3.9

WORKDIR /app

# Install uv
RUN pip3 install --no-cache-dir uv

# Copy project files
COPY ./pyproject.toml ./
COPY ./ ./

# Install dependencies using uv
RUN uv sync --no-dev

EXPOSE 8000

ENTRYPOINT ["/app/.venv/bin/python3", "-m", "piper_recording_studio", "--host", "0.0.0.0"]
