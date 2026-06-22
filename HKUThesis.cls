%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Masters/Doctoral Thesis 
% Class File
% Version 3.0 (01/07/2020)
% 
% Version 2.x major modifications by:
% Vel (vel@latextemplates.com)
% 
% This template is based on the template by:
% Steve Gunn (http://users.ecs.soton.ac.uk/srg/softwaretools/document/templates/)
% Sunil Patel (http://www.sunilpatel.co.uk/thesis-template/)
% Johannes Böttcher (http://www.latextemplates.com/template/masters-doctoral-thesis)
%
% Notes:
% 1) This class file defines the structure and layout of the template file (main.tex).
% 2) It has been written in such a way that under most circumstances you should not need to edit it; updating it to a newer version will be harder. If you do make changes, please change the name of the file and add comments to make your changes more visible.
% 
% Template license:
% CC BY-NC-ND 4.0 (https://creativecommons.org/licenses/by-nc-nd/4.0/)
% 
% Author:  Nan Meng
% Contact: u3003637@connect.hku.hk
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HKUThesis}[2020/07/01 HKU Thesis v1.0]
\newcommand{\classname}{HKUThesis}
\providecommand{\baseclass}{book}

\RequirePackage{etoolbox}
\RequirePackage{xparse}
\newbool{nolistspace}
\newbool{chapteroneline}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}
\newbool{consistentlayout}

\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\LoadClass{\baseclass}

\newcommand\iraggedright{%
  \let\\\@centercr\@rightskip\@flushglue \rightskip\@rightskip
  \leftskip\z@skip}
  
%  Simple interface for the user to customize the chapter titles
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{-43.5pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{9pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{-18pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\centering}
\ProvideDocumentCommand{\chapterfont}{}{\normalfont\fontsize{16pt}{36pt}\selectfont\bfseries}
\ProvideDocumentCommand{\chaptertitlefont}{}{\normalfont\fontsize{16pt}{36pt}\selectfont\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\normalfont\fontsize{16pt}{36pt}\selectfont\bfseries}
\ProvideDocumentCommand{\frontmatterheadingfont}{}{\normalfont\fontsize{16pt}{18pt}\selectfont\bfseries}
\ProvideDocumentCommand{\appendixheadingfont}{}{\normalfont\fontsize{14pt}{18pt}\selectfont\bfseries}
\ProvideDocumentCommand{\appendixsectionheadingfont}{}{\normalfont\fontsize{11pt}{18pt}\selectfont\bfseries\itshape}
\ProvideDocumentCommand{\sectionheadingfont}{}{\normalfont\fontsize{14pt}{18pt}\selectfont\bfseries}
\ProvideDocumentCommand{\subsectionheadingfont}{}{\normalfont\fontsize{12pt}{18pt}\selectfont\bfseries}
\ProvideDocumentCommand{\subsubsectionheadingfont}{}{\normalfont\fontsize{11pt}{18pt}\selectfont\bfseries}
\newif\ifHKU@inappendix
\pretocmd{\appendix}{\HKU@inappendixtrue}{}{}
\newcommand{\HKU@sectionheading}[1]{%
	\ifHKU@inappendix
		{\appendixsectionheadingfont #1}%
	\else
		{\sectionheadingfont\MakeUppercase{#1}}%
	\fi
}
\renewcommand\@seccntformat[1]{%
  \ifHKU@inappendix
    \ifstrequal{#1}{section}{Appendix \csname the#1\endcsname\quad}{\csname the#1\endcsname.\quad}%
  \else
	    \csname the#1\endcsname.\quad
	  \fi
	}
\ProvideDocumentCommand{\paragraphheadingfont}{}{\normalfont\normalsize}
\ProvideDocumentCommand{\subparagraphheadingfont}{}{\normalfont\normalsize\itshape}
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {16pt \@plus 1ex \@minus .2ex}%
  {3pt \@plus .2ex}%
  {\HKU@sectionheading}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {3pt\@plus 1ex \@minus .2ex}%
  {3pt \@plus .2ex}%
  {\subsectionheadingfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {3pt\@plus 1ex \@minus .2ex}%
  {3pt \@plus .2ex}%
  {\subsubsectionheadingfont}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\paragraphheadingfont}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\subparagraphheadingfont}}
\DeclareDocumentCommand{\@makechapterhead}{ m }{%
	\ifHKU@inappendix
			\ifnum\value{chapter}=1
				\abovechapterskip
				{\parindent \z@ \centering \normalfont
					\chapterfont APPENDIXES\par\nobreak
					\vspace*{-9.4pt}
				}
			\else
				\vspace*{-35.2pt}
			\fi
		{\parindent \z@ \normalfont
			\appendixheadingfont
			\noindent\makebox[96pt][l]{Appendix \thechapter}#1\par\nobreak
			\vspace*{18pt}
		}
		\thispagestyle{\chapter@p@gestyle}
	\else
		\abovechapterskip
		{\parindent \z@ \chapteralign \normalfont
			\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\ifbool{chapteroneline}{%
			\chapterfont \mdtChapapp\thechapter\autodot\enspace
		}{%
				\chapterprefixfont \MakeUppercase{\@chapapp}\space \thechapter
			\par\nobreak
			\chapterinbetweenskip
		}%
		\fi
		\fi
		\interlinepenalty\@M%
			\chaptertitlefont #1\par\nobreak
		\chapterbelowskip
		}
		\thispagestyle{\chapter@p@gestyle}
	\fi
}
\def\@chapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%
			\typeout{\@chapapp\space\thechapter.}%
			\ifHKU@inappendix
				\ifnum\value{chapter}=1
					\ifdef{\phantomsection}{\phantomsection}{}%
					\addcontentsline{toc}{chapter}{APPENDIXES}%
				\fi
				\ifdef{\phantomsection}{\phantomsection}{}%
					\addcontentsline{toc}{section}{Appendix \thechapter\texorpdfstring{\quad}{ }#1}%
			\else
				\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
			\fi
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\if@twocolumn
		\@topnewpage[\@makechapterhead{#2}]%
	\else
		\@makechapterhead{#2}%
		\@afterheading
	\fi}
\def\@makeschapterhead#1{%
		\abovechapterskip
		{\parindent \z@ \chapteralign
			\normalfont
			\interlinepenalty\@M
			\chapterfont  #1\par\nobreak
			\vspace*{-4pt}
		}
		\thispagestyle{\chapter@p@gestyle}
	}

% Add blank page
\def\blankpage{%
      \clearpage%
      \thispagestyle{empty}%
      \null%
      \clearpage}


% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------
%	DEFINITION OF LIST OF PUBLICATIONS
%----------------------------------------------------------------------------------------
\RequirePackage{enumitem} % Required for listing the journal and conference items
\setlist[itemize]{topsep=0pt, itemsep=0pt, parsep=0pt, partopsep=0pt, before=\vspace{-\parskip}, after=\vspace{-\parskip}}
\setlist[enumerate]{topsep=0pt, itemsep=0pt, parsep=0pt, partopsep=0pt, before=\vspace{-\parskip}, after=\vspace{-\parskip}}

\newenvironment{publications}{
    \chapter*{}
    \vspace{-1em}
    {\Huge \textbf{List of Publications}}\\
}

\newenvironment{journals}[1][,]{
    \vspace{1cm}
    \textbf{\darkred{\Large\scshape Journals:}}\\[0.25em]
    \begin{enumerate}[topsep=0pt, label={[\darkred{\arabic*}]}, #1]}{\end{enumerate}
}

\newenvironment{conferences}[1][,]{
    \vspace{1cm}
    \textbf{\darkred{\Large\scshape Conferences:}}\\[0.25em]
    \begin{enumerate}[topsep=0pt, label={[\darkred{\arabic*}]}, #1]}{\end{enumerate}
}

\newenvironment{patents}[1][,]{
    \vspace{1cm}
    \textbf{\darkred{\Large\scshape Patents:}}\\[0.25em]
    \begin{enumerate}[topsep=0pt, label={[\darkred{\arabic*}]}, #1]}{\end{enumerate}
}

\newenvironment{datasets}[1][,]{
    \vspace{1cm}
    \textbf{\darkred{\Large\scshape Datasets:}}\\[0.25em]
    \begin{enumerate}[topsep=0pt, label={[\darkred{\arabic*}]}, #1]}{\end{enumerate}
}

%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}} % If the parskip option is passed to the class, require the parskip package 


\ifbool{listtoc}{% If the liststotoc option has been passed to the class, add the lists to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
	\patchcmd{\listofalgorithms}{\@starttoc{lot}}{%
		\addchaptertocentry{\listalgorithmcfname}\@starttoc{lot}%
	}{}{}%
}

\ifbool{toctoc}{% If the toctotoc options has been passed to the class, add the table of contents to the table of contents
	\patchcmd{\tableofcontents}{\@starttoc{toc}%
}{%
	\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
}

\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listofalgorithms}{\MakeUppercase}{\MakeMarkcase}{}{}
		\patchcmd{\tableofcontents}{%
			\@starttoc{toc}%
		}{%
			\begingroup\emergencystretch=3em\setlength{\parskip}{0pt}\fontsize{12pt}{18pt}\selectfont\vspace*{12pt}\@starttoc{toc}\endgroup%
		}{}{}
		\patchcmd{\listoftables}{%
			\@starttoc{lot}%
		}{%
			\begingroup\emergencystretch=3em\setlength{\parskip}{0pt}\fontsize{12pt}{18pt}\selectfont\vspace*{12pt}\let\addvspace\@gobble\@starttoc{lot}\endgroup%
		}{}{}
		\patchcmd{\listoffigures}{%
			\@starttoc{lof}%
		}{%
			\begingroup\emergencystretch=3em\setlength{\parskip}{0pt}\fontsize{12pt}{18pt}\selectfont\vspace*{12pt}\let\addvspace\@gobble\@starttoc{lof}\endgroup%
		}{}{}

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\listofalgorithms}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}


%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage{babel} % Required for automatically changing names of document elements to languages besides english

\RequirePackage{datetime}

\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

\RequirePackage{scrhack} % Loads fixes for various packages

\RequirePackage{setspace} % Required for changing line spacing

\RequirePackage{longtable} % Required for tables that span multiple pages (used in the symbols, abbreviations and physical constants pages)

\RequirePackage{graphbox} % Required for alignment of logo figure and text

\RequirePackage{siunitx} % Required for \SI commands

\RequirePackage{graphicx} % Required to include images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images

\RequirePackage{booktabs} % Required for better table rules

\RequirePackage{soul} % Required for under line

\RequirePackage{multirow} % Required for multi-row in table environment

\RequirePackage{multicol} % Required for multi-column in table environment

\RequirePackage{amsmath} % Required for math commands

\RequirePackage{amssymb} % Required for some math symbols, like ``checkmark''

\RequirePackage{caption} % Required for customising the captions
\RequirePackage[labelformat=simple,font=small]{subcaption}
\captionsetup{justification=centering,font=small,labelfont=normalfont,labelsep=space,margin=0pt}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand\thesubfigure{(\alph{subfigure})} % change the image numbering and reference link to (a),(b),(c), ...... format
\newcommand*\HKU@listentry[3]{%
	\ifnum \c@tocdepth >\z@
			\begingroup
				\parindent \z@ \rightskip \@pnumwidth
				\parfillskip -\@pnumwidth
				\def\numberline##1##2{%
					\settowidth{\@tempdima}{#3~9-99\enspace}%
					\hangindent\@tempdima
					\hangafter 1
					\noindent\makebox[\@tempdima][l]{#3~##1}##2%
				}%
			#1\nobreak
			\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
			\nobreak\hb@xt@\@pnumwidth{\hss #2\kern-\p@\kern\p@}\par
		\endgroup
	\fi}
\renewcommand*\l@table[2]{\HKU@listentry{#1}{#2}{Table}}
\renewcommand*\l@figure[2]{\HKU@listentry{#1}{#2}{Figure}}

\RequirePackage[ruled, linesnumbered]{algorithm2e}
%----------------------------------------------------------------------------------------
%	COLOURS
%----------------------------------------------------------------------------------------

\RequirePackage{xcolor} % Required for specifying custom colours
\definecolor{brightcerulean}{rgb}{0.11, 0.67, 0.84}
\definecolor{bondiblue}{rgb}{0.0, 0.58, 0.71}
\definecolor{darkspringgreen}{rgb}{0.09, 0.45, 0.27}
\definecolor{darkred}{rgb}{0.55, 0.0, 0.0}
\colorlet{mdtRed}{red!50!black}

\newcommand{\brightblue}[1]{\textcolor{bondiblue}{#1}}
\newcommand{\darkgreen}[1]{\textcolor{darkspringgreen}{#1}}
\newcommand{\darkred}[1]{\textcolor{darkred}{#1}}
\newcommand{\black}[1]{\textcolor{black}{#1}}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}
\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\green}[1]{\textcolor{green}{#1}}
\newcommand{\magenta}[1]{\textcolor{magenta}{#1}}
\newcommand{\cyan}[1]{\textcolor{cyan}{#1}}
\newcommand{\yellow}[1]{\textcolor{yellow}{#1}}
\newcommand{\orange}[1]{\textcolor{orange}{#1}}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM THESIS INFORMATION COMMANDS
%----------------------------------------------------------------------------------------

\NewDocumentCommand{\thesistitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{{#1}}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\cosupervisor}{m}{\newcommand{\cosupname}{#1}}
\NewDocumentCommand{\examiner}{m}{\newcommand{\examname}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreename}{#1}}
\NewDocumentCommand{\addresses}{m}{\newcommand{\addressname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\bsuniversity}{m}{\newcommand{\bsunivname}{#1}}
\NewDocumentCommand{\msuniversity}{m}{\newcommand{\msunivname}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\group}{m}{\newcommand{\groupname}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facname}{#1}}
\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{#1}}
\NewDocumentCommand{\keywords}{m}{\newcommand{\keywordnames}{#1}}
% \newcommand{\monthyeardate}{\DTMenglishmonthname{\@dtm@month},\@dtm@year}
\newdateformat{monthyeardate}{\monthname[\THEMONTH], \THEYEAR}
\providecommand{\submissionmonthyear}{TODO Month Year}

\newcommand{\checktoopen}{% New command to move content to the next page which prints to the next odd page if twosided mode is active  
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}} % New command to make the lines in the title page
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\setcounter{tocdepth}{3} % The depth to which the document sections are printed to the table of contents
\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{\MakeUppercase{#1}}%
}
\renewcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\setlength\@tempdima{6.8em}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode \bfseries
			\renewcommand{\numberline}[1]{%
				\hb@xt@\@tempdima{%
					\ifcat a##1%
						Appendix ##1%
					\else
						CHAPTER ##1%
					\fi
					\hfil
				}%
			}%
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			#1\nobreak
			\leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
			\nobreak\hb@xt@\@pnumwidth{\hss #2\kern-\p@\kern\p@}\par
			\penalty\@highpenalty
		\endgroup
	\fi}
\renewcommand{\numberline}[1]{\hb@xt@\@tempdima{#1.\hfil}}
\renewcommand*\l@section{\@dottedtocline{1}{24pt}{48pt}}
\renewcommand*\l@subsection{\@dottedtocline{2}{48pt}{48pt}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{72pt}{72pt}}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM NEW COMMAND
%----------------------------------------------------------------------------------------
\newcommand{\etal}[1]{#1~\textit{et al.}}
\newcommand{\figref}[1]{Fig.~\ref{#1}}
\newcommand{\equref}[1]{Eq.~\ref{#1}}
\newcommand{\tabref}[1]{Table~\ref{#1}}
\newcommand{\chapref}[1]{Chapter~\ref{#1}}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM MATH COMMAND
%----------------------------------------------------------------------------------------
\DeclareMathOperator{\hadamardtimes}{\odot}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM COPYRIGHT PAGE
%----------------------------------------------------------------------------------------

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\scshape \noindent Copyright \copyright 2020, by \authorname \\
	\noindent all rights reserved.
	\vspace*{\fill}
	\newpage
	\rm
}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\RequirePackage{geometry}
\geometry{
	headheight=14pt,
	headsep=0pt,
	footskip=8.6mm,
	ignorehead,
	ignorefoot
}

\flushbottom

%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\ofoot*{\normalfont\fontsize{10pt}{12pt}\selectfont\pagemark\hspace*{2.7pt}}% Right footer page number, including plain pages
}
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\authorname]{\shorttitle/\authorname}
	\ifoot[\submissionmonthyear]{\submissionmonthyear}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
incompatible\MessageBreak with this class}{The pagesyles are defined 
	using package `scrlayer-scrpage', please consult the\MessageBreak 
KOMA-script documentation for details.}]{fancyhdr}


\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space is
	obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

%----------------------------------------------------------------------------------------
%	ABBREVIATIONS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\abbrevname}{LIST OF ABBREVIATIONS}
\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\providecaptionname{ngerman,german,austrian,naustrian}{\abbrevname}{Abk\"urzungsverzeichnis}
\NewDocumentEnvironment{abbreviations}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{LIST OF ABBREVIATIONS}}{\addchap*{LIST OF ABBREVIATIONS}}
	\vspace*{22pt}
	\HKUAbbreviationsTabletrue
	\setlength\LTleft{0pt}
	\setlength\LTright{0pt}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\HKUAbbreviationsTablefalse
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------

\DeclareDocumentCommand{\abstractauthorfont}{}{}
\DeclareDocumentCommand{\abstracttitlefont}{}{}
\newcommand{\byname}{by}
\newcommand{\abstractname}{Abstract}
\providecaptionname{german,ngerman,austrian,naustrian}{\byname}{von}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\byname}{\textit{submitted by}}
\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{abstract}{ O{} }{%
		\addchap*{\abstractname}%
		{\chapteralign\normalsize\abstractauthorfont \authorname \par}% Author name
		\vspace{\baselineskip}
		{\chapteralign\parbox{.7\linewidth}{\chapteralign\normalsize\itshape\abstracttitlefont\@title}\par}% Thesis title
		\bigskip\noindent\ignorespaces
	}%
	{}%end alt-abstract
}
% =====================================================================
%                          Original Settings                           
% =====================================================================
% {%
% 	\DeclareDocumentEnvironment{abstract}{ O{\null} }{
% 		\checktoopen
% 		\tttypeout{\abstractname}
% 		#1%added to be able to have abstract more than one page long
% 		\thispagestyle{plain}
% 		\begin{center}
% 		    \vspace{-1em}
% % 			{\normalsize \MakeUppercase{\univname} \par}% University name in capitals
% % 			\bigskip
%             {\Huge\textit{\darkred{\abstractname}} \par}
% 			{\normalsize \textit{of thesis entitled} \par}% Abstract name
% % 			\bigskip
% 			{\Large\bfseries \@title \par}% Thesis title
%             \hspace{.8cm}
%             \begin{tabular}{rl}
%             \byname{} & \darkred{\authorname} \\
%             \textit{for the degree of} & \darkred{\degreename} \\
%             \textit{at} & \darkred{\MakeUppercase{\univname}} \\
%             \textit{in} & \monthyeardate\darkred{\today} \\
%             \end{tabular}
% 			\bigskip
% 		\end{center}
% 	}
% 	{
% 		\vfill\null
% 	}
% }
% =====================================================================
{%
		\DeclareDocumentEnvironment{abstract}{ O{} }{
			\checktoopen
			\tttypeout{\abstractname}
			\pagestyle{empty}
			{\setlength{\parskip}{0pt}
			\begin{center}
			    \vspace*{-18pt}
	            {\fontsize{11pt}{18pt}\selectfont\MakeUppercase{\abstractname}~of the thesis entitled \par}
				{\fontsize{14pt}{18pt}\selectfont\bfseries\MakeUppercase{\@title} \par}% Thesis title
	            \vspace{18pt}
	            {Submitted by \par}
	            {\textbf{\authorname} \par}
	            {for the degree of \degreename \par}
	            {at \univname \par}
	            {in \submissionmonthyear \par}
				\vspace{0pt}
			\end{center}
			}
				\vspace*{-18pt}\ignorespaces
		}
	{
			\ifblank{#1}{}{%
				\par\bigskip
				\begin{center}
					\rule{0.75\textwidth}{1.2pt}\\
					{\bfseries\itshape An abstract of #1 words\par}
				\end{center}
			}
			\thispagestyle{empty}
			\vfill\null
		}
	}
\DeclareDocumentEnvironment{extraAbstract}{ O{\null\vfill} }{
	\checktoopen
	\tttypeout{\abstractname}
	#1%added to be able to have abstract more than one page long
	\thispagestyle{empty}
	\begin{center}
		{\normalsize \MakeUppercase{\univname} \par}% University name in capitals
		\bigskip
		{\huge\textit{\abstractname} \par}
		\bigskip
		{\normalsize \facname \par}% Faculty name
		{\normalsize \deptname \par}% Department name
		\bigskip
		{\normalsize \degreename\par}% Degree name
		\bigskip
		{\normalsize\bfseries \@title \par}% Thesis title
		\medskip
		{\normalsize \byname{} \authorname \par}% Author name
		\bigskip
	\end{center}
}
{
	\vfill\null
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------

% \usepackage{xcolor}
% \colorlet{mdtRed}{red!50!black}
\newcommand{\acknowledgementname}{Acknowledgements}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish} {\acknowledgementname}{Acknowledgements} % Acknowledgement text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\acknowledgementname}{Danksagung} % Acknowledgement text for Germanic countries

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{acknowledgements}{}{%
		\tttypeout{\acknowledgementname}
		\addchap*{\acknowledgementname}
	}
}
	{
			\DeclareDocumentEnvironment{acknowledgements}{}{%
				\checktoopen
				\tttypeout{\acknowledgementname}
				\thispagestyle{plain}
					{\setlength{\parskip}{0pt}\begin{center}\vspace*{-8pt}{\frontmatterheadingfont\MakeUppercase{\acknowledgementname}\par}\end{center}}
			}
		{
			\vfil\vfil\null
	}
}

%----------------------------------------------------------------------------------------
%	DECLARATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\authorshipname}{Declaration}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\authorshipname}{Declaration} % Declaration of Authorship text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\authorshipname}{Eidesstattliche Erkl\"arung} % Declaration of Authorship text for Germanic countries

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{declaration}{}{
		\addchap*{\authorshipname}
		}{}%
}{
				\DeclareDocumentEnvironment{declaration}{}{
					\checktoopen
					\tttypeout{\authorshipname}
					\thispagestyle{plain}
						{\setlength{\parskip}{0pt}\begin{center}\vspace*{-8pt}{\frontmatterheadingfont\MakeUppercase{\authorshipname}\par}\end{center}}
					\vspace*{-22pt}
				}{}
			}

%----------------------------------------------------------------------------------------
%	DEDICATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\ifbool{consistentlayout}{
	\DeclareDocumentCommand{\dedicatory}{
		m O{\vspace*{.7\textheight} }  }{
			\checktoopen\tttypeout{Dedicatory}
			\markboth{}{}
			#2
			{\hfill\parbox{.4\textwidth}{\flushright#1\par}}
		}
}{
	\newcommand\dedicatory[1]{
		\checktoopen
		\tttypeout{Dedicatory}
		\null\vfil
		\thispagestyle{plain}
		\begin{center}{\Large\slshape #1}\end{center}
		\vfil\null
	}
}


%----------------------------------------------------------------------------------------
%	PHYSICAL CONSTANTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\constantsname}{Physical Constants}
\providecaptionname{english,british,american}{\constantsname}{Physical Constants}
\providecaptionname{ngerman,german,austrian,naustrian}{\constantsname}{Physikalische Konstanten}

\NewDocumentEnvironment{constants}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\constantsname}}{\addchap*{\constantsname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\symbolsname}{List of Symbols}
\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{ngerman,german,austrian,naustrian}{\symbolsname}{Symbolverzeichnis}

\NewDocumentEnvironment{symbols}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\symbolsname}}{\addchap*{\symbolsname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

\newcommand{\symboltitle}[1]{\textbf{\large #1}}
%----------------------------------------------------------------------------------------

\ifbool{hyperrefsupport}{% If the nohyperref class option has not been specified
\AtEndPreamble{\RequirePackage{hyperref}
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
colorlinks=true,% Keep links clickable without colored boxes
allcolors=black,% Print link, citation, and URL text in normal black
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{% If there is an explicit linebreak in a section heading (or anything printed to the pdf-bookmarks), it is replaced by a space
	\let\\\space%
}
	}
}{%nothing
}

%----------------------------------------------------------------------------------------

\endinput
% lazyLizardTracer
