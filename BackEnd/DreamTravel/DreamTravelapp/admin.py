from django.contrib import admin

#Importo los modelos
from .models import Usuarios
from .models import Destinos
from .models import Categorias
from .models import Aerolinea
from .models import MetodoPago
from DreamTravelapp .models import Localidad
from .models import ObraSocial

#Registro los modelos
class UsuariosAdmin(admin.ModelAdmin):
    list_display = ( 'nombre_usuario', 'apellido_usuario', 'direccion', 'dni', 'telefono', 'mail',)
    
class DestinosAdmin(admin.ModelAdmin):
    list_display = ('nombreDestino', 'precioDestino', 'fecha_salida', 'cantidadDisponible',)

class AerolineaAdmin(admin.ModelAdmin):
    list_display = ('nombreAerolinea',)

class CategoriasAdmin(admin.ModelAdmin):
    list_display = ('nombreCategoria',)

class LocalidadAdmin(admin.ModelAdmin):
    list_display = ('nombreLocalidad',)

class MetodoPagoAdmin(admin.ModelAdmin):
    list_display = ('nombrePago',)
    
class ObraSocialAdmin(admin.ModelAdmin):
    list_display = ('nombreObraSocial',)


admin.site.register(Usuarios, UsuariosAdmin)
admin.site.register(Destinos, DestinosAdmin)
admin.site.register(Categorias, CategoriasAdmin)
admin.site.register(Aerolinea, AerolineaAdmin)
admin.site.register(MetodoPago, MetodoPagoAdmin)
admin.site.register(Localidad, LocalidadAdmin)
admin.site.register(ObraSocial, ObraSocialAdmin)