from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Destinos, Usuarios
from .serializer import DestinosSerializer, UsuariosSerializer

# Api Destinos
class DestinosViewSet(viewsets.ModelViewSet):
    queryset = Destinos.objects.all()
    serializer_class = DestinosSerializer


@api_view(['GET', 'POST'])
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

@api_view(['GET','PUT','DELETE'])
def user_detail_api_view(request, pk=None):
    usuario = Usuarios.objects.filter(id_usuario=pk).first()
    
    if usuario:
            
            if request.method == 'GET':
                usuario_serializer = UsuariosSerializer(usuario)
                return Response(usuario_serializer.data, status=status.HTTP_200_OK)
            
            elif request.method =='PUT':
                usuario = Usuarios.objects.filter(id_usuario=pk).first()
                usuario_serializer = UsuariosSerializer(usuario,data = request.data)
                if usuario_serializer.is_valid():
                    usuario_serializer.save()
                    return Response(usuario_serializer.data, status=status.HTTP_200_OK)
                return Response(usuario_serializer.errors, status=status.HTTP_404_NOT_FOUND)
            
            elif request.method =='DELETE':
                usuario = Usuarios.objects.filter(id_usuario=pk).first()
                usuario.delete()
                return Response({'message':'Usuario eliminado correctamente'}, status=status.HTTP_200_OK)
    
    return Response({'message':'No se ha encontrado un usuario con estos datos'}, status=status.HTTP_404_NOT_FOUND)