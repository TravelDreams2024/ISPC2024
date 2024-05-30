from django.shortcuts import render
from .models import Destinos
from .serializer import DestinosSerializer
from rest_framework import viewsets

#Api Destinos
class DestinosViewSet(viewsets.ModelViewSet):
    queryset = Destinos.objects.all()
    serializer_class = DestinosSerializer
    
    def perform_create(self, serializer):
        serializer.save()
        
