from rest_framework import viewsets, generics
from rest_framework.response import Response
from rest_framework import status
from .models import Destinos, Carrito, Rol, Nosotros, Usuarios ,MetodoPago
from .serializer import DestinosSerializer, CarritoSerializer, RolesSerializer, NosotrosSerializer, UsuariosSerializer, RegisterSerializer, LoginSerializer
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.models import User



class DestinosViewSet(viewsets.ModelViewSet):
    queryset = Destinos.objects.all()
    serializer_class = DestinosSerializer
    
class CarritoViewSet(viewsets.ModelViewSet):
    queryset = Carrito.objects.all()
    serializer_class = CarritoSerializer

@api_view(['POST'])
def agregar_al_carrito(request):
    try:
        id_destino = request.data.get('id_destino')
        id_metodoPago = request.data.get('id_metodoPago')
        
        if not id_destino or not id_metodoPago:
            return Response({'error': 'id_destino and id_metodoPago are required'}, status=status.HTTP_400_BAD_REQUEST)
        
        destino = Destinos.objects.get(pk=id_destino)
        metodoPago = MetodoPago.objects.get(pk=id_metodoPago)
        
        carrito_item, created = Carrito.objects.get_or_create(
            user=request.user,
            id_destino=destino,
            id_metodoPago=metodoPago,
            defaults={'cantidad': 1}
        )
        if not created:
            carrito_item.cantidad += 1
            carrito_item.save()
        
        serializer = CarritoSerializer(carrito_item)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    except Destinos.DoesNotExist:
        return Response({'error': 'Destino not found'}, status=status.HTTP_404_NOT_FOUND)
    except MetodoPago.DoesNotExist:
        return Response({'error': 'MetodoPago not found'}, status=status.HTTP_404_NOT_FOUND)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def obtener_carrito(request):
    try:
        carrito_items = Carrito.objects.filter(user=request.user)
        serializer = CarritoSerializer(carrito_items, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['DELETE'])
def eliminar_item_carrito(request, id):
    try:
        carrito_item = Carrito.objects.get(pk=id, user=request.user)
        carrito_item.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    except Carrito.DoesNotExist:
        return Response({'error': 'Carrito item not found'}, status=status.HTTP_404_NOT_FOUND)
    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

##############################

class RolViewSet(viewsets.ModelViewSet):
    queryset = Rol.objects.all()
    serializer_class = RolesSerializer

class NosotrosViewSet(viewsets.ModelViewSet):
    queryset = Nosotros.objects.all()
    serializer_class = NosotrosSerializer
    
 #Usuarios 
    
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