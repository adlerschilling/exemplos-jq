#!/bin/bash
#caminho arquivo
diretorio="arquivos/"

#funcao que lista os arquivos do diretorio
listarArquivosDiretorio(){
    
    for arq in `ls $diretorio`
    do
        lista_arquivos_json+=("${arq}")
    done
}

#funcao que faz a leitura dos arquivos Json listados no diretorio
lerArquivosJson(){
    
    for arquivo in ${lista_arquivos_json[@]};
    do
        #faz a leitura do Json e guarda na variavel, variavel diretorio adicionada para passar
        #o caminho completo do arquivo
        dados=$(jq -r '.' $diretorio$arquivo)
        echo Dados $dados
    done
}

listarArquivosDiretorio
lerArquivosJson