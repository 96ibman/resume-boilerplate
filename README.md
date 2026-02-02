# Resume Boilerplate

A simple, automated resume generation system using YAML data files and LaTeX templates. This project allows you to maintain your resume data in a structured YAML file and automatically generate a professional PDF resume.

## Inspiration

This project is inspired by [Typesetting automation](https://mrzool.cc/writing/typesetting-automation/) blog post by Mattia Tezzele. The idea of separating content from presentation and automating the typesetting process makes maintaining resumes much more manageable.

## Features

- **Data-driven**: Keep your resume content in a clean YAML file
- **Automated generation**: One command to generate your PDF resume
- **Customizable**: Easy to modify the LaTeX template for different styles
- **Version controlled**: Track changes to your resume over time

## Prerequisites

To use this resume boilerplate, you need the following dependencies installed on your system:

### Required Dependencies

1. **Pandoc** (version 2.0 or higher)
   - Universal document converter that processes the YAML data and LaTeX template
   - Download from: https://pandoc.org/installing.html
   - Verify installation: `pandoc --version`

2. **LaTeX Distribution**
   - **Windows**: MiKTeX (https://miktex.org/download) or TeX Live (https://www.tug.org/texlive/)
   - **macOS**: MacTeX (https://www.tug.org/mactex/)
   - **Linux**: TeX Live (usually available via package manager)
   - Required for PDF generation via pdflatex
   - Verify installation: `pdflatex --version`

3. **Make** (build automation tool)
   - **Windows**: 
     - Install via Chocolatey: `choco install make`
     - Or use Git for Windows which includes Make
     - Or use WSL (Windows Subsystem for Linux)
   - **macOS**: Included with Xcode Command Line Tools (`xcode-select --install`)
   - **Linux**: Usually pre-installed, or install via package manager (`sudo apt-get install build-essential`)

### Required LaTeX Packages

The template uses these LaTeX packages (most are included in standard distributions):
- `inputenc`, `fontenc`, `lmodern` - Font encoding
- `geometry` - Page layout
- `graphicx`, `tabularx`, `array` - Tables and graphics
- `enumitem` - List formatting
- `titlesec`, `xcolor` - Styling
- `fontawesome5` - Icons (may need manual installation)
- `hyperref` - Clickable links
- `booktabs` - Professional tables

If any packages are missing, your LaTeX distribution should prompt you to install them automatically (especially MiKTeX).

## Quick Start

1. **Clone this repository**
   ```bash
   git clone https://github.com/96ibman/resume-boilerplate.git
   cd resume-boilerplate
   ```

2. **Edit your details**
   Open `details.yml` and fill in your information (see detailed guide below)

3. **Generate your resume**
   ```bash
   make
   ```

4. **Find your resume**
   The generated PDF will be `resume_en.pdf` in the same directory

## How to Edit the YAML File

The `details.yml` file contains all your resume data structured in sections. Here's how to customize it:

### Personal Information
```yaml
personal_info:
  name: "Your Full Name"
  role: "Your Professional Title"
  email: "your.email@example.com"
  github: "your-github-username"      # Just the username, not the full URL
  linkedin: "your-linkedin-username"  # Just the username from your LinkedIn URL
  location: "City, Country"
```

### Professional Experience
Add or remove entries as needed. Each job should follow this format:
```yaml
professional_experience:
  - position: Senior Software Engineer
    organization: Tech Company Inc.
    start_date: 01.2024
    end_date: present
    location: Remote
    description: Led a team of 5 developers in building a microservices platform. Improved system performance by 40%.
```

**Tips:**
- Use consistent date format: `MM.YYYY`
- Keep descriptions concise but impactful
- List experiences in reverse chronological order (most recent first)

### Education
```yaml
education:
  - degree: Master of Science in Computer Science
    institution: University Name
    start_date: 09.2020
    end_date: 06.2022
    location: City, Country
    description: "GPA: 3.9/4.0, Thesis: Deep Learning Applications"
```

### Skills
Organize your skills by category:
```yaml
skills:
  - category: Programming Languages
    items:
      - Python
      - JavaScript
      - Java
  
  - category: Frameworks
    items:
      - React
      - Django
      - Spring Boot
```

You can add or remove categories as needed.

### Languages
```yaml
languages:
  - language: English
    level: Native
  - language: Spanish
    level: Fluent
  - language: French
    level: Intermediate
```

### Publications
```yaml
publications:
  - title: Paper Title
    publisher: Conference/Journal Name
    year: 2024
    description: Brief description of the publication
    location: City, Country
```

## How It Works

The build process follows these steps:

1. **Data Preparation**: Your resume data is stored in `details.yml`
2. **Template Processing**: Pandoc reads `empty.md` (a placeholder) and injects the YAML metadata
3. **LaTeX Generation**: Pandoc applies the `template.tex` to format your data
4. **PDF Compilation**: pdflatex compiles the LaTeX to produce `resume_en.pdf`

The entire process is automated through the Makefile, so you only need to run `make`.

## Platform-Specific Instructions

### Windows
This project has been tested and works on Windows. Follow the Quick Start guide above.

If you encounter issues with Make:
- Alternative: Run the pandoc command directly:
  ```powershell
  pandoc empty.md --metadata-file=details.yml --template=template.tex --pdf-engine=pdflatex --pdf-engine-opt=-interaction=nonstopmode -o resume_en.pdf
  ```

### macOS / Linux
The same process should work seamlessly on Unix-like systems:

```bash
make
```

If you encounter permission issues:
```bash
chmod +x Makefile
make
```

**Note**: While the Windows version has been thoroughly tested, macOS and Linux compatibility is expected but not verified. If you encounter platform-specific issues, please open an issue or submit a pull request with fixes.

## Customization

### Modifying the Template
Edit `template.tex` to customize:
- Fonts and colors
- Section ordering
- Layout and spacing
- Header/footer design

The template uses Pandoc's templating syntax (`$variable$`) to inject YAML data.

### Adding New Sections
1. Add the data structure to `details.yml`
2. Add the corresponding LaTeX code to `template.tex`
3. Use Pandoc's `$for(section)$...$endfor$` syntax for lists

## Cleaning Up

To remove generated files:
```bash
make clean
```

This removes all PDF, log, and auxiliary files.

## Contributing

Contributions are welcome! Here's how you can help:

### Reporting Issues
- Check existing issues first to avoid duplicates
- Provide detailed information: OS, dependency versions, error messages
- Include your YAML structure (with sensitive data removed)

### Pull Requests
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Test thoroughly (especially if modifying the template)
5. Commit with clear messages (`git commit -m "Add: feature description"`)
6. Push to your fork (`git push origin feature/your-feature-name`)
7. Open a Pull Request with a detailed description


## License

This project is open source and available under the MIT License.


## Support

If you find this project useful, consider:
- Starring the repository ⭐
- Sharing it with others
- Contributing improvements
- Reporting bugs or suggesting features

---

**Happy resume building! 📄✨**
