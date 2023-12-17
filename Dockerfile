# Use a imagem oficial do Ruby 2.7 como base
FROM ruby:2.7.6

# Instale as dependências do sistema
RUN apt-get update && apt-get install -y nodejs npm sqlite3

# Instalando yarn
RUN npm i --global yarn 

RUN useradd -ms /bin/bash devcontainer
USER devcontainer

RUN mkdir -p /home/devcontainer/app
RUN chown -R devcontainer:devcontainer /home/devcontainer/app

# Diretório de trabalho
WORKDIR /home/devcontainer/app

# Copie o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock /home/devcontainer/app/

# Instalar as gems
RUN bundle install    

# Copier o restante do aplicativo para o contêiner
COPY . /home/devcontainer/app/

# Instale dependências javascript
# RUN yarn install

# Exponha a porta 3000 para a aplicação Rails
EXPOSE 3000

# Inicialize o aplicativo Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
