#!/bin/bash

# Install general dependencies
uv pip install -r requirements.txt

# Check for CUDA and install flash-attn only if CUDA is available
if python -c "import torch; print(torch.cuda.is_available())" | grep -q "True"; then
    uv pip install flash-attn
    echo "flash-attn installed (CUDA detected)"
else
    echo "Skipping flash-attn installation (no CUDA detected)"
fi
