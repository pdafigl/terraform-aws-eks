# Objetivo de este apartado

Recoge el código necesario para crear un repositorio de imágenes de contenedores bajo ECR. Para ello, con la creación del primer repositorio, por defecto, AWS crea un registry privado. 
Se le asignarán policies de IAM tanto a registry como a repositorio y se marcarán políticas de ciclo de vida para las imágenes contenidas en el repositorio.

# Componentes que se crean en este punto:

- Un repositorio de ECR, con policies de IAM y de ciclo de vida para las imágenes registradas en el repositorio.
- Una asignación de policy IMA al registry que se crea.AM para API al que se le aplicará la policy creada, para usarlo en las tareas de gestión del bucket y la tabla DynamoDB.

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

Usaremos la configuración del archivo **~/.aws/credentials** definido ya para anteriores componentes desplegados. Se lanzará el comando para inicialiar el entorno para el despliegue, haciendo que se descarguen todas las librerías necesarias para los distintos providers utilizados, para las módulos y recursos, etc. El comando a lanzar:

```bash
terraform init
```
Para crear el plan de ejecución y hacerlo sobre un archivo .out que se usará después para realizar el despliegue, se lanzará:
```bash
terraform plan -out archivo.out
```
Una vez se dispone del plan de ejecución, se lanza el despliegue:
```bash
terraform apply archivo.out
```
Al finalizar el despliegue, se mostrarán una serie de salidas por pantalla, asociadas a los outputs definidos en el archivo output.tf: 
```bash
terraform_ecr_repository_dev_arn = "arn:aws:ecr:eu-west-1:XXXXXXXXXXXX:repository/dev"
terraform_ecr_repository_dev_id = "XXXXXXXXXXXX"
terraform_ecr_repository_dev_url = "XXXXXXXXXXXX.dkr.ecr.eu-west-1.amazonaws.com/dev"
``` 


