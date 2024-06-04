#URLS PARA API REST
from rest_framework import routers
from DreamTravelapp import views
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import DestinosViewSet, RolViewSet, NosotrosViewSet




#Creamos la rutas
router = routers.DefaultRouter()
router.register(r'destinos',views.DestinosViewSet)
router.register(r'roles',views.RolViewSet)
router.register(r'nosotros',views.NosotrosViewSet)


#URLS
urlpatterns = [
    path('', include(router.urls)),
]
