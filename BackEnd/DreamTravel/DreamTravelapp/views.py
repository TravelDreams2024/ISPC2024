from rest_framework import viewsets, generics
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from .models import Destinos, Carrito, Rol, Nosotros, Usuarios
from .serializer import DestinosSerializer, CarritoSerializer, RolesSerializer, NosotrosSerializer, UsuariosSerializer, RegisterSerializer, LoginSerializer
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.models import User
from django.contrib.auth import authenticate

class DestinosViewSet(viewsets.ModelViewSet):
    queryset = Destinos.objects.all()
    serializer_class = DestinosSerializer

class CarritoViewSet(viewsets.ModelViewSet):
    queryset = Carrito.objects.all()
    serializer_class = CarritoSerializer

    @action(detail=True, methods=['post'])
    def agregar(self, request, pk=None):
        destino = Destinos.objects.get(pk=pk)
        carrito, created = Carrito.objects.get_or_create(
            id_destino=destino,
            defaults={'cantidad': 1, 'id_metodoPago': destino.id_metodoPago}
        )
        if not created:
            carrito.cantidad += 1
            carrito.save()
        return Response(CarritoSerializer(carrito).data)

    @action(detail=True, methods=['post'])
    def eliminar(self, request, pk=None):
        item = Carrito.objects.get(pk=pk)
        item.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(detail=False, methods=['get'])
    def ver(self, request):
        carrito_items = Carrito.objects.all()
        total = sum(item.id_destino.precio_Destino * item.cantidad for item in carrito_items)
        return Response({
            'carrito': CarritoSerializer(carrito_items, many=True).data,
            'total': total
        })

    @action(detail=False, methods=['post'])
    def checkout(self, request):
        carrito_items = Carrito.objects.all()
        total = sum(item.id_destino.precio_Destino * item.cantidad for item in carrito_items)
        carrito_items.delete()
        return Response({'message': 'Checkout successful', 'total': total})

class RolViewSet(viewsets.ModelViewSet):
    queryset = Rol.objects.all()
    serializer_class = RolesSerializer

class NosotrosViewSet(viewsets.ModelViewSet):
    queryset = Nosotros.objects.all()
    serializer_class = NosotrosSerializer
    
@api_view(['GET', 'POST'])
@permission_classes([IsAuthenticated])
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
@permission_classes([IsAuthenticated])
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
        user = serializer.validated_data['user']
        refresh = RefreshToken.for_user(user)
        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
        })

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def token_refresh(request):
    serializer = TokenRefreshView().get_serializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    return Response(serializer.validated_data, status=status.HTTP_200_OK)