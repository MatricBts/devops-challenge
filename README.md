<h1>:repeat: Devops Challenger</h1>

<h2>Projeto que efetua o deploy de uma aplicação de calculadora no S3 da AWS utilizando terraform como IaC.</h2>

<h2>Fluxograma</h2>
![baixados](https://user-images.githubusercontent.com/55266551/220245162-af536577-2497-40f8-8bb6-3d0ae7061abc.png)

<h2>:computer: Tecnologias Utilizadas<h2>
<ul>
    <li>Node.js</li>
    <li>Terraform</li>
    <li>S3 - AWS</li>
    
</ul>


<h2>:recycle: Atualizando o submodulo do projeto calculator </h2>
<li>Devemos inicialmente clonar um projeto de terceiro para o nosso projeto</li>

```  
git submodule init      
```

```  
git submodule update
```


<h2>:hammer: Criando build do projeto</h2>
<h3>Entre na pasta calculator e rode os comandos a baixo</h3>

<li>Para instalar dependências do projeto:</li>
    
```  
npm install
```
    
<li>Para iniciar o build do projeto:</li>
    
```  
npm build
```  
    
<h2>:rocket: Deploy s3</h2>
<li>Utilizaremos os arquivos terraform para efetuar o deploy</li>
<li>Antes de tudo você deve fazer o login na sua conta AWS, pode ser fiz aws cli ou preenchendo o provider, ambos você irá precisar da sua Access Key e Secret Key depois entre na pasta IaC e execute os comandos a baixo</li>


<h3>Comandos terraform:</h3>
<li>Inicie os arquivos terraform:</li>
    
```  
terraform init
```
    
<li>Execute os arquivos terraform:</li>
    
```  
terraform apply --auto-approve
``` 

