#!/bin/bash
#caminho arquivo
arquivo="arquivos/exemplo2.json"

#funcao que cria o arquivo json que vai ser usado na funcao lerArquivoJson
criarArquivoJson(){
    
    echo "{ \"nome\": \"Paulo\", \"idade\": 33 }" > $arquivo
}

#funcao que faz a leitura de um arquivo json
lerArquivoJson(){

    if [ -e $arquivo ]; then
        #faz a leitura do Json e guarda na variavel
        dados=$(jq -r '.' $arquivo)
        echo Dados $dados
    else
       echo Arquivo não existe, verifique se você tem permissões de leitura e escrita!
    fi
}

criarArquivoJson
lerArquivoJson