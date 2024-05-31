from rest_framework import serializers


#SERIALIZER PARA API REST
from .models import Destinos
from .models import Usuarios
#Api Rest Destinos
class DestinosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Destinos
        fields = ('id_destino', 'nombre_Destino', 'descripcion', 'image', 'precio_Destino', 'fecha_salida', 'cantidad_Disponible', 'id_metodoPago', 'id_categoria')

class UsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuarios
        fields = ('id_usuario', 'nombre_usuario', 'apellido_usuario', 'passw', 'direccion', 'dni', 'telefono', 'mail', 'id_metodoPago', 'id_rol')
