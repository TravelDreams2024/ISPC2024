from rest_framework import viewsets
from .models import Destinos, Rol, Nosotros
from .serializer import DestinosSerializer, RolesSerializer, NosotrosSerializer


#Vista de Api Destinos
class DestinosViewSet(viewsets.ModelViewSet):
    queryset = Destinos.objects.all()
    serializer_class = DestinosSerializer
   
#Vista de Api Roles  
class RolViewSet(viewsets.ModelViewSet):
    queryset = Rol.objects.all()
    serializer_class = RolesSerializer


#Vista de Api Nosotros
class NosotrosViewSet(viewsets.ModelViewSet):
    queryset = Nosotros.objects.all()
    serializer_class = NosotrosSerializer