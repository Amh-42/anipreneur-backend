#!/bin/bash
# Deployment script for cPanel hosting
# Run this script to prepare your Django project for cPanel deployment

echo "🚀 Preparing Django project for cPanel deployment..."

# Create deployment directory
mkdir -p cpanel_deployment
cd cpanel_deployment

# Copy necessary files
echo "📁 Copying project files..."
cp -r ../src .
cp ../passenger_wsgi.py .
cp ../passenger_wsgi_production.py .
cp ../.htaccess .
cp ../requirements_production.txt .
cp ../CPANEL_DEPLOYMENT.md .

# Create .env template
echo "📝 Creating .env template..."
cat > src/.env.template << EOF
# Django Configuration
DJANGO_SECRET_KEY=your-production-secret-key-here
DJANGO_DEBUG=False
BASE_URL=https://yourdomain.com

# Database Configuration
DATABASE_URL=postgresql://username:password@localhost:5432/dbname

# Email Configuration
EMAIL_HOST=mail.inlinkai.com
EMAIL_PORT=587
EMAIL_HOST_USER=anwar@inlinkai.com
EMAIL_HOST_PASSWORD=@Yourface21
EMAIL_USE_TLS=True
EMAIL_USE_SSL=False

# Admin Configuration
ADMIN_USER_NAME=Admin
ADMIN_USER_EMAIL=anwar@inlinkai.com
EOF

# Create deployment instructions
echo "📋 Creating deployment instructions..."
cat > DEPLOYMENT_INSTRUCTIONS.txt << EOF
CPANEL DEPLOYMENT INSTRUCTIONS
==============================

1. Upload all files from this directory to your cPanel public_html folder

2. Upload files to your cPanel directory:
   - Upload to: /home/aniprebf/app.anipreneur.com/
   - The .htaccess file is already configured for your setup

3. Virtual environment is already configured:
   - Path: /home/aniprebf/virtualenv/app.anipreneur.com/3.11/bin/python
   - Activate with: source /home/aniprebf/virtualenv/app.anipreneur.com/3.11/bin/activate

4. Install dependencies:
   pip install -r requirements_production.txt

5. Configure environment:
   - Copy .env.template to .env
   - Update all values with your actual settings

6. Set up database:
   - Create PostgreSQL/MySQL database in cPanel
   - Update DATABASE_URL in .env file

7. Run migrations:
   cd src
   python manage.py migrate

8. Create superuser:
   python manage.py createsuperuser

9. Collect static files:
   python manage.py collectstatic --noinput

10. Test your application!

For detailed instructions, see CPANEL_DEPLOYMENT.md
EOF

echo "✅ Deployment package created in 'cpanel_deployment' directory!"
echo "📖 See DEPLOYMENT_INSTRUCTIONS.txt for next steps"
echo "📚 Detailed guide available in CPANEL_DEPLOYMENT.md"
