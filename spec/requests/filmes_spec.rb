require 'rails_helper'

RSpec.describe 'Filmes API', type: :request do
    describe 'GET /povoar_banco' do

        it 'povoando banco com as informações do arquivo .csv' do
            get '/api/v1/povoar_banco'

            expect(response).to have_http_status(:created)
            expect(JSON.parse(response.body).size).to eq(126)
        end
    end

    describe 'GET /filtro_lancamento' do
        before do
            get '/api/v1/povoar_banco'
        end

        it 'buscando filme pelo ano de lançamento' do
            get '/api/v1/filtro_lancamento', params: { year: 2000 }

            expect(response).to have_http_status(:ok)
            expect(JSON.parse(response.body)).to eq(
                [
                    {
                        "country"=>"United States",
                        "description"=>
                        "After her drunken antics result in property damage, an alcoholic journalist enters rehab – and soon meets a fellow resident who changes her outlook.",
                        "genre"=>"Movie",
                        "id"=>30,
                        "published_at"=>"2020-09-30",
                        "title"=>"28 Days",
                        "year"=>2000
                    }
                ]
            )
        end

        it 'retornar erro quando parametro stiver faltando' do
            get '/api/v1/filtro_lancamento', params: {  }

            expect(response).to have_http_status(:unprocessable_entity)
            expect(JSON.parse(response.body)).to eq({
                "error" => "param is missing or the value is empty: year\nDid you mean?  action\n               controller"
            })
        end
    end
end