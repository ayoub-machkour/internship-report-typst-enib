# Engineering Internship Report

Engineering internship report on modernizing ENIB's pedagogical document management system. This report, created with Typst, demonstrates the migration from LaTeX to modern documentation tools, including the development of automated PDF generation, CLI-based metadata management, and a Flask web interface for document customization.

---

## Overview

This report documents a Professional Practice Study (PPE) internship at ENIB (École Nationale d'Ingénieurs de Brest) from September to December 2024. The project focused on modernizing the school's document management system to support its institutional transformation and the integration of new educational programs.

### Project Context

- Modernization of ENIB's document generation system
- Migration from LaTeX to Typst for improved efficiency
- Development of automated tools for document management
- Integration of FISEA program documentation

### Technologies Used

- **Typst**: Modern document preparation system
- **Flask**: Web framework for the interface
- **Python**: Core programming language
- **GitLab**: Version control and documentation source
- **VitePress**: Static site generation

---

## Report Structure

1. ENIB: An Engineering School in Evolution
2. Analysis of Existing System and Specifications
3. Technical Choices
4. Typst Implementation
5. User Interface Development
6. RSE-RNE Impact Study
7. General Conclusion

---

## Installation

Typst's CLI is available from different sources:

### Binary Installation

You can get sources and pre-built binaries for the latest release of Typst from the [releases page](https://github.com/typst/typst/releases). Download the archive for your platform and place it in a directory that is in your PATH. To stay up to date with future releases, you can simply run `typst update`.

### Package Managers

- **Linux**: View Typst on [Repology](https://repology.org/project/typst/versions).
- **macOS**: `brew install typst`
- **Windows**: `winget install --id Typst.Typst`

### Using Rust Toolchain

If you have a Rust toolchain installed, you can install:

- The latest released Typst version with:
  ```bash
  cargo install --locked typst-cli
  ```
- A development version with:
  ```bash
  cargo install --git https://github.com/typst/typst --locked typst-cli
  ```

### Nix Users

- Use the Typst package with:
  ```bash
  nix-shell -p typst
  ```
- Build and run a development version with:
  ```bash
  nix run github:typst/typst -- --version
  ```

### Docker Users

Run a prebuilt image with:
```bash
docker run ghcr.io/typst/typst:latest --help
```

---

To generate the PDF report:

1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd <repository_name>
   ```

2. Ensure Typst is installed using one of the methods above.

3. Build the PDF:
   ```bash
   typst compile main.typ
   ```

4. The generated `main.pdf` will be available in the root directory.

---

## Key Components

### Typst Templates

- **`template.typ`**: The primary template defining the structure of the report.
- **`cover.typ`**: Defines the report cover page, including ENIB logos and branding.

### Chapters

Each chapter is structured as a separate Typst file for modularity:

- **`Chapter1/chapter1.typ`**: Introduction and project overview.
- **`Chapter2/Chapter2.typ`**: Analysis of existing systems.
- **`Chapter3/chapter3.typ`**: Technical choices and challenges.
- **`Chapter4/chapter4.typ`**: Implementation details.
- **`Chapter5/chapter5.typ`**: User interface development.
- **`Chapter6/chapter6.typ`**: RSE-RNE impact study.
- **`Conclusion/conclusion.typ`**: Final conclusions and reflections.

### Additional Files

- **Images**: Located in the `images/` directory.
- **Bibliography**: Managed through `biblio/biblio.bib` and formatted using Typst's citation tools.
- **Acknowledgments**: Stored in `Acknowledgement/acknowledgement.typ`.
- **Appendices**: Stored in `appendix/appendix.typ`.
- **Tables**: Custom tables are defined in `tables/tables.typ`.

---

## Authors

- **MACHKOUR Ayoub**
- **TERRO Yassine**

## Academic Supervisors

- **Academic Supervisor**: Vincent Choqueuse
- **Company Supervisor**: Mathilde Menoret

---
