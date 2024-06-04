from rest_framework import routers
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from DreamTravelapp import views
from .views import DestinosViewSet, RolViewSet, NosotrosViewSet
from .views import DestinosViewSet, user_api_view, user_detail_api_view, token_refresh,LoginView , RegisterView



#Creamos la rutas
router = routers.DefaultRouter()
router.register(r'destinos',views.DestinosViewSet)
router.register(r'roles',views.RolViewSet)
router.register(r'nosotros',views.NosotrosViewSet)


urlpatterns = [
    path('usuarios/', user_api_view, name='usuarios_api'),                              # http://127.0.0.1:8000/api/v1/usuarios/
    path('usuarios/<int:pk>/', user_detail_api_view, name='usuarios_detail_api_view'),  # http://127.0.0.1:8000/api/v1/usuarios/1/
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),                                   # http://127.0.0.1:8000/api/v1/login/
    path('token/refresh/', token_refresh, name='token_refresh'),                         # Agrega la URL para la vista de refresco de token
    path('', include(router.urls)),
]
router = routers.DefaultRouter()
router.register(r'destinos', DestinosViewSet)





