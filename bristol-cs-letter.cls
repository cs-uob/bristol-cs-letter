\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bristol-cs-letter}[2026/10/16 Bristol CS letter]


%% Option: use the black logo instead of the colour one
\newif\if@uobblacklogo
\DeclareOption{blacklogo}{\@uobblacklogotrue}

%% Forward options to scrlttr2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrlttr2}}
\ProcessOptions\relax

\RequirePackage[british]{babel}

%% KOMA class loading and UK letter options
\LoadClass[
  fromalign=right,
  fromlogo,
  enlargefirstpage,
  firstfoot=false,
  backaddress=false,
  subject=beforeopening,
  version=last
]{scrlttr2}

%% remove "email" and "phone" words
\setkomavar*{fromemail}{}
\setkomavar*{fromphone}{}

%% put addresses and logo within margins
\setplength{firstheadwidth}{\textwidth}
%% add margin to top
\newlength{\extratopmargin}
\setlength{\extratopmargin}{10ex}
\addtoplength{firstheadvpos}{\extratopmargin}
\addtoplength{toaddrvpos}{\extratopmargin}
\addtoplength{locvpos}{\extratopmargin}
\addtoplength{refvpos}{\extratopmargin}

%% align signature left
\renewcommand*{\raggedsignature}{\raggedright}

%% moving address to left margin of text
%% code from https://tex.stackexchange.com/questions/64690/aligning-address-with-body-of-letter-in-scrlttr2
\setplength{toaddrhpos}{\oddsidemargin}
\addtoplength{toaddrhpos}{1in}

%% University logo (official vector PDF; artbox crops the A4 page to the logo)
\RequirePackage{graphicx}
\setkomavar{fromlogo}{%
  \includegraphics[width = 16em, pagebox=artbox]{%
    \if@uobblacklogo UoB_Black_24.pdf\else UoB_RGB_24.pdf\fi}%
}

%% Old University font
%\RequirePackage{fontspec}
%\setsansfont[ExternalLocation=helvetica-neue/]{HelveticaNeue-Regular.otf}[
%  BoldFont = HelveticaNeue-Bold.otf,
%  ItalicFont = HelveticaNeue-RegularItalic.otf
%]
%\renewcommand{\familydefault}{\sfdefault} %% set main font to be the sans font

%% Previous University font (April 2024 onwards): Inter
%\RequirePackage[sfdefault]{inter}

%% Current University font: Open Sans
\RequirePackage[default]{opensans}
\RequirePackage[T1]{fontenc}


%% importing brand colours

\RequirePackage{bristol-colours}

%% Hyperref for links
\RequirePackage[pdfusetitle,hyperfootnotes=false]{hyperref}
\hypersetup{breaklinks=true, colorlinks=true,
  linkcolor=UniversityRed,
  urlcolor=UniversityRed,
  citecolor=UniversityRed
}
