import pandas as pd
from sqlalchemy import create_engine


columnas_bbdd = {
    # BBDD MySQL                ARCHIVO CSV
    'consecutivo' :             'consecutivo', 
    'año' :                     'anio', 
    'cod_eas' :                 'cod_eas', 
    'tipo_usuario' :            'cod_tipo_usuario', 
    'cod_ips' :                 'cod_ips', 
    'cod_municipio' :           'cod_municipio', 
    'cod_departamento' :        'cod_departamento', 
    'causa_externa' :           'cod_causa_externa', 
    'cod_dx_ppal_egreso' :      'cod_dx_ppal_externo', 
    'tipo_edad' :               'cod_tipo_edad', 
    'edad' :                    'edad', 
    'sexo' :                    'sexo', 
    'zona' :                    'zona', 
    'servicio' :                'servicio', 
    'total_atenciones' :        'total_atenciones'
    }

# leer el csv
hosp_csv = pd.read_csv('./hospitalizacion.csv', delimiter=';')

# renombrar columnas de acuerdo a la bbdd
hosp_csv = hosp_csv.rename(columns=columnas_bbdd)

# eliminar las columnas que no necesito
hosp_csv = hosp_csv[columnas_bbdd.values()] 

# eliminar espacios de las columnas 
hosp_csv['cod_eas'] = hosp_csv[['cod_eas']].apply(lambda x: x.str.strip()) 
hosp_csv['cod_dx_ppal_externo'] = hosp_csv[['cod_dx_ppal_externo']].apply(lambda x: x.str.strip())
hosp_csv['sexo'] = hosp_csv[['sexo']].apply(lambda x: x.str.strip())                                   
hosp_csv['zona'] = hosp_csv[['zona']].apply(lambda x: x.str.strip())

# cargar la información a bbdd
engine = create_engine('mysql://', echo=False)
hosp_csv.to_sql('atencion', con=engine)


# guardo un nuevo csv para cargar a la bbdd
hosp_csv.to_csv('hospitalizacion_mod.csv', index=False)