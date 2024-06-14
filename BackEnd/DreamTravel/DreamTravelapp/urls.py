from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import DestinosViewSet,MetodoPagoViewSet, RolViewSet, NosotrosViewSet, CarritoViewSet, checkout, obtener_usuario_autenticado,user_api_view, user_detail_api_view, LoginView, RegisterView, token_refresh,agregar_al_carrito, obtener_carrito, eliminar_item_carrito,actualizar_fecha_salida

router = DefaultRouter()
router.register(r'destinos', DestinosViewSet)
router.register(r'roles', RolViewSet)
router.register(r'nosotros', NosotrosViewSet)
router.register(r'carrito', CarritoViewSet, basename='carrito') 
router.register(r'metodos-pago', MetodoPagoViewSet)  

urlpatterns = [
    path('usuarios/', user_api_view, name='usuarios_api'),
    path('user/me/', obtener_usuario_autenticado, name='obtener_usuario_autenticado'),
    path('usuarios/<int:pk>/', user_detail_api_view, name='usuarios_detail_api_view'),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('token/refresh/', token_refresh, name='token_refresh'),
    path('agregar-al-carrito/', agregar_al_carrito, name='agregar-al-carrito'),
    path('eliminar-item-carrito/<int:id>/', eliminar_item_carrito, name='eliminar-item-carrito'),
    path('carrito/', obtener_carrito, name='obtener_carrito'),
    path('carrito/<int:pk>/actualizar_cantidad/', CarritoViewSet.as_view({'put': 'actualizar_cantidad'}), name='actualizar_cantidad'),
    path('carrito/<int:id>/actualizar_fecha/', actualizar_fecha_salida, name='actualizar_fecha_salida'),
    path('checkout/', checkout, name='checkout'),
    path('', include(router.urls)),
]