# Bristol CS Letter class

Designed to some extent according to the [university brand guidelines](https://uob.sharepoint.com/sites/marketing/SitePages/Brand-guidlines.aspx).

- Based on the KOMA-script `scrlttr2` class for letters.
- Uses the University font, Open Sans, and a vector logo.
- Simple `latexmkrc` file included to help `latexmk` go.

This is a template, so try the "Use this template" button to make a new repo.

## Usage

Edit `main.tex` (your name, address, recipient, contents), then run:

```
latexmk
```

This uses `pdflatex` (see `latexmkrc`). Required LaTeX packages, all included
in TeX Live and MiKTeX: `scrlttr2` (KOMA-script), `opensans`, `babel`,
`hyperref`, `graphicx`, and `lipsum` (placeholder text only; remove it from
`main.tex` for a real letter).

Replace `sig.png` with your own signature, or delete the `\includegraphics`
line in `main.tex`. Class options `fromemail` and `fromphone` show your email
and phone; `foldmarks=false` hides fold marks; `blacklogo` uses the black logo.

The logo is the official vector `UoB_RGB_24.pdf` (`UoB_Black_24.pdf` is the black version). The logo is University of Bristol brand material: follow the
brand guidelines when using it.

## Scripts for making a new letter

`scripts/new-letter.ps1 foo` (Windows PowerShell) or `scripts/new-letter.sh foo`
(Linux/macOS) deploys the letter template into directory `./foo`.

This is achieved by cloning from GitHub over HTTPS, and then deleting all the
git-related information.

Place the script in a directory on your path, e.g. `C:\Users\USERNAME\scripts\`.
On Windows, add that directory to your path by adding the following command to
your PowerShell profile (`$profile`):

```
$env:PATH += ";C:\Users\USERNAME\scripts\"
```

On Linux/macOS, copy `new-letter.sh` somewhere on your `PATH` (e.g.
`~/.local/bin/new-letter`) and make it executable with `chmod +x`.
