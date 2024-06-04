from DreamTravelapp.models import Rol


def inicializar_roles():
    #Creamos los roles
    Rol.objects.get_or_create(nombre_rol=Rol.ADMINISTRADOR)
    Rol.objects.get_or_create(nombre_rol=Rol.USUARIO)
    Rol.objects.get_or_create(nombre_rol=Rol.FULL_STACK)


# Llama a la función para inicializar los roles
if _name_ == "_main_":
    inicializar_roles()