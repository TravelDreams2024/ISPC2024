from rest_framework import serializers
from .models import Destinos

#SERIALIZER PARA API REST

#Api Rest Destinos
class DestinosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Destinos
        fields = ('id_destino', 'nombre_Destino', 'descripcion', 'image', 'precio_Destino', 'fecha_salida', 'cantidad_Disponible', 'id_metodoPago', 'id_categoria')
