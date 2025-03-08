#!/bin/bash

# Este script copia ou move um arquivo para um diretório de destino.
# Ele verifica se o arquivo de origem e o diretório de destino existem,
# se a operação é válida e se o arquivo já existe no destino.

# Parâmetros / Exemplo de uso:
# ./movecopy.sh /caminho/arquivo.txt /destino/ cp ou mv

# Atribuindo os parâmetros passados para variáveis
arquivo_origem="$1"
diretorio_destino="$2"
operacao="$3"  # Para escolher entre copiar (cp) ou mover (mv)

# Verificando se todos os parâmetros foram fornecidos
if [ -z "$arquivo_origem" ] || [ -z "$diretorio_destino" ] || [ -z "$operacao" ]; then
  echo "Erro: Você precisa fornecer o arquivo de origem, o diretório de destino e a operação (cp ou mv)."
  echo "Uso correto: $0 <arquivo_origem> <diretorio_destino> <cp|mv>"
  exit 1
fi

# Verificando se o arquivo de origem existe
if [ ! -f "$arquivo_origem" ]; then
  echo "Erro: O arquivo de origem '$arquivo_origem' não existe ou não é um arquivo regular."
  exit 1
fi

# Verificando se o diretório de destino existe
if [ ! -d "$diretorio_destino" ]; then
  echo "Erro: O diretório de destino '$diretorio_destino' não existe."
  exit 1
fi

# Obtendo o nome do arquivo de origem
nome_arquivo=$(basename "$arquivo_origem")

# Verificando se o arquivo já existe no diretório de destino
if [ -e "$diretorio_destino/$nome_arquivo" ]; then
  echo "Aviso: Já existe um arquivo com o nome '$nome_arquivo' no diretório '$diretorio_destino'."
  exit 1
fi

# Verificando se a operação é válida
if [ "$operacao" != "cp" ] && [ "$operacao" != "mv" ]; then
  echo "Erro: Operação inválida. Use 'cp' para copiar ou 'mv' para mover."
  exit 1
fi

# Realizando a operação (copiar ou mover)
if [ "$operacao" == "cp" ]; then
  echo "Copiando o arquivo..."
  cp "$arquivo_origem" "$diretorio_destino/" || { echo "Erro: Falha ao copiar o arquivo."; exit 1; }
  echo "Arquivo copiado com sucesso."
elif [ "$operacao" == "mv" ]; then
  echo "Movendo o arquivo..."
  mv "$arquivo_origem" "$diretorio_destino/" || { echo "Erro: Falha ao mover o arquivo."; exit 1; }
  echo "Arquivo movido com sucesso."
fi
