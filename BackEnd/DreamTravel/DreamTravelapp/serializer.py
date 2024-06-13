from django.contrib.auth import authenticate
from rest_framework import serializers
from .models import Destinos, Rol, Nosotros, Usuarios,Carrito ,MetodoPago
from django.contrib.auth.models import User
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
    
    def validate(self, data):
        return data
class CarritoSerializer(serializers.ModelSerializer):
    id_destino = serializers.PrimaryKeyRelatedField(queryset=Destinos.objects.all())
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
            'password': {'write_only': True},
            'email': {'required': True},
        }
    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Las contraseñas no coinciden."})
        return attrs
    
    def create(self, validated_data):
            validated_data.pop('password2')
            user = User(
                username=validated_data['email'],  # Usar el correo electrónico como nombre de usuario
                email=validated_data['email'],
                first_name=validated_data['first_name'],
                last_name=validated_data['last_name'],
            )
            user.set_password(validated_data['password'])
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
    
    