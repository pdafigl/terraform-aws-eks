# Objetivo de este apartado

Recoge el código necesario para crear una serie de usuarios que se utilizarán durante el despliegue del resto de infraestructura, así como para tareas posteriores. En concreto crea:
- Usuario admin de EKS, en este caso además, se le asigna la policy necesaria para disponer de los permisos necesarios.
- Usuario que se utilizará para gestionar las imágenes en ECR. En este caso no se asigna ninguna policy, solo lo crea, ya que las policies se crearán a partir de cada repositorio en eCr creado. De esta manera, será fácil el crear usuarios específicos para repositorios.
- El código para crear el usuario de ECR, permite crear usuarios de API en general, ya que no se le asigna ningún rol ni ninguna policy específica.
# Componentes que se crean en este punto:

- Usuario admin de EKS
- Usuario gestor de repositorio ECR.

# Contenido

En este apartado se incluyen los siguientes contenidos:
- **init.tf**: en este archivo se incluye el código de configuración del provider de AWS.
- **main.tf**: en este archivo se incluye el código que crea en sí la infraestructura, llamando a los módulos de **eks_user** y **iam_user**.
- **modules**: directorio en donde se incluyen las definiciones de los módulos de **eks_user** y **iam_user**.
  - **eks_user**: directorio que recoge los archivos para crear el usuario admin de EKS.
  - **iam_user**: directorio que recoge los archivos para crear usuarios de API.
- **output.tf**: incluye el código para los outputs del despliegue de esta parte de la infraestructura. Entre ellos están el **access_key** y **secret_key** de los usuarios IAM, para disponer de ellos y usarlos en otros puntos del despliegue.
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
terraform_ecr_user_access_key = <sensitive>
terraform_ecr_user_secret_key = <sensitive>
terraform_eks_user_access_key = <sensitive>
terraform_eks_user_secret_key = <sensitive>
``` 
En este caso, se trata de información sensible, de ahí que se muestre oculta, para poder ver esta información, se puede, para cada uno de los outputs, el comando:
```bash
terraform output -raw terraform_ecr_user_access_key
```
Bastaría con cambiar el nombre del output la que queramos consultar, para ver el valor de esa salida.



