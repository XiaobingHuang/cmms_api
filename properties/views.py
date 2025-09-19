from django.shortcuts import render

from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Property
from .serializers import PropertySerializer

@api_view(["GET"])
def property_list(request):
    properties = Property.objects.all()
    serializer = PropertySerializer(properties, many=True)
    return Response(serializer.data)
