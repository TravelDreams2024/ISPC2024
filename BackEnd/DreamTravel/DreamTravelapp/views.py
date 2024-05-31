from rest_framework import viewsets
from .models import Destinos
from .serializer import DestinosSerializer

#Api Destinos
class DestinosViewSet(viewsets.ModelViewSet):
    queryset = Destinos.objects.all()
    serializer_class = DestinosSerializer
    
