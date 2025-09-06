#!/usr/bin/env python3
"""
Passenger WSGI script for cPanel deployment
This file should be placed in /home/aniprebf/app.anipreneur.com/
"""

import os
import sys

# Add the src directory to the Python path
# Path: /home/aniprebf/app.anipreneur.com/src
src_path = os.path.join(os.path.dirname(__file__), 'src')
if src_path not in sys.path:
    sys.path.insert(0, src_path)

# Set the Django settings module
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'cfehome.settings')

# Import and configure the WSGI application
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
