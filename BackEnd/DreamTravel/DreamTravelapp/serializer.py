from rest_framework import serializers
from .models import Destinos, Rol, Nosotros


#SERIALIZER PARA API REST


#Api Rest Destinos
class DestinosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Destinos
        fields = ('id_destino', 'nombre_Destino', 'descripcion', 'image', 'precio_Destino', 'fecha_salida', 'cantidad_Disponible', 'id_metodoPago', 'id_categoria')


#Api de Roles
class RolesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rol
        fields = '__all__'
       
#Api de Nosotros
class NosotrosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nosotros
        fields = '__all__'

