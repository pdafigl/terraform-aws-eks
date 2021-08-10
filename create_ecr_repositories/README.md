# Objetivo de este apartado

Recoge el código necesario para crear un backend de Terraform sobre S3, par alamacenar los archivos de estado. Las ventajas de trabajar con este tipo de backend, en lugar de utilizar almacenamiento local, son:
- La posibilidad de permitir el trabajo colaborativo.
- Poder ejecutar acciones sobre la infraestructura desplegada, a través de Terraform, desde cualquier equipo.
- Poder usar el estado de un despliegue como datasource para otro, evitando el tener de replicar configuraciones en variables. Se verá un ejemplo de este uso en este proyecto, a la hora de desplegar un grupo de nodos gestionados por EKS.

# Componentes que se crean en este punto:

- Un bucket de S3.
- Una tabla en DynamoDB para controlo de bloqueo de objetos en el bucket para evitar que se escriba en el mismo archivo de estado de forma simultánea desde dos o más puntos distintos.
- Una policy IAM que permite trabajar tanto con el bucket, como con la tabla de DyanmoDB.
- Un usuario IAM para API al que se le aplicará la policy creada, para usarlo en las tareas de gestión del bucket y la tabla DynamoDB.

# Contenido

En este apartado se incluyen los siguientes contenidos:
- **init.tf**: en este archivo se incluye el código de configuración del provider de AWS, junto con la configuración del data source de create users, para utlizar la misma configuración regional.
- **main.tf**: en este archivo se incluye el código que crea en sí la infraestructura, llamando a los módulos de **repository** y **registry_policy**.
- **modules**: directorio en donde se incluyen las definiciones de los módulos de **repository** y **registry_policy**.
  - **repository**: directorio que recoge los archivos para crear un repositorio de imágenes dentro de ECR, y en donde se le asigna al mismo repositorio, una políctica de permisos de IAM y una política de ciclo de vida de imágenes registradas en el repositorio.
  - **registry_policy**: asigna políticasd e IAM el registry que se crea en la cuenta la primera vez que se crea un repositorio privado.
- **output.tf**: incluye el código para los outputs del despliegue de esta parte de la infraestructura. Entre ellos están el **código ARN del repositorio**, el **ID del repositorio** y la **URL del respositorio**.
- **terraform.tfvars**: incluye la asignación de valores para inputs (variables) del despliegue de la infraestructura.
- **variables.tf**: incluye la definición de inputs (o variables) que se usa en el despliegue de la infraestructura.

# Cómo lanzarlo

Nos ubicaremos en el directorio create_backend. Para este caso, las credenciales las paseremos como variables de entorno, con lo que se crearán dos variables de este tipo de la siguiente manera:

```bash
export TF_VAR_access_key=<access_key_usuario_principal>
export TF_VAR_secret_key=<secret_key_usuario_principal>
```
El usuario que se utilizará, es el usuario IAM que se cree antes de empezar a desplegar la infraestructura, se comenta en el README.md principal del repositorio, las características de este usuario.

Una vez creadas estas variables, se procede a lanzar la inicialización para Tertraform lanzando el siguiente comando:
```hcl
terraform init
```
Este comando descargará todas las librerías necesarias para el provider AWS y los módulos y recursos a utilizar.
Después de este paso, se elaborará el plan de ejecución y se volcará a una archivo **.out** para tenerlo de base para aplicar los cambios en el despliegue. Para ello se lanza:
```hcl
terraform plan -out archivo.out
```
Por último, se lanza el despliegue de la infraestructura y componentes con el cmando:
```hcl
terraform apply archivo.out
```
Al finalizar el despliegue se mostrarán las salidas de información definidas dentro del archivo **output.tf**. Para poder consultar estos valores, se podrá, accediendo al directorio create_backend, ejecutar el comando **terraform output**, para ver el todos los outputs definidos o **terraform output nombre_output_concreto** para oebtener el valor para uno de los outputs en concreto, en lugar de todos. Por ejemplo:
```hcl
terraform output
terraform output bucket_arn
```


