from django_seed import Seed
import random

import django
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "care_backend.settings")
django.setup()

seeder = Seed.seeder()

from api.models import User, Vehicle
seeder.add_entity(User, 75)
seeder.add_entity(Vehicle, 50)
inserted_pks = seeder.execute()

seeder.add_entity(Vehicle, 50, {
    'owner':    lambda x: random.randint(1,75),
    'plate': lambda x: seeder.faker.name(),
    'year': lambda x: random.randint(1950, 2020),
})
seeder.execute()

# TAMBIEN EXISTE
'''
lambda x: seeder.faker.name(),
lambda x: seeder.faker.email(), ESTE POR ALGUNA EXTRAÑA RAZÓN NO ME FUNCIONABA
lambda x: seeder.faker.date(),
lambda x: seeder.faker.word(),
lambda x: random.randint(1,10),

QUISE POBLAR CADA CAMPO CON EL TIPO DE DATO PRECISO PERO NO PUDE xd
DEBIDO A VARIOS ERRORES QUE TUVE, LO HICE DE LA SIGUIENTE MANERA


PARA POBLAR LA BASE DE DATOS 
 1. EN LA TERMINAL EJECUTAR: python mySeed.py
 2. EN LA TERMINAL EJECUTAR: python manage.py seed api --number=40 (O CUALQUIER OTRO NUMERO)

EN 1. ME CERCIORO DE QUE EL USER EXISTA PRIMERO QUE CUALQUIER OTRO MODELO DEBIDO A QUE EL PK ES FK DE LOS DEMAS MODELOS
EN 2. CREO DATOS PARA LOS DEMAS MODELOS. PUEDE QUE SALGA ERROR POR VIOLAR LA REGLA DE UNIQUE, ESTO YA ES AL AZAR.
'''

