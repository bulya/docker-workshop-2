from django.core.mail import send_mail

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import AllowAny

from core.tasks import email


class SendEmailAPIView(APIView):
    permission_classes = (AllowAny,)

    def get(self, request, format=None):
        email.delay()
        return Response('Email sent')
