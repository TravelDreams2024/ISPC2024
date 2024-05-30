#URLS PARA API REST
from rest_framework import routers
from DreamTravelapp import views
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import DestinosViewSet


#Creamos la ruta
router = routers.DefaultRouter()
router.register(r'destinos',views.DestinosViewSet)

#URLS
urlpatterns = [
    #path('', include(router.urls)),
    path('api/v1/', include(router.urls)),
]
