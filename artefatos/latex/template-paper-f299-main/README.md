# Template de Artigo LaTeX FATEC Registro

Template LaTeX para artigos científicos do curso de Desenvolvimento de Software Multiplataforma (DSM) da FATEC Registro.

## 📋 Características

- **Cabeçalho institucional** com logos da FATEC, Governo SP e CPS
- **Formatação acadêmica** para artigos científicos
- **Gerenciamento de referências** com BibTeX
- **Suporte completo** para equações matemáticas
- **Estrutura pronta** para desenvolvimento de artigos

## 📁 Estrutura de Diretórios

```
paper/
├── artigo.tex           # Documento principal
├── referencias.bib      # Referências bibliográficas
├── artigo.aux          # Arquivo auxiliar (gerado)
├── artigo.bbl          # Bibliografia processada (gerado)
├── artigo.pdf          # PDF final (gerado)
├── imgs/               # Diretório de imagens
│   └── base/          # Imagens base do template
└── README.md          # Este arquivo
```

## 🚀 Como Usar

### Pré-requisitos

- **LaTeX** instalado (recomendado: [TeX Live](https://www.tug.org/texlive/) ou [MiKTeX](https://miktex.org/))
- **BibTeX** para processar referências bibliográficas
- **Pacotes LaTeX necessários**:
  - `babel` (português)
  - `graphicx` (imagens)
  - `amsmath`, `amsfonts`, `amssymb` (matemática)
  - `fancyhdr` (cabeçalho/rodapé)
  - `tikz` (cabeçalho com logos)
  - `hyperref` (links)
  - `cite`, `booktabs` (tabelas e citações)

A maioria dos pacotes é instalada automaticamente pelo gerenciador de pacotes do LaTeX.

### Compilação

Para compilar o documento corretamente com todas as referências e formatação, execute:

```powershell
pdflatex artigo.tex; bibtex artigo; pdflatex artigo.tex; pdflatex artigo.tex
```

#### Por que 4 comandos?

Este documento usa recursos que exigem múltiplas compilações:

1. **Primeiro `pdflatex`**: Gera o arquivo `.aux` com informações sobre citações e cria marcações para o cabeçalho com logos (TikZ)

2. **`bibtex`**: Processa o arquivo `referencias.bib` e gera o `.bbl` com as referências formatadas

3. **Segundo `pdflatex`**: Inclui as referências no PDF e renderiza o cabeçalho corretamente

4. **Terceiro `pdflatex`**: Resolve todas as referências cruzadas e finaliza o documento

## 📝 Personalização

### Cabeçalho Institucional

O cabeçalho com as logos da FATEC, CPS e Governo de SP usa TikZ com `remember picture, overlay`, que precisa de 2 compilações para posicionar os elementos corretamente.

### Referências Bibliográficas

As referências estão no arquivo [referencias.bib](referencias.bib) e são processadas pelo BibTeX. Edite esse arquivo para adicionar ou modificar referências.

Exemplo de entrada no `referencias.bib`:

```bibtex
@article{exemplo2024,
  author  = {Sobrenome, Nome},
  title   = {Título do Artigo},
  journal = {Nome da Revista},
  year    = {2024},
  volume  = {10},
  pages   = {1-10}
}
```

## 🧹 Limpeza de Arquivos Temporários

Para remover arquivos temporários mantendo a estrutura funcionando:

```powershell
Remove-Item *.blg, *.fdb_latexmk, *.fls, *.out, *.log -ErrorAction SilentlyContinue
```

**Importante**: Mantenha os arquivos `.aux` e `.bbl` para evitar recompilar tudo.
