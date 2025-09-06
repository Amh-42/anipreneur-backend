# cPanel Deployment Guide for Anipreneur Backend

## Prerequisites
- cPanel hosting with Python support
- Python 3.11+ virtual environment
- PostgreSQL database (recommended) or MySQL

## Deployment Steps

### 1. Upload Files
Upload your project files to the `/home/aniprebf/app.anipreneur.com/` directory:
```
/home/aniprebf/app.anipreneur.com/
├── passenger_wsgi.py
├── .htaccess
├── requirements_production.txt
├── src/
│   ├── manage.py
│   ├── cfehome/
│   ├── [other Django apps]
│   └── staticfiles/
└── [other project files]
```

### 2. Virtual Environment
Your virtual environment is already set up at:
```
/home/aniprebf/virtualenv/app.anipreneur.com/3.11/bin/python
```

To activate it, use:
```bash
source /home/aniprebf/virtualenv/app.anipreneur.com/3.11/bin/activate && cd /home/aniprebf/app.anipreneur.com
```

### 3. Install Dependencies
```bash
pip install -r requirements_production.txt
```

### 4. Configure Environment Variables
Create a `.env` file in the `src/` directory with your production settings:
```env
DJANGO_SECRET_KEY=your-production-secret-key
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
```

### 5. Update .htaccess
Replace `yourusername` in the `.htaccess` file with your actual cPanel username.

### 6. Database Setup
1. Create a PostgreSQL/MySQL database in cPanel
2. Run migrations:
```bash
cd src
python manage.py migrate
```

### 7. Create Superuser
```bash
cd src
python manage.py createsuperuser
```

### 8. Collect Static Files
```bash
cd src
python manage.py collectstatic --noinput
```

### 9. Configure Domain
1. Point your domain to the cPanel hosting
2. Set up SSL certificate
3. Test the application

## Important Notes

### File Permissions
Ensure proper file permissions:
- `passenger_wsgi.py`: 644
- `.htaccess`: 644
- `src/` directory: 755
- `src/staticfiles/`: 755

### Security Considerations
1. Set `DJANGO_DEBUG=False` in production
2. Use a strong `DJANGO_SECRET_KEY`
3. Configure proper `ALLOWED_HOSTS`
4. Use HTTPS in production
5. Keep dependencies updated

### Troubleshooting
1. Check cPanel error logs
2. Verify Python version compatibility
3. Ensure all dependencies are installed
4. Check database connectivity
5. Verify file permissions

## Support
For issues specific to your hosting provider, consult their Django deployment documentation.
