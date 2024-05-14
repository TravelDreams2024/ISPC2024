from django.db import models

from django.core.validators import MinLengthValidator, MaxLengthValidator
from django.core.exceptions import ValidationError
    

#Clase de la obra social del usuario
class ObraSocial(models.Model):
    id_obraSocial = models.AutoField(primary_key=True)
    nombreObraSocial = models.CharField(max_length=100)
    class Meta:
        db_table = 'obra_social'
        verbose_name = 'Obras Sociale'
        verbose_name_plural = 'Obras Sociales'
    def __str__(self):
        return self.nombreObraSocial
    def __unicode__(self):
        return self.nombreObraSocial
    
   
#Metodo de pago del usuario 
class MetodoPago(models.Model):
    id_metodoPago = models.AutoField(primary_key=True)
    nombrePago = models.CharField(max_length=100)
    class Meta:
        db_table = 'metodo_pago'
        verbose_name = 'Metodos De Pago'
        verbose_name_plural = 'Metodos de pagos'
    def __str__(self):
        return self.nombrePago
    def __unicode__(self):
        return self.nombrePago
    
#Categorias de los viajes
class Categorias(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nombreCategoria = models.CharField(max_length=150)
    class Meta:
        db_table = 'categorias'
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'
    def __str__(self):
        return self.nombreCategoria
    def __unicode__(self):
        return self.nombreCategoria
    
#Nombre de la aerolinea
class Aerolinea(models.Model):
    id_aerolinea = models.AutoField(primary_key=True)
    nombreAerolinea = models.CharField(max_length=100)
    class Meta:
        db_table = 'aerolinea'
        verbose_name = 'Aerolinea'
        verbose_name_plural = 'Aerolineas'
    def __str__(self):
        return self.nombreAerolinea
    def __unicode__(self):
        return self.nombreAerolinea
    
#Localidad del usuario
class Localidad(models.Model):
    id_localidad = models.AutoField(primary_key=True)
    nombreLocalidad = models.CharField(max_length=150)
    class Meta:
        db_table = 'localidad'
        verbose_name = 'Localidade'
        verbose_name_plural = 'Localidades'
    def __str__(self):
        return self.nombreLocalidad
    def __unicode__(self):
        return self.nombreLocalidad
 
#Clase de usuario   
class Usuarios(models.Model):
    
    id_usuario = models.AutoField(primary_key=True)
    nombre_usuario = models.CharField(max_length=100)
    apellido_usuario = models.CharField(max_length=100)
    passw = models.CharField(max_length=100)
    direccion = models.CharField(max_length=100)
    dni = models.CharField(max_length=8, validators=[MinLengthValidator(7), MaxLengthValidator(8)])
    telefono = models.CharField(max_length=50)
    mail = models.EmailField(unique=True)
    id_localidad = models.ForeignKey(Localidad, db_column="id_localidad", on_delete=models.CASCADE)
    id_metodoPago = models.ForeignKey(MetodoPago, db_column='id_metodoPago', on_delete=models.CASCADE,)
    id_obraSocial = models.ForeignKey(ObraSocial, db_column='id_obraSocial', on_delete=models.CASCADE)
    class Meta:
        db_table = 'usuario'
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
    def __str__(self):
        return f'{self.nombre_usuario} {self.apellido_usuario}'
    def __unicode__(self):
        return f'{self.nombre_usuario} {self.apellido_usuario}'
    
#Destinos de viaje
#Agregamos un validador de precio
def positive_price_validator(value):
    if value < 0:
        raise ValidationError('El precio debe ser un valor positivo.')
#Agregamos un validador de stock de viajes
def positive_viaje_validator(value):
    if value < 0:
        raise ValidationError('El stock del viaje debe ser igual a 0, o un valor positivo.')
    
class Destinos(models.Model):
    id_destino = models.AutoField(primary_key=True)
    nombreDestino = models.CharField(max_length=150)
    precioDestino = models.DecimalField(max_digits=12, decimal_places=2, validators=[positive_price_validator])
    fecha_salida = models.DateTimeField(blank=False)
    cantidadDisponible = models.IntegerField(default=12, validators=[positive_viaje_validator])
    id_aerolinea = models.ForeignKey(Aerolinea, db_column='id_aerolinea', on_delete=models.CASCADE)
    id_metodoPago = models.ForeignKey(MetodoPago, db_column='id_metodoPago', on_delete=models.CASCADE)
    id_categoria = models.ForeignKey(Categorias, db_column='id_categoria', on_delete=models.CASCADE)
    class Meta:
        db_table = 'destinos'
        verbose_name = 'Destino'
        verbose_name_plural = 'Destinos'
    def __str__(self):
        return self.nombreDestino
    def __unicode__(self):
        return self.nombreDestino
    