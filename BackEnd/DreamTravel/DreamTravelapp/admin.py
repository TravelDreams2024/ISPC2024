from django.contrib import admin

#Importo los modelos
from .models import Usuarios
from .models import Destinos
from .models import Categorias
from .models import MetodoPago


#Registro los modelos
class UsuariosAdmin(admin.ModelAdmin):
    list_display = ( 'nombre_usuario', 'apellido_usuario', 'direccion', 'dni', 'telefono', 'mail',)
    
class DestinosAdmin(admin.ModelAdmin):
    list_display = ('id_destino', 'nombre_Destino', 'descripcion','precio_Destino', 'fecha_salida', 'cantidad_Disponible', 'image',)

class CategoriasAdmin(admin.ModelAdmin):
    list_display = ('id_categoria','nombreCategoria',)


class MetodoPagoAdmin(admin.ModelAdmin):
    list_display = ('id_metodoPago','nombrePago',)
    

admin.site.register(Usuarios, UsuariosAdmin)
admin.site.register(Destinos, DestinosAdmin)
admin.site.register(Categorias, CategoriasAdmin)
admin.site.register(MetodoPago, MetodoPagoAdmin)