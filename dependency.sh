#!/bin/sh
# Section 1: Creating Python Virtual environment
echo ==========================
echo "Creating Python Virtual environment"
echo ============================
python -m venv $(pwd)/Venv/ui_test

# Section 2: Activate Python Virtual environment
echo ==========================
echo "Activating Python Virtual environment"
echo ============================
source $(pwd)/Venv/ui_test/bin/activate

# Section 3: Install required libraries
echo ==========================
echo "Installing required libraries mentioned in requirements.txt"
echo ============================
pip install -r requirements.txt