![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

# Depot

Este projeto foi desenvolvido em paralelo à leitura do livro *Agile Web Development with Rails 5.1*. **Depot** é uma aplicação web que simula uma loja virtual, incorporando os conceitos e práticas ágeis aprendidos durante o processo de desenvolvimento.

<br>

## ⚙️ Funcionalidades

**Sistema de Login**: O usuário administrativo podem criar contas, fazer login e ter acesso a todos recursos administrativos da loja.

**Administração de Produtos**: Uma interface de administração permite a fácil gestão de produtos, facilitando a adição, edição e remoção de itens do catálogo.

**Gestão de Pedidos**: O sistema inclui funcionalidades para o gerenciamento de pedidos.

**Controle de Usuários**: O administrador tem o poder de gerenciar contas de usuários, garantindo uma administração eficaz e segura.

<br>

## 🐳 Como executar o projeto

Para executar o projeto sem precisar de nenhuma configuração especial, basta ter o Docker instalado em seu sistema. Em seguida, execute os seguintes comandos:

```bash
# Clone este repositório
$ https://github.com/paulohmoreira/depot.git

# Acesse a pasta do projeto no seu terminal/cmd
$ cd depot

# Construa e execute o contêiner Docker:
$ docker-compose up --build

# Acesse a aplicação http://localhost:3000
```

Se você utiliza a IDE VSCode, pode simplificar ainda mais seu fluxo de desenvolvimento utilizando a extensão DevContainer. Siga os passos abaixo:

1. **Instale a Extensão DevContainer:**
Certifique-se de ter a extensão DevContainer instalada no seu VSCode.

2. **Reabra o Projeto no VSCode:**
Abra o Visual Studio Code e navegue até o diretório do projeto.

3. **Identificação Automática do DevContainer:**
O VSCode identificará automaticamente o arquivo de configuração do DevContainer no seu projeto e exibirá um popup informando:
*Folder contains a Dev Container configuration file. Reopen folder to develop in a container.*

4. **Reabra o Projeto no Container:**
Clique em **Reopen in Container** no popup e aguarde o build ser concluído.

5. **Acesse a Aplicação:**
Abra o navegador e acesse http://localhost:3000 para explorar a aplicação.

<br>

## 🧑‍💻 Acessando aplicação

Para acessar a área administrativa do Depot, é necessário fazer login primeiro. Siga os passos abaixo:

1. Abra o navegador e acesse `http://localhost:3000/login`.

2. Faça o Login:
   - Se você seguiu o passo anterior em *Como Executar o Projeto*, um usuário administrativo foi gerado automaticamente nos bastidores.
   - Utilize as seguintes credenciais:
     - **Username:** admin
     - **Password:** 123456

3. Após fazer o login, você terá acesso à área administrativa pelo menu lateral ou diretamente pelos seguintes links:
   - **Pedidos:** [http://localhost:3000/orders](http://localhost:3000/orders)
   - **Produtos:** [http://localhost:3000/products](http://localhost:3000/products)
   - **Usuários:** [http://localhost:3000/users](http://localhost:3000/users)


<br>

## 🐛 Contribuições e Problemas
Contribuições são bem-vindas! Se você identificar problemas ou quiser melhorar a aplicação, sinta-se à vontade para abrir uma issue ou enviar um *pull request*.
