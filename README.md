# 🎥  Api Filmes 🎥
> Status: **Melhorando**⚙️<br>

## Sobre o projeto
Projeto proposto pela [Mobile2You](https://www.mobile2you.com.br/pt/) para que eu pudesse demonstrar minhas habilidades. O projeto consiste numa API para buscar filmes. Além dos EndPoints de busca, existe um específico que lê, trata e salva os dados de um arquivo CSV no banco de dados.

## Objetivo
O objetivo principal da API é fornecer dados sobre filmes a partir dos filtros de cada endpoint, em formato JSON.

## Configurando
A base de dados precisa ficar a parte da pasta raiz do API. Baixe o arquivo [netflix_title.cs](https://drive.google.com/file/d/1Wl09Ada1qq8RFRZnGPjGqR-70qE22Uc8/view?usp=sharing).
+ Caso esteja no windows, colocar o aquivo na pasta
  > C:\Users\filmes_data\netflix_title.csv (criar pastas necessárias)
+ Caso esteja no linux, colocar o aquivo na pasta
  > /home/**nome_user_linux**/filmes_data/netflix_title.csv (criar pastas necessárias)

O povoamenoto é feito através de um serviço, nele é onde os dados do arquivo .csv são tratados e salvos no banco. É preciso substituir o caminho do arquivo .csv especificado no método **settle_db** do serviço. Ele Pode ser encontrado no caminho */app/servicos/settle_db_service.rb*. <br>
Exemplos:
+ Usuário Windows: 
```
def self.settle_db
        unless Filme.all.any?
            erro = []
            file = 'C:\Users\filmes_data\netflix_title.csv'
```
+ Usuário Linux: 
```
def self.settle_db
        unless Filme.all.any?
            erro = []
            file = '/home/luiz/filmes_data/netflix_title.csv'
```

## Implementação

## END POINTS 🔍
+ (GET) /api/v1/settle <br>
+ (GET) /api/v1/filtro1 <br>
+ (GET) /api/v1/filtro2 <br>
+ (GET) /api/v1/filtro" <br>
## Ferramentas e versões

Ferramentas | Versões
----------- | ----------
Ruby        | 3.0.1
Rails       | 6.1.4.4
Git         | 2.25
Rspec       | 3.10


