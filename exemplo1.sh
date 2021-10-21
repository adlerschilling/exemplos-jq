#!/bin/bash
#caminho arquivo
arquivo="arquivos/exemplo1.json"

#funcao que cria o arquivo json que vai ser usado na funcao lerArquivoJson
criarArquivoJson(){

    echo "{ \"nome\": \"Pedro\", \"idade\": 25 }" > $arquivo
}

#funcao que faz a leitura de parametros de um arquivo json
lerArquivoJson(){
    
    if [ -e $arquivo ]; then
        #faz a leitura do parametro nome
        nome=$(jq -r '.nome' $arquivo)
        #faz a leitura do parametro idade
        idade=$(jq -r '.idade' $arquivo)
        #printa os valores
        echo Nome:$nome Idade:$idade
    else
        echo Arquivo não existe, verifique se você tem permissões de leitura e escrita!
    fi
}

criarArquivoJson
lerArquivoJson