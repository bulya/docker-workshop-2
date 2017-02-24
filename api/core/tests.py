from django.urls import reverse
from django.core import mail
 
from rest_framework.test import APITestCase
from rest_framework import status
 
 
class EnailTests(APITestCase):
    def test_get_time(self):
        url = reverse('api-email')
        self.assertEqual(len(mail.outbox), 0)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, 'Email sent')
        self.assertEqual(len(mail.outbox), 1)