from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import DestinosViewSet, RolViewSet, NosotrosViewSet, CarritoViewSet, user_api_view, user_detail_api_view, LoginView, RegisterView, token_refresh

router = DefaultRouter()
router.register(r'destinos', DestinosViewSet)
router.register(r'roles', RolViewSet)
router.register(r'nosotros', NosotrosViewSet)
router.register(r'carrito', CarritoViewSet)

urlpatterns = [
    path('usuarios/', user_api_view, name='usuarios_api'),
    path('usuarios/<int:pk>/', user_detail_api_view, name='usuarios_detail_api_view'),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('token/refresh/', token_refresh, name='token_refresh'),
    path('', include(router.urls)),
]