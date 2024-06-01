from rest_framework import status , viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated  # Importa el permiso de autenticación
from .models import Destinos, Usuarios
from .serializer import DestinosSerializer, UsuariosSerializer
from rest_framework import generics
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.models import User
from .serializer import RegisterSerializer, LoginSerializer
from django.contrib.auth import authenticate
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView




# Api Destinos
class DestinosViewSet(viewsets.ModelViewSet):
    queryset = Destinos.objects.all()
    serializer_class = DestinosSerializer


@api_view(['GET', 'POST'])
@permission_classes([IsAuthenticated])  # Asegura que solo usuarios autenticados puedan acceder
def user_api_view(request):
    if request.method == 'GET':
        usuarios = Usuarios.objects.all()
        usuarios_serializer = UsuariosSerializer(usuarios, many=True)
        return Response(usuarios_serializer.data, status=status.HTTP_200_OK)
    
    elif request.method == 'POST':
        usuario_serializer = UsuariosSerializer(data=request.data)
        if usuario_serializer.is_valid():
            usuario_serializer.save()
            return Response(usuario_serializer.data, status=status.HTTP_201_CREATED)
        return Response(usuario_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@permission_classes([IsAuthenticated])  # Asegura que solo usuarios autenticados puedan acceder
def user_detail_api_view(request, pk=None):
    usuario = Usuarios.objects.filter(id_usuario=pk).first()
    
    if usuario:
        
        if request.method == 'GET':
            usuario_serializer = UsuariosSerializer(usuario)
            return Response(usuario_serializer.data, status=status.HTTP_200_OK)
        
        elif request.method == 'PUT':
            usuario_serializer = UsuariosSerializer(usuario, data=request.data)
            if usuario_serializer.is_valid():
                usuario_serializer.save()
                return Response(usuario_serializer.data, status=status.HTTP_200_OK)
            return Response(usuario_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        elif request.method == 'DELETE':
            usuario.delete()
            return Response({'message': 'Usuario eliminado correctamente'}, status=status.HTTP_200_OK)
    
    return Response({'message': 'No se ha encontrado un usuario con estos datos'}, status=status.HTTP_404_NOT_FOUND)

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = RegisterSerializer

class LoginView(TokenObtainPairView):
    serializer_class = LoginSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = authenticate(username=serializer.data['username'], password=serializer.data['password'])

        if user is not None:
            refresh = RefreshToken.for_user(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
            })
        else:
            return Response({'error': 'Credenciales inválidas'}, status=status.HTTP_401_UNAUTHORIZED)

# Agrega el decorador @api_view y @permission_classes([IsAuthenticated]) para proteger la vista de refresco del token
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def token_refresh(request):
    serializer = TokenRefreshView().get_serializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    return Response(serializer.validated_data, status=status.HTTP_200_OK)