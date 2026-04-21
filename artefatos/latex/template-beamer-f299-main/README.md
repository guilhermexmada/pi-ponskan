# Template Beamer FATEC Registro

Template LaTeX Beamer personalizado para apresentações acadêmicas do curso de Desenvolvimento de Software Multiplataforma (DSM) da FATEC Registro.

## 📋 Características

- **Tema moderno** com cores institucionais (vermelho e azul)
- **Cabeçalho customizado** com logos da FATEC, Governo SP e CPS
- **Slides com imagens de fundo** para seções principais
- **Fonte Roboto** para um visual contemporâneo
- **Estrutura pré-definida** para apresentações de projetos
- **Aspectratio 16:9** otimizado para projetores modernos

## 🚀 Como Usar

### Pré-requisitos

- **LaTeX** instalado (recomendado: [TeX Live](https://www.tug.org/texlive/) ou [MiKTeX](https://miktex.org/))
- Pacotes necessários:
  - `beamer`
  - `roboto`
  - `tikz`
  - `graphicx`
  - `babel` (brazilian)

### Compilação

Para compilar a apresentação, execute:

```bash
pdflatex apresentacao.tex
```

Ou use seu editor LaTeX preferido (TeXstudio, Overleaf, VS Code com LaTeX Workshop, etc.).

## 📝 Personalização

### 1. Informações da Apresentação

Edite as linhas 86-90 do arquivo [apresentacao.tex](apresentacao.tex):

```latex
\title{Modelo Latex Beamer para \\Desenvolvimento de Software Multiplataforma}
\subtitle{}
\author[DSM]{SOBRENOME, F.; SOBRENOME, C.; SOBRENOME, B.}
\institute{Desenvolvimento de Software Multiplataforma\\FATEC Registro}
\date{\today}
```

**Dicas:**
- `\title{}`: Título da apresentação (use `\\` para quebra de linha)
- `\subtitle{}`: Subtítulo (opcional)
- `\author[DSM]{}`: Autores no formato SOBRENOME, Iniciais
- `\date{\today}`: Data (use `\today` para data automática ou escreva manualmente)

### 2. Modificar a Agenda

Edite o slide de agenda (linhas 133-147) conforme as seções da sua apresentação:

```latex
\begin{frame}[b]{Agenda}
  \begin{itemize}
    \item Pitch
    \item Problematização
    \item Estado da Arte
    % Adicione ou remova itens conforme necessário
  \end{itemize}
\end{frame}
```

### 3. Adicionar Conteúdo aos Slides

Cada seção possui uma estrutura básica. Para modificar o conteúdo:

```latex
\begin{frame}[b]{Título do Slide}
  \begin{itemize}
    \item \parbox{0.60\textwidth}{Seu conteúdo aqui}
    \item \parbox{0.60\textwidth}{Mais informações}
  \end{itemize}
  
  \vfill
  
  {\fontsize{4}{5}\selectfont\textit{Fonte: Seu Nome}\hfill\textcolor{white}{Imagem: Descrição}}
\end{frame}
```

**Nota:** O `\parbox{0.60\textwidth}` limita o texto a 60% da largura do slide (útil para slides com imagens de fundo).

### 4. Imagens de Fundo

Para adicionar ou modificar imagens de fundo:

```latex
{
\usebackgroundtemplate{%
  \includegraphics[width=\paperwidth,height=\paperheight]{imgs/img_001.jpg}%
}
\begin{frame}[b]{Título}
  % Conteúdo do slide
\end{frame}
}
```

**Estrutura de imagens:**
- `imgs/base/`: Logos institucionais (não modificar)
- `imgs/`: Imagens de fundo personalizadas (img_001.jpg, img_002.jpg, etc.)

### 5. Tabelas (Estado da Arte)

O template inclui um exemplo de tabela para revisão bibliográfica (linhas 199-216). Modifique conforme necessário:

```latex
\begin{table}
  \centering
  \tiny
  \begin{tabular}{|p{2.5cm}|p{2cm}|...|}
    \hline
    \textbf{Título/Autores} & \textbf{Objetivo} & ... \\
    \hline
    Seu trabalho aqui & Descrição & ... \\
    \hline
  \end{tabular}
\end{table}
```

### 6. Personalizar Cores

As cores principais estão definidas nas linhas 14-16:

```latex
\definecolor{vermelhoPrincipal}{HTML}{b11116}
\definecolor{azulComplementar}{HTML}{3a5461}
\definecolor{brancoFundo}{HTML}{FFFFFF}
```

Altere os códigos hexadecimais para mudar o esquema de cores.

## 📁 Estrutura de Arquivos

```
template-beamer-f299/
├── apresentacao.tex          # Arquivo principal
├── README.md                 # Este arquivo
├── LICENSE                   # Licença do projeto
└── imgs/
    ├── base/                 # Logos institucionais
    │   ├── fatec-rgt.png
    │   ├── governo-sp-secretaria-logo.png
    │   └── cps-logo.png
    ├── img_001.jpg           # Imagens de fundo
    ├── img_002.jpg
    ├── ...
    └── img_022.jpg
```

## 🎨 Seções Pré-definidas

O template inclui as seguintes seções:

1. **Slide de Título** - Apresentação inicial
2. **Agenda** - Índice da apresentação
3. **Pitch** - Apresentação concisa do projeto
4. **Problematização** - Contextualização do problema
5. **Estado da Arte** - Revisão bibliográfica/soluções existentes
6. **Objetivo** - Objetivos gerais e específicos
7. **Ferramental** - Tecnologias utilizadas
8. **Metodologia** - Processos e fluxogramas
9. **Apresentação Prática** - Demonstração do sistema
10. **Resultados e Discussões** - Análise de resultados
11. **Slide Final** - Agradecimentos

## 💡 Dicas

### Adicionar Novo Slide Simples

```latex
\begin{frame}{Título do Slide}
  \begin{itemize}
    \item Primeiro ponto
    \item Segundo ponto
    \item Terceiro ponto
  \end{itemize}
\end{frame}
```

### Adicionar Imagens no Slide

```latex
\begin{frame}{Título}
  \begin{center}
    \includegraphics[width=0.7\textwidth]{caminho/para/imagem.jpg}
  \end{center}
\end{frame}
```

### Criar Blocos de Destaque

```latex
\begin{frame}{Título}
  \begin{block}{Título do Bloco}
    Conteúdo destacado aqui
  \end{block}
\end{frame}
```

### Usar Colunas

```latex
\begin{frame}{Título}
  \begin{columns}
    \column{0.5\textwidth}
      Conteúdo da esquerda
    \column{0.5\textwidth}
      Conteúdo da direita
  \end{columns}
\end{frame}
```

## 🔧 Solução de Problemas

### Erro de compilação com fontes
Se houver erro com a fonte Roboto, comente as linhas 10-11:
```latex
% \usepackage[sfdefault]{roboto}
% \usepackage[T1]{fontenc}
```

### Imagens não aparecem
Verifique se:
- As imagens estão na pasta `imgs/`
- Os nomes dos arquivos correspondem aos usados no código
- O caminho está correto (use barras `/` mesmo no Windows)

### Logos não aparecem no cabeçalho
Certifique-se de que todos os arquivos estão na pasta `imgs/base/`:
- `fatec-rgt.png`
- `governo-sp-secretaria-logo.png`
- `cps-logo.png`

## 📄 Licença

Consulte o arquivo [LICENSE](LICENSE) para detalhes.

## ✨ Contribuindo

Sinta-se à vontade para sugerir melhorias ou reportar problemas!

---

**Desenvolvido para FATEC Registro - DSM**
