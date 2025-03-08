## 💻 Repositório
Script em Bash que permite copiar ou mover arquivos para um diretório de destino. Ele verifica se os caminhos fornecidos são válidos e se a operação pode ser realizada com sucesso.

## 📝 Recursos
- [x] Verifica se o arquivo de origem existe
- [x] Verifica se o diretório de destino existe
- [x] Permite escolher entre copiar (`cp`) ou mover (`mv`) o arquivo
- [x] Evita sobrescrita caso o arquivo já exista no destino

## 🛠️ Uso
Dê permissão de execução:
   ```bash
   chmod +x movecopy.sh
   ```

Execute o script passando o caminho do arquivo de origem, o diretório de destino e a operação desejada (`cp` ou `mv`):

```bash
./movecopy.sh /caminho/do/arquivo.txt /caminho/do/destino/ cp
```

Ou para mover:

```bash
./movecopy.sh /caminho/do/arquivo.txt /caminho/do/destino/ mv
```
