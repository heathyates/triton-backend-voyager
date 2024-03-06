# Use NVIDIA Triton Server as the base image
FROM nvcr.io/nvidia/tritonserver:23.05-py3

# Install additional dependencies or perform custom setup
# Example: Installing Git and Python dependencies
RUN apt-get update && apt-get install -y git python3-pip && rm -rf /var/lib/apt/lists/*

# Clone the specific version of the Python backend for Triton
RUN git clone https://github.com/triton-inference-server/python_backend -b r23.05 /workspace/python_backend

# Copy your project files into the container
# Ensure you adapt this step according to your project structure
COPY . /voyager
RUN python3 -m venv /voyager/venv
ENV PATH="/voyager/venv/bin:$PATH"