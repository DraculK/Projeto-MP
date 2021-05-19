# Projeto MP
Repositório feito para resolver o projeto final da disciplina Métodos de Programação que tinha como requisito a elaboração de sistema de questionários com usuários respondentes, criadores de questionário, usuários anônimos (que não precisam fazer login na plataforma) e um administrador para gerir o mesmo.

## Observação importante

Neste projeto, a ideia inicial era criar um projeto em rails api + react, porém devido à alguns problemas enfrentados pelos membros do grupo, optamos por migrar de última hora para rails full stack. Portanto, os diretórios _back-mp_ e _front-mp_ são referentes às primeiras versões do projeto e podem ser desconsiderados para efeito de correção ou posterior consulta por quem quer que se interesse; e o diretório _final-mp_ refere-se à versão final apresentada, já em rails full stack, ao professor em sala de aula. 

## Pré-requisitos

Nessa seção iremos passar as instruções passo a passo para a instalação dos programas e frameworks necessários para rodar uma aplicação em ruby on rails, são eles: 

- Ruby
    1. Pelo terminal ,instale o curl (caso não tenha) com o comando `apt install curl`
    2. Use o comando `curl -L get.rvm.io > rvm-install` para instalar o _Ruby Version Manager (RVM)_ e em seguida use o comando `bash < ./rvm-install`.
    3. Abra o arquivo _.bashrc_ no editor de texto e adicione no final do arquivo `[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"`
    4. Deslogue e relogue na sua conta do computador ou reinicie o computador. Com isso o RVM já deve estar funcionando, para ter certeza rode `rvm -v` e verifique que está sendo retornado a versão do rvm.
    5. Com o RVM instalado basta instalar a versão do ruby que estamos utilizando com o comando `rvm install 2.6.4`.
    6. Com isso o Ruby deve estar instalado, para verificar rode `ruby -v` que irá retornar a versão 2.6.4, se tudo tiver funcionado.

- Node.js
    1. No terminal rode `curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -`
    2. sudo apt update && sudo apt install -y nodejs

- Yarn
    1. `curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`
    2. `echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee/etc/apt/sources.list.d/yarn.list`
    3. `sudo apt update && sudo apt install yarn`

- PostgreSQL
    1. A instalação do postgree é um pouco mais complicada, portanto deixaremos [aqui](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-18-04) um tutorial explicando melhor como instalar e configurar o PSQL.


## Terminando de configurar o Projeto
Para rodar o projeto basta seguir os seguintes passos:
1. Entrar no diretório _final-mp_ (`cd final-mp`)
2. Rodar o comando `gem install bundler` e em seguida `gem install rails`. Para verificar se o rails foi corretamente instalado, rodar `rails -v`
3. Rodar `bundle install` para instalar todas as gems necessárias
4. Rodar `rails db:create` e em seguida `rails db:migrate` para setar o banco de dados
5. Por fim rodar `rails db:seed` para setar o BD com as instâncias que precisaremos para testar nossa aplicação

## Rodando o projeto
Agora o programa já deve estar pronto para ser utilizado, bata rodar `rails s` para iniciar o servidor localmente, e acessar em algum browser o localhost referente à porta que foi iniciada pela sua máquina (geralmente é http://localhost:3000/). Por fim basta navegar pelo site e buscar a funcionalidade desejada. Para logar como criador de questionário ou como admin, as infromações de login se encontram no [seeds.rb](https://github.com/DraculK/Projeto-MP/blob/master/final-mp/db/seeds.rb), também podemos cadastrar novos usuários, mas nesse caso eles serão apenas usuários respondentes.
Não implementamos a funcionalidade de responder questionário, apenas os métodos necessários para criar, editar e deletar os questionários; No entanto, no _show_ do questionário colocamos uma pré visualização de como seria a página de responder questionário, se essa funcionalidade existisse.

## Console do Rails

1. Para entrar no console do rails, use o comando `rails c`
2. Nele podemos usar a sintaxe do rails para modificar e acessar os elementos em nosso banco de dados, como por exemplo para criar um novo usuário fazemos `User.create(name: "exemplo", email: "exemplo@exemplo.com", password: "PasswordExample", password_confirmation: "PasswordExample",  creator: false, admin: false)`
3. Para ver todas as instâncias de usuários podemos usar o comando `User.all`
4. Podemos procurar uma instância específica com o comando `User.find(id)` em que id é o número do id do usuário que estamos querendo acessar
5. Outra forma de procurarmos é com o comando `User.where(name: "exemplo")` que irá retornar todos os usuários com o nome "exemplo".
6. Para deletar uma instância basta usar `User.delete(id)` em que id é o id do usuário que estamos querendo deletar.

## Arquivos
Os projetos em rails possuem diversos arquivos que são gerados automaticamente, os arquivos que são de fato editados pelos desenvolvedores podem ser encontrados em:
- Arquivos com as validações das classes: _app/models_
- Arquivo que mostra nossas tabelas do banco de dados: _db/schema.rb_
- Arquivos que vão nos ajudar a fazer os testes das classes: _spec/factories_
- Arquivos com os testes das classes: _spec/models_

## Testes
- Para rodar o verificador de padrão de codificação, basta rodar no terminal o comando `rubocop`
- Para rodar todos os casos de teste das classes e checar que está tudo funcionando corretamente, basta rodar o comando `rspec spec`
