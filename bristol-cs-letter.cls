\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bristol-cs-letter}[2023/01/30 Bristol CS letter]


%% Forward options to scrlttr2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrlttr2}}
\ProcessOptions\relax

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
%% set font
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

\RequirePackage[british]{babel}

%% University logo
\RequirePackage{graphicx}
\setkomavar{fromlogo}{
  \includegraphics[width = 16em]{UoB_RGB_24.png}
}

%% University font
\RequirePackage{fontspec}
\setsansfont[ExternalLocation=helvetica-neue/]{HelveticaNeue-Regular.otf}[
  BoldFont = HelveticaNeue-Bold.otf,
  ItalicFont = HelveticaNeue-RegularItalic.otf
]
\renewcommand{\familydefault}{\sfdefault} %% set main font to be the sans font


%% importing brand colours

\RequirePackage{bristol-colours}

%% Hyperref for links
\RequirePackage[pdfusetitle,hyperfootnotes=false]{hyperref}
\hypersetup{breaklinks=true, colorlinks=true,
  linkcolor=UniversityRed,
  urlcolor=UniversityRed,
  citecolor=UniversityRed
}
