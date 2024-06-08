from django.contrib.auth import authenticate
from rest_framework import serializers
from .models import Destinos, Rol, Nosotros, Usuarios,Carrito ,MetodoPago
from django.contrib.auth.models import User
from rest_framework.validators import UniqueValidator
from rest_framework import serializers
from django.contrib.auth.password_validation import validate_password



class MetodoPagoSerializer(serializers.ModelSerializer):
    class Meta:
        model = MetodoPago
        fields = '__all__'

class DestinosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Destinos
        fields = '__all__'

class CarritoSerializer(serializers.ModelSerializer):
    id_destino = serializers.PrimaryKeyRelatedField(queryset=Destinos.objects.all())
    id_metodoPago = serializers.PrimaryKeyRelatedField(queryset=MetodoPago.objects.all())
    user = serializers.ReadOnlyField(source='user.id')

    class Meta:
        model = Carrito
        fields = '__all__'

class RolesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rol
        fields = '__all__'

class NosotrosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nosotros
        fields = '__all__'

class UsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuarios
        fields = '__all__'


class RegisterSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email', 'password', 'password2']
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def save(self):
        user = User(
            email=self.validated_data['email'],
            first_name=self.validated_data['first_name'],
            last_name=self.validated_data['last_name']
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']

        if password != password2:
            raise serializers.ValidationError({'password': 'Las contraseñas deben coincidir.'})
        
        user.set_password(password)
        user.save()
        return user

class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()

    def validate(self, attrs):
        email = attrs.get('email')
        password = attrs.get('password')

        # Autenticación basada en email
        user = authenticate(username=email, password=password)
        if not user:
            raise serializers.ValidationError('Credenciales inválidas')
        attrs['user'] = user
        return attrs
    
    