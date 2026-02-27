# Bachelor's Thesis

This is a LaTeX-based bachelor's thesis project. Note! The thesis is written in Swedish.

## Project Structure

The thesis is organized into the following sections:

- `a_inledning/` - Introduction (Background, Problem Statement, Research Questions & Purpose)
- `b_litteraturstudie/` - Literature Study
- `c_metod/` - Methodology (Design Science Research, Data Collection, Ethical Analysis)
- `d_resultat/` - Results (Document Analysis, Interviews)
- `e_analys/` - Analysis (SFERA Analysis, Improvement Proposals, Validation, Gamification)
- `f_diskussion/` - Discussion
- `g_slutsatser/` - Conclusions
- `h_bilagor/` - Appendices (Interviews, Validation Interview, Scenarios)

## Rendering to PDF

### Prerequisites

You need a LaTeX distribution installed on your system:

- **macOS**: Install [MacTeX](https://tug.org/mactex/) or [Homebrew](https://brew.sh/)
  ```bash
  brew install mactex
  ```

- **Linux**: Install TeX Live
  ```bash
  sudo apt-get install texlive-full
  ```

- **Windows**: Install [MiKTeX](https://miktex.org/) or [TeX Live](https://tug.org/texlive/)

### Compiling from Command Line

Navigate to the project directory and run:

```bash
cd src
pdflatex -interaction=nonstopmode main.tex
```

For a more complete build (with bibliography and references), use:

```bash
cd src
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

The output PDF will be generated as `main.pdf` in the `src/` directory.

### Using Latexmk (Recommended)

If you have `latexmk` installed, it automates the compilation process:

```bash
cd src
latexmk -pdf main.tex
```

To clean up auxiliary files:

```bash
latexmk -c
```

### Using an IDE

You can also compile the thesis using:

- **Overleaf** - Upload the project to [Overleaf](https://www.overleaf.com)
- **TeXShop** (macOS) - Open `main.tex` and click the "Typeset" button
- **IntelliJ IDEA with TeXiFy plugin** - Install the TeXiFy IDEA plugin and configure it to build the project

## Main File

The main LaTeX file is `src/main.tex`, which includes all sections and is configured using the `maucsthesis.cls` class file.

## Bibliography

References are managed in `src/main.bib`. Add or modify references there and they will be included in the document.

## Images

Image files used in the thesis (`.png`, `.eps`) are located in the `src/` directory:

- `c-das-comms.png`
- `sfera-communication.png`
- `sferabehov.png`
- `mau-logo.eps`

## License

This project is a bachelor's thesis submitted to Malmö University.

