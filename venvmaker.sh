#!/bin/zsh

mkdir venv
python3 -m venv venv/
source venv/bin/activate
pip install -r requirements.txt

# if it doesnt work, run this in the terminal
# chmod +x venvmaker.sh