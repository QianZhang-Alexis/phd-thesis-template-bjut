%!TEX root = ../thesis.tex
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Huangrui Mo <huangrui.mo@gmail.com>
%% This is free software: you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{bjutthesis}
  [2014/10/01 v1.0 bjutthesis
   document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Declare Options **************************************
%%
%% end-user parameters, each option is declared by one declare option command
\newif\ifBJUT@versioninfo \BJUT@versioninfofalse
\DeclareOption{draftversion}{% draft information reminder
  \BJUT@versioninfotrue%
}
\newif\ifBJUT@singlesided \BJUT@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
  \BJUT@singlesidedtrue%
}
\newif\ifBJUT@doublesided \BJUT@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
  \BJUT@doublesidedtrue%
}
\newif\ifBJUT@printcopy \BJUT@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
  \BJUT@doublesidedtrue% auto enable double-sided style
  \BJUT@printcopytrue%
}
\DeclareOption*{% handle non-implemented options
  \PassOptionsToClass{\CurrentOption}{ctexbook}%
}
%% terminates all options processing
\ProcessOptions\relax
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Loadclass Infomation *********************************
%%
\ifBJUT@doublesided% if double-sided printing enabled
  \LoadClass[UTF8,a4paper,twoside,fntef,12pt]{ctexbook}
\else% if double-sided printing isn't enabled
  \LoadClass[UTF8,a4paper,oneside,fntef,12pt]{ctexbook}
\fi
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Package Infomation *********************************
%%
%% color packages
\RequirePackage[usenames,dvipsnames,table]{xcolor}%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{Style/bjutthesis.cfg}{}{}
  \makeatother
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************
%%
%% part one -- horizontal widths
%% left side width + textwidth + right side width = paperwidth
%% left side width of [odd, even] page = [odd, even]sidemargin + 1.0in (fixed) + hoffset
%% binding side width + textwidth + nonbinding side width = paperwidth
%% binding side width of [odd, even] page = [left, right] side width
%% assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{150mm}% set required text width first
\ifBJUT@printcopy% if print copy layout enabled
  \setlength{\oddsidemargin}{10mm}% binding side width
  \setlength{\evensidemargin}{0mm}% ensure uniform binding side width for printing
\else
  \setlength{\oddsidemargin}{5mm}% left side width
  \setlength{\evensidemargin}{5mm}% ensure uniform left side width for EThesis
\fi
 %% set margin for notes to zero
\setlength{\marginparwidth}{0pt}% width of margin notes
\setlength{\marginparsep}{0pt}% width of space between body text and margin notes
%% part two -- vertical heights
%% top height + textheight + bottom height = paperheight
%% top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep
\setlength{\textheight}{240mm}% set required text height first
\setlength{\voffset}{-15mm}% set a minimum header height
\setlength{\headheight}{15pt}% set a minimum header height
%% specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%% line spacing
\renewcommand{\baselinestretch}{1.4} % line space setting
\raggedbottom % prevent adding vertical white space in strange places
%% default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%% redefine cleardoublepage to empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%% underline
\renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\def\BJUT@underline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\BJUTunderline{\@ifnextchar[\BJUT@underline\CJKunderline}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************** Chinese Titlepage Items ***********************************
%%
\newcommand\confidential[1]{\def\BJUT@value@confidential{#1}}
\newcommand\schoollogo[2]{\def\BJUT@value@schoollogo{\includegraphics[#1]{#2}}}
\renewcommand\title[2][\BJUT@value@title]{%
  \def\BJUT@value@title{#2}
  %\def\BJUT@value@titlemark{\MakeUppercase{#1}}}
  \def\BJUT@value@titlemark{#1}}
\def\@title{\BJUT@value@titlemark}
\renewcommand\author[1]{\def\BJUT@value@author{#1}}
\newcommand\advisor[1]{\def\BJUT@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\BJUT@value@advisorinstitute{#1}}
\newcommand\degree[1]{\def\BJUT@value@degree{#1}}
\newcommand\degreetype[1]{\def\BJUT@value@degreetype{#1}}
\newcommand\major[1]{\def\BJUT@value@major{#1}}
\newcommand\institute[1]{\def\BJUT@value@institute{#1}}
\newcommand\chinesedate[1]{\def\BJUT@value@chinesedate{#1}}
\newcommand\classifynumber[1]{\def\BJUT@value@classifynumber{#1}}
\newcommand\udc[1]{\def\BJUT@value@udc{#1}}
\newcommand\universityid[1]{\def\BJUT@value@universityid{#1}}
\newcommand\studentid[1]{\def\BJUT@value@studentid{#1}}
\newcommand\submitdate[1]{\def\BJUT@value@submitdate{#1}}
\newcommand\researcharea[1]{\def\BJUT@value@researcharea{#1}}
\newcommand\defenddate[1]{\def\BJUT@value@defenddate{#1}}
\newcommand\universityname[1]{\def\BJUT@value@universityname{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Cover Titlepage ******************************
%%
\newcommand\makecover{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \zihao{5}\bfseries\heiti
    \begin{tabular}{rl}
    \BJUT@label@classifynumber %\BJUTunderline[50pt] 
	& \BJUT@value@classifynumber \\
	\BJUT@label@udc %\BJUTunderline[50pt]
	&\BJUT@value@udc \\
	\BJUT@label@universityid 
	&\BJUT@value@universityid
	\end{tabular}
	\hfill{}
%    \hfill{} {\BJUT@label@confidential \BJUTunderline[50pt]{\zihao{5}\songti\BJUT@value@confidential}}
    \vskip \stretch{3}
      \BJUT@value@schoollogo
    \vskip \stretch{4}
      {\zihao{0}\heiti 博~士~学~位~论~文}%\BJUT@value@degree\BJUT@label@thesis}
    \vskip \stretch{1}
      {\zihao{2}\rmfamily \BJUT@label@engdegree~\BJUT@label@engthesis}
    \vskip \stretch{4}
%      {\zihao{3} \BJUTunderline{\ \BJUT@value@title\ }}
    \vskip \stretch{6}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.4}
    %\hskip -15pt
        \zihao{3}
    \begin{tabular}{lc}
     \makebox[6em][s]{论\hspace{\fill}文\hspace{\fill}题\hspace{\fill}目}： &\quad \BJUT@value@title \\
     \makebox[6em][s]{论\hspace{\fill}文\hspace{\fill}作\hspace{\fill}者}：  &\quad \BJUT@value@author %\BJUTunderline[295pt]{\BJUT@value@author}
    \\
     \makebox[6em][s]{学\hspace{\fill}科}：  & \BJUT@value@major
    \\
      \makebox[6em][s]{指\hspace{\fill}导\hspace{\fill}教\hspace{\fill}师}：  &\quad \BJUT@value@advisor 
    \\
      \makebox[6em][s]{论\hspace{\fill}文\hspace{\fill}提\hspace{\fill}交\hspace{\fill}日\hspace{\fill}期}：  &\quad \BJUT@value@submitdate
    \end{tabular}
    \vskip \stretch{6}
%    \BJUT@value@chinesedate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifBJUT@versioninfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \else
    \ifBJUT@versioninfo
      \thispagestyle{empty}
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
      \cleardoublepage
    \fi
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%
%%%%**************************** Make Chinese Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\zihao{5}\songti
  \begin{tabular}{rl}
      \BJUT@label@udc %\BJUTunderline[50pt]
& {\BJUT@value@udc} \\
    \BJUT@label@classifynumber %\BJUTunderline[50pt] 
& {\BJUT@value@classifynumber}
   \end{tabular}}
   \hfill{}
    {\zihao{5}\songti
    \begin{tabular}{rl}
      \BJUT@label@universityid %\BJUTunderline[50pt]
& {\BJUT@value@universityid} \\
    \BJUT@label@studentid %\BJUTunderline[50pt] 
& {\BJUT@value@studentid}
   \end{tabular}}
%    \vskip \stretch{3}
%      \BJUT@value@schoollogo
    \vskip \stretch{4}
      {\zihao{-1}\heiti \BJUT@label@universityname\BJUT@value@degree\BJUT@label@thesis}
	\vskip \stretch{4}
	
	\begin{tabular}{rl}
       \makebox[5em][s]{\zihao{4} \bfseries\songti 题\hspace{\fill}目}：&\zihao{4}\songti\BJUTunderline[250pt]{\ \BJUT@value@title\ } \\ 
      \vspace{0.5mm} \\
       \makebox[5em][s]{\zihao{4} \bfseries\songti 英\hspace{\fill}文\hspace{\fill}题\hspace{\fill}目}：&\zihao{4}\songti\BJUTunderline[250pt]{\ \BJUT@value@englishtitle\ }
      \end{tabular}
    \vskip \stretch{6}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.4}
    %\hskip -15pt
    \begin{minipage}{0.75\linewidth}
    \begin{tabular}{rl}
     \makebox[8em][s]{\zihao{4} \bfseries\songti 论\hspace{\fill}文\hspace{\fill}作\hspace{\fill}者}： &\quad \zihao{4}\fangsong\BJUT@value@author%\BJUTunderline[295pt]{\BJUT@value@author}
    \\
      \makebox[8em][s]{\zihao{4} \bfseries\songti 学\hspace{\fill}科\hspace{\fill}专\hspace{\fill}业}： &\quad \zihao{4}\fangsong\BJUT@value@major%\BJUTunderline[295pt]{\BJUT@value@advisor}
    \\
      %& \BJUTunderline[295pt]{\BJUT@value@advisorinstitute}  \\
       \makebox[8em][s]{\zihao{4} \bfseries\songti 研\hspace{\fill}究\hspace{\fill}方\hspace{\fill}向}： &\quad \zihao{4}\fangsong\BJUT@value@researcharea
      \\      
      \makebox[8em][s]{\zihao{4} \bfseries\songti 申\hspace{\fill}请\hspace{\fill}学\hspace{\fill}位}： &\quad \zihao{4}\fangsong\BJUT@value@degreetype\BJUT@value@degree 
          \\
       \makebox[8em][s]{\zihao{4} \bfseries\songti 指\hspace{\fill}导\hspace{\fill}教\hspace{\fill}师}： &\quad  \zihao{4}\fangsong\BJUT@value@advisor%\BJUTunderline[295pt]{\BJUT@value@major}
    \\
      \makebox[8em][s]{\zihao{4} \bfseries\songti 所\hspace{\fill}在\hspace{\fill}单\hspace{\fill}位}： &\quad \zihao{4}\fangsong\BJUT@value@institute	\\
       \makebox[8em][s]{\zihao{4} \bfseries\songti 答\hspace{\fill}辩\hspace{\fill}日\hspace{\fill}期}：  &\quad \zihao{4}\fangsong\BJUT@value@defenddate     \\
       \makebox[8em][s]{\zihao{4} \bfseries\songti 学\hspace{\fill}位\hspace{\fill}授\hspace{\fill}予\hspace{\fill}单\hspace{\fill}位}：&\quad \zihao{4}\fangsong\BJUT@value@universityname
      \end{tabular}
      \end{minipage}
    \vskip \stretch{1}
%    \BJUT@value@chinesedate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifBJUT@versioninfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \else
    \ifBJUT@versioninfo
      \thispagestyle{empty}
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
      \cleardoublepage
    \fi
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** English Titlepage Items **********************************
%%
\newcommand\englishtitle[1]{\def\BJUT@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\BJUT@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\BJUT@value@englishadvisor{#1}}
\newcommand\englishdegree[1]{\def\BJUT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\BJUT@value@englishmajor{#1}}
\newcommand\englishinstitute[1]{\def\BJUT@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\BJUT@value@englishdate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** Make English Titlepage ***********************************
%%
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \zihao{3}\bfseries
    \vspace*{20pt} 
    {\BJUTunderline{\BJUT@value@englishtitle}}
    \vskip \stretch{1}
    By \\
    \BJUT@value@englishauthor
    \vskip \stretch{2}
    Supervisor \\
    \BJUT@value@englishadvisor
    \vskip \stretch{3}
    \zihao{4}\bfseries
    \BJUT@label@englishstatement
    \vskip 30pt
    \BJUT@value@englishinstitute
    \vskip 20pt
    \BJUT@value@englishdate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** Make Author Declaration ***********************************
%%
\newcommand\makedeclaration{%
  \cleardoublepage
  \thispagestyle{empty}

  \begin{center}
      {\zihao{3}\heiti \BJUT@value@declare@create}
  \end{center}

  \BJUT@value@declare@creativity\\

 %- \hfill{} {\BJUT@value@declare@s \BJUTunderline[70pt]{ } \ \ \BJUT@value@declare@d \BJUTunderline[70pt]{ }}\\
  \vspace*{3ex}
  	\hfill{}
	\begin{tabular}{l}
        {\BJUT@value@declare@s \BJUTunderline[100pt]{}} \\ 
	{\BJUT@value@declare@d \hspace{8mm} 年 \hspace{5mm} 月 \hspace{5mm} 日}
	\end{tabular}
 %       \vspace*{6ex}

%---
  \vskip 120pt

  \begin{center}
      {\zihao{3}\heiti \BJUT@value@declare@right}
  \end{center}

  \BJUT@value@declare@rights

  { \BJUT@value@declare@rule}\\

%-----

        \vspace*{2ex}

        {\hfill{} {\BJUT@value@declare@s\BJUTunderline[100pt]{} \hspace*{4em} 
        \BJUT@value@declare@d \hspace{8mm} 年 \hspace{5mm} 月 \hspace{5mm} 日\hspace*{1em}}}
        
	\vspace*{2ex} 
	
        {\hfill{} {\BJUT@value@declare@t\BJUTunderline[100pt]{} \hspace*{4em} 
        \BJUT@value@declare@d \hspace{8mm} 年 \hspace{5mm} 月 \hspace{5mm} 日\hspace*{1em}}}

        \vspace*{3ex}
    }

  %- \hfill{} 
  %- {\BJUT@value@declare@s \BJUTunderline[70pt]{ } \ \ \BJUT@value@declare@t \BJUTunderline[70pt]{ } \ \ \BJUT@value@declare@d \BJUTunderline[70pt]{ }}

 % -----
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
%}
%%%%% --------------------------------------------------------------------------------
%%
%%%%****************************** New Environments **********************************
%%
%% define chinese abstract
\newenvironment{abstract}
{\chapter[\BJUT@label@abstract]{
     {\zihao{3}\heiti \BJUT@value@title}
     \vskip 25pt
     {\zihao{-3}\heiti \BJUT@label@abstract}
  }}
  {}
%% define chinese keywords
\newcommand\keywords[1]{%
    \vspace{2ex}\noindent{\zihao{4}\heiti \BJUT@label@keywords} #1}
%% define engish abstract
\newenvironment{englishabstract}
{\chapter[\BJUT@label@englishabstract]{
     {\zihao{3}\bfseries \BJUT@value@englishtitle}
     \vskip 25pt
     {\zihao{-3}\bfseries \BJUT@label@englishabstract}
  }}
  {}
%% define engish keywords
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\zihao{4}\bfseries \BJUT@label@englishkeywords} #1}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Dotted Line in TOC **********************************
%%
%% define spacing and length
\def\@dotsep{1.5mu}% spacing for dots
\def\@pnumwidth{2em}% spacing between titles and page numbers
\def\@tocrmarg{2em}% right margin indentation
\def\@chaptervspace{8bp}% spacing between chapter titles
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par\penalty\@highpenalty}%
  \fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1
       \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip \@chaptervspace \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
