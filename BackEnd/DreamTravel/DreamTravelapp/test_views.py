# tests/test_views.py

from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from .models import Destinos, Carrito

class CarritoViewSetTests(APITestCase):
    def setUp(self):
        self.destino = Destinos.objects.create(
            nombre="San Carlos de Bariloche", 
            precio_Destino=1000,
            id_metodoPago="Tarjeta"
        )
        self.carrito = Carrito.objects.create(
            id_destino=self.destino,
            cantidad=1,
            id_metodoPago=self.destino.id_metodoPago
        )

    def test_agregar_item(self):
        url = reverse('carrito-agregar', kwargs={'pk': self.destino.pk})
        response = self.client.post(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(Carrito.objects.count(), 1)
        self.assertEqual(Carrito.objects.get().cantidad, 2)

    def test_eliminar_item(self):
        url = reverse('carrito-eliminar', kwargs={'pk': self.carrito.pk})
        response = self.client.post(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Carrito.objects.count(), 0)

    def test_ver_carrito(self):
        url = reverse('carrito-ver')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['total'], 1000)
        self.assertEqual(len(response.data['carrito']), 1)

    def test_checkout(self):
        url = reverse('carrito-checkout')
        response = self.client.post(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['total'], 1000)
        self.assertEqual(Carrito.objects.count(), 0)

# Explicación de las pruebas
#Configuración inicial (setUp):

#Creamos un objeto Destinos y un objeto Carrito antes de cada prueba.
#Prueba para agregar un ítem al carrito (test_agregar_item):

#Enviamos una solicitud POST al endpoint agregar y verificamos que la cantidad del ítem en el carrito aumenta.
#Prueba para eliminar un ítem del carrito (test_eliminar_item):

#Enviamos una solicitud POST al endpoint eliminar y verificamos que el ítem es eliminado del carrito.
#Prueba para ver el carrito (test_ver_carrito):

#Enviamos una solicitud GET al endpoint ver y verificamos que el total y los ítems del carrito son correctos.
#Prueba para el checkout (test_checkout):

#Enviamos una solicitud POST al endpoint checkout y verificamos que el total es calculado correctamente y el carrito es vaciado.