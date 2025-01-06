"""
Base settings for icia project.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""
from django.core.management.utils import get_random_secret_key
from pathlib import Path
import os
from dotenv import load_dotenv

BASE_DIR = Path(__file__).resolve(strict=True).parent.parent
load_dotenv(BASE_DIR / ".env")


# Build paths inside the project like this: BASE_DIR / 'subdir'.

SECRET_KEY = os.getenv('DJANGO_SECRET_KEY', default=get_random_secret_key())
REGISTRATION_OPEN = os.environ.get('DJANGO_ALLOW_REGISTRATION',False)

ALLOWED_HOSTS = os.getenv('DJANGO_ALLOWED_HOSTS', default=" ").split(" ")


DEBUG = os.environ.get('DJANGO_DEBUG',False)

CSRF_TRUSTED_ORIGINS = os.getenv('CSRF_TRUSTED_ORIGINS','').split(' ')
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True

SECURE_SSL_REDIRECT = \
    os.getenv('SECURE_SSL_REDIRECT', '0').lower() in ['true', 't', '1']
if SECURE_SSL_REDIRECT:
    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')


STATIC_URL = "/static/"
STATICFILES_DIRS = [
    BASE_DIR / "static",
]
if os.getenv('DJANGO_ENV') == 'dev': 
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': BASE_DIR / 'db.sqlite3',
        }
    }
elif os.getenv('DJANGO_ENV') == 'prod':
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql',
            'NAME': os.environ['DBNAME'],
            'HOST': os.environ['DBHOST'],
            'USER': os.environ['DBUSER'],
            'PASSWORD': os.environ['DBPASS'],
            'PORT': os.environ['DBPORT'],
            'OPTIONS': {'sslmode': 'require'},
        }
    }
else:
    DATABASES = {
    }

# Azure hosting
STATIC_ROOT = BASE_DIR / 'staticfiles'

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    "django_bootstrap5",
    'accounts',
    'polls',
    'agents',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.locale.LocaleMiddleware', 
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'icia.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / "templates"],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.i18n',
            ],
        },
    },
]

WSGI_APPLICATION = 'icia.wsgi.application'

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'en'

TIME_ZONE = 'America/Sao_Paulo'

USE_I18N = True

USE_TZ = True

LANGUAGES = [
    ('en', 'English'),
    ('pt', 'Portuguese'),
]
LOCALE_PATHS = [os.path.join(os.path.dirname(__file__))]


# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


LOGIN_REDIRECT_URL = "home"
LOGOUT_REDIRECT_URL = "home"