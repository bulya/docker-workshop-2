from django.core.mail import send_mail

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import AllowAny


class SendEmailAPIView(APIView):
    permission_classes = (AllowAny,)

    def get(self, request, format=None):
        send_mail('Test subject', 'Test message', 'from@example.com', ['to@example.com'])
        return Response('Email sent')
