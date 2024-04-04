# Bristol CS Letter class

Designed to some extent according to the [university brand guidelines](https://uob.sharepoint.com/sites/marketing/SitePages/Brand-guidlines.aspx).

- Based on the KOMA-script `scrlttr2` class for letters.
- Simple `latexmkrc` file included to help `latexmk` go.

This is a template, so try the "Use this template" button to make a new repo.

## Windows script for making new letter

The PowerShell script `new-letter.ps1 foo` will deploy the letter template in directory `.\foo`.

This is achieved by cloning from GitHub, and then deleting all the git-related information.

Place it in a directory, e.g. `C:\Users\USERNAME\scripts\`. Then add that
directory to your path by adding the following command to your PowerShell
profile (`$profile`):

```
$env:PATH += ";C:\Users\USERNAME\scripts\"
```
