from rest_framework import routers
from django.urls import path, include
from .views import DestinosViewSet, user_api_view, user_detail_api_view

router = routers.DefaultRouter()
router.register(r'destinos', DestinosViewSet)

urlpatterns = [
    path('usuarios/', user_api_view, name='usuarios_api'),                              # http://127.0.0.1:8000/api/v1/usuarios/
    path('usuarios/<int:pk>/', user_detail_api_view, name='usuarios_detail_api_view'),  # http://127.0.0.1:8000/api/v1/usuarios/1/
    path('', include(router.urls)),
]