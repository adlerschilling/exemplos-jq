#!/bin/bash
#diretorio arquivo
diretorio="arquivos/"
#funcao que lista os arquivos do diretorio
listarArquivosDiretorio(){
    
    for arq in `ls $diretorio`
    do
        #parametro $diretorio adicionado para ter o caminho completo do arquivo
        lista_arquivos_json+=("$diretorio${arq}")
    done
}

#funcao que gera um novo Json com a lista de Jsons lidos do diretorio 
criarJsonCompleto(){

    arquivos=${#lista_arquivos_json[@]}
    dados=$(jq -n --arg arquivos $arquivos '{"arquivos": "\($arquivos)"} | .registros += [inputs]' "${lista_arquivos_json[@]}")
    echo Json Completo $dados
}

listarArquivosDiretorio
criarJsonCompleto
