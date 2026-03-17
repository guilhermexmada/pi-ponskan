# Artefatos de Projeto de Software - FATEC Registro

Documento LaTeX para apresentação de artefatos de projetos de software do curso de Desenvolvimento de Software Multiplataforma (DSM) da FATEC Registro.

## 📋 Características

- **Cabeçalho institucional** com logos da FATEC, Governo SP e CPS
- **Capa padronizada** com informações do curso e projeto
- **Índice automático** com sumário interativo
- **6 seções principais** de artefatos de software
- **Gerenciamento de referências ABNT** com BibTeX
- **Notas de rodapé** explicativas
- **Referências no sumário** para navegação fácil

## 📁 Estrutura de Diretórios

```
paper/
├── artefatos.tex        # Documento principal
├── referencias.bib      # Referências bibliográficas
├── artefatos.aux       # Arquivo auxiliar (gerado)
├── artefatos.bbl       # Bibliografia processada (gerado)
├── artefatos.pdf       # PDF final (gerado)
├── imgs/               # Diretório de imagens
│   └── base/          # Imagens base do template
└── README.md          # Este arquivo
```

## 📑 Conteúdo do Documento

O documento está organizado nas seguintes seções:

1. **CANVAS** - Modelo de Negócio e Estratégia (Business Model Canvas)
2. **SWOT** - Análise Estratégica de Forças, Fraquezas, Oportunidades e Ameaças
3. **UX/UI** - Design de Interface e Experiência do Usuário
4. **Website** - Estrutura e Especificações do Site da Equipe
5. **Diagramas UML** - Modelagem Visual do Sistema
6. **DevOps** - Infraestrutura, Automação e Entrega Contínua

Cada seção inclui:
- Descrição teórica do artefato
- Exemplos práticos formatados
- Citações bibliográficas
- Notas de rodapé explicativas

## 🚀 Como Usar

### Pré-requisitos

- **LaTeX** instalado (recomendado: [TeX Live](https://www.tug.org/texlive/) ou [MiKTeX](https://miktex.org/))
- **BibTeX** para processar referências bibliográficas
- **Pacotes LaTeX necessários**:
  - `babel` (português)
  - `graphicx` (imagens)
  - `amsmath`, `amsfonts`, `amssymb` (matemática)
  - `fancyhdr` (cabeçalho/rodapé)
  - `tikz` com `shapes.geometric` (diagramas e cabeçalho)
  - `hyperref` (links clicáveis)
  - `abntex2cite` (citações no formato ABNT)
  - `colortbl`, `booktabs`, `array` (tabelas)

A maioria dos pacotes é instalada automaticamente pelo gerenciador de pacotes do LaTeX.

### Compilação

Para compilar o documento corretamente com todas as referências e formatação ABNT, execute:

```powershell
pdflatex artefatos.tex; bibtex artefatos; pdflatex artefatos.tex; pdflatex artefatos.tex
```

Ou com saída silenciosa:

```powershell
pdflatex -interaction=nonstopmode artefatos.tex | Out-Null; bibtex artefatos; pdflatex -interaction=nonstopmode artefatos.tex | Out-Null; pdflatex -interaction=nonstopmode artefatos.tex | Out-Null
```

#### Por que 4 comandos?

Este documento usa recursos que exigem múltiplas compilações:

1. **Primeiro `pdflatex`**: Gera o arquivo `.aux` com informações sobre citações, sumário e cria marcações para o cabeçalho com logos (TikZ)

2. **`bibtex`**: Processa o arquivo `referencias.bib` e gera o `.bbl` com as referências formatadas no padrão ABNT

3. **Segundo `pdflatex`**: Inclui as referências no PDF, atualiza o sumário e renderiza o cabeçalho corretamente

4. **Terceiro `pdflatex`**: Resolve todas as referências cruzadas, finaliza notas de rodapé e gera o documento completo

## 📝 Personalização

### Capa do Documento

Edite as informações da capa em `artefatos.tex`:

```latex
{\Large DESENVOLVIMENTO DE SOFTWARE MULTIPLATAFORMA}\\[0.3cm]
{\Large PROJETO: [NOME DO SEU PROJETO]}\\[0.3cm]
{\large ARTEFATOS DO PROJETO DE SOFTWARE}\\[0.5cm]
```

### Adicionando Imagens

Substitua os caminhos de exemplo pelas suas imagens:

```latex
\includegraphics[width=0.8\textwidth]{imgs/seu_canvas.png}
```

### Referências Bibliográficas

As referências estão no arquivo [referencias.bib](referencias.bib) no formato ABNT e são processadas pelo BibTeX. Edite esse arquivo para adicionar ou modificar referências.

Exemplo de entrada no `referencias.bib`:

```bibtex
@article{exemplo2024,
  author  = {Sobrenome, Nome},
  title   = {Título do Artigo},
  journal = {Nome da Revista},
  year    = {2024},
  volume  = {10},
  pages   = {1--10}
}
```

Para citar no texto, use:

```latex
Segundo \cite{exemplo2024}, o desenvolvimento ágil...
```

### Notas de Rodapé

Adicione notas de rodapé explicativas:

```latex
Texto principal\footnote{Informação complementar na nota de rodapé.}
```

## 🎨 Ferramentas Recomendadas

Para criar os artefatos mencionados no documento:

- **CANVAS**: Canvanizer, Miro, Figma
- **SWOT**: PowerPoint, Google Slides, Miro
- **UX/UI**: Figma, Adobe XD, Sketch
- **Diagramas UML**: PlantUML, Draw.io, Lucidchart, StarUML
- **DevOps/Infraestrutura**: Draw.io, Miro, Cloudcraft

## 🧹 Limpeza de Arquivos Temporários

Para remover arquivos temporários mantendo a estrutura funcionando:

```powershell
Remove-Item *.blg, *.fdb_latexmk, *.fls, *.out, *.log -ErrorAction SilentlyContinue
```

**Importante**: Mantenha os arquivos `.aux` e `.bbl` para evitar recompilar tudo.

## 📚 Recursos Adicionais

- [Documentação ABNTeX2](https://www.abntex.net.br/)
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [Overleaf Documentation](https://www.overleaf.com/learn)
- [CTAN - Pacotes LaTeX](https://ctan.org/)
