from django.core.mail import send_mail

from celery_app import app as celery_app


@celery_app.task
def email():
    send_mail('Test subject', 'Test message', 'from@example.com', ['to@example.com'])
