\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{maucsthesis}[2018/03/01 Malmö University Computer Science Bachelor's Thesis LaTeX document style]


%% Custom package options
\DeclareOption{swedish}{
  \PassOptionsToPackage{\CurrentOption}{babel}
  \gdef\mau@lang{0}
}
\DeclareOption{english}{
  \PassOptionsToPackage{\CurrentOption}{babel}
  \gdef\mau@lang{1}
}
\DeclareOption{utf8}{
  \PassOptionsToPackage{\CurrentOption}{inputenc}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{maucsthesis}{Unknown option '\CurrentOption'}
}

% Execute any options passed
\ExecuteOptions{utf8}
\ProcessOptions\relax

% Load base document class and default pagesize and font size.
\LoadClass[a4paper,11pt]{article}

\RequirePackage{babel}
\RequirePackage{inputenc}

%
% Do not change
\textheight     = 220mm
\textwidth      = 150mm
\topmargin      =  10mm
\oddsidemargin  =   5.0mm
\evensidemargin =   5.0mm
\unitlength     =   5pt

% New \maketitle command defines:
%
% \swedishtitle{}
% \englishtitle{}
% \author{}
% \degree{}
% \subject{}
% \studyprogram{}
% \seminardate{}
% \supervisor{}
% \examiner{}

\gdef\@swetitle{Titel saknas, använd {\tt$\backslash$swedishtitle\{\ldots\}}}
\gdef\@engtitle{Title missing, use {\tt$\backslash$englishtitle\{\ldots\}}}
\gdef\@author{Author missing, use {\tt$\backslash$author\{Anna~Andersson $\tt\backslash$and Bo~Boelsson\}}}
\gdef\@level{grundnivå}
\gdef\@credits{15}
\gdef\@degree{degree missing, e.g. \mbox{\tt$\backslash$degree\{kandidatexamen 180hp\}}}
\gdef\@subject{subject missing, e.g. \mbox{\tt$\backslash$subject\{datavetenskap\}}}
\gdef\@program{program missing, e.g. \mbox{\tt$\backslash$studyprogram\{systemutvecklare\}}}
\gdef\@seminardate{\today}
\gdef\@supervisor{Supervisor missing, use \mbox{\tt$\backslash$supervisor\{\ldots\}}}
\gdef\@examiner{Examiner missing, use \mbox{\tt$\backslash$examiner\{\ldots\}}}

\newcommand{\swedishtitle}[1]{\gdef\@swetitle{#1}}
\newcommand{\englishtitle}[1]{\gdef\@engtitle{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\level}[1]{\gdef\@level{#1}}
\newcommand{\credits}[1]{\gdef\@credits{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
\newcommand{\studyprogram}[1]{\gdef\@program{#1}}
\newcommand{\seminardate}[1]{\gdef\@seminardate{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\examiner}[1]{\gdef\@examiner{#1}}

\renewcommand{\maketitle}{
  \begin{titlepage}
    \global\let\remembered@page\thepage
    \gdef\thepage{\relax}
    \renewcommand{\and}{\\}
    \mbox{}
    \vskip -55mm
    \hskip -5mm
    \begin{picture}(40,20)%
      \special{psfile=mau-logo.eps}%
    \end{picture}%
    \vskip -13mm
    \hfill
    \begin{minipage}[t]{15em}
      \large
      Teknik och samhälle\\
      Datavetenskap och medieteknik
    \end{minipage}
    \vskip 60mm
    \begin{center}
      {\bf\large Examensarbete}\par
      {\bf\small\@credits~högskolepoäng,~\@level}
      \vskip 25mm
      \if0\mau@lang{
        {\LARGE\@swetitle}
        \vskip 8mm
        {\large\@engtitle}
      }\else{
        {\LARGE\@engtitle}
        \vskip 8mm
        {\large\@swetitle}
      }\fi
      \vskip 12mm
      {\renewcommand{\baselinestretch}{1.4}\Large\@author\\}
    \end{center}
    \vfill
    \hskip -10mm
    \begin{minipage}[t]{19em}
      Examen:~\@degree\hfil\\
      Huvudområde:~\@subject\\
      Program:~\@program\\
      Datum för slutseminarium:~\@seminardate
    \end{minipage}
    \hfill
    \begin{minipage}[t]{17em}
      Handledare:~\@supervisor\\
      Examinator:~\@examiner
    \end{minipage}
  \end{titlepage}
%  \newpage
}

% \maketitle disables page counting
% \startpagecount 
% should be placed after toc, abstract and sammanfattning

\newcommand{\startpagecount}{
  \ifodd\value{page}\else\mbox{}\newpage\fi
  \setcounter{page}{1}
  \renewcommand{\thepage}{\remembered@page}
}

% Define \begin{sammanfattning} \end{sammanfattning} % to be used for abstract in swedish
\newenvironment{sammanfattning}{
  \ifodd\value{page}\else\mbox{}\newpage\fi
  \section*{Sammanfattning}
}{
  \newpage
}

\renewenvironment{abstract}{
  \ifodd\value{page}\else\mbox{}\newpage\fi
  \section*{Abstract}
}{
  \newpage
}

% end marker
\endinput

