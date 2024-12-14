%-----------------------------------------------------------
%------------------------ Intro Options
%-----------------------------------------------------------
\ProvidesClass{resume-cv}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-----------------------------------------------------------
%------------------------ Packages
%-----------------------------------------------------------
% \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% \if-\then-\else statement
\RequirePackage{xifthen}
% Geometry & margin
% alternative: \usepackage[hmargin=1.5cm, vmargin=0.75cm, rmargin=1.5cm]{geometry}
\RequirePackage{geometry}
% Handle text alignment
\RequirePackage{ragged2e}
% Color
\usepackage[dvipsnames]{xcolor}
% Fonts
\usepackage{fontspec}
% Fontawesome5 Icons (https://mirror.easyname.at/ctan/fonts/fontawesome5/doc/fontawesome5.pdf)
\RequirePackage{fontawesome5}
% Hyperlinks
\usepackage[
	colorlinks=false, 
	urlbordercolor={Gray}
	]{hyperref}%hidelinks
% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}
% Section seperators
\usepackage{titlesec}
% Adjustbox for profile image
\usepackage[export]{adjustbox}
% Tabularx for automatic \textwidth linebreaks
\usepackage{tabularx}
% Gen dummy text
\usepackage{blindtext}

% -------- Date
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}

%-----------------------------------------------------------
%------------------------ Colors
%-----------------------------------------------------------
\definecolor{date}{HTML}{666666}
\definecolor{primary}{HTML}{2B2B2B}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}
\definecolor{emerald}{HTML}{00A388}
% Define color accent
\definecolor{coloraccent}{HTML}{6A6A6A}% define headings color as default color accent 
\newcommand{\coloraccentxcolor}[1]{% defined
	\def\@coloraccentxcolor{#1}
	\ifx\@coloraccentxcolor\@undefined
	\else
		\ifx\@coloraccentxcolor\@empty
		\else
			\colorlet{coloraccent}{\@coloraccentxcolor}
		\fi
	\fi
}

%-----------------------------------------------------------
%------------------------ Fonts 
%-----------------------------------------------------------
\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}
%\setmainfont[Color=primary, Path = fonts/raleway/,BoldItalicFont=Raleway-Medium,BoldFont=Raleway-Bold,ItalicFont=Raleway-Thin]{Raleway-Regular}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}

%-----------------------------------------------------------
%------------------------ Section seperators
%-----------------------------------------------------------
% -------- Info: 
% \titlespacing*{<command>}{<left>}{<before-sep>}{<after-sep>}
% <left> increases the left margin; 
% <before-sep> controls the vertical space before the title; 
% <after-sep> controls the vertical space after the title.
% -------- Examples: 
% \titlespacing*{\section}{0pt}{5.5ex plus 1ex minus .2ex}{4.3ex plus .2ex}
% \titlespacing*{\subsection}{0pt}{5.5ex plus 1ex minus .2ex}{4.3ex plus .2ex}
\titlespacing{\section}{0pt}{0pt}{12pt plus 4pt minus 2pt}
\titlespacing{\subsection}{0pt}{0pt}{6pt plus 2pt minus 1pt}

% plus/minus parameters
%\titlespacing{\subsection}{0pt}{0pt}{12pt plus 4pt minus 2pt}
%           12pt is what we would like the spacing to be
%           plus 4pt means that TeX can stretch it by at most 4pt
%           minus 2pt means that TeX can shrink it by at most 2pt

%-----------------------------------------------------------
%------------------------ General commands
%-----------------------------------------------------------
% Rulestyle
\newcommand*{\rulestyle}[1]{{\color{headings}#1}}

% Date style
\newcommand*{\datestyle}[1]{{\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont\color{date} #1}} %\scshape (smallcaps)
% Lastupdated command
\newcommand{\lastupdated}{
	\begin{textblock}{60}(155,5)
		\datestyle{LaTeX built on \today}	
	\end{textblock}
}
% Todaysdate command
\newcommand{\todaysdate}{
		\hspace*{\fill}
		\datestyle{\today}	
}

% Contact data commands
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\city}[1]{\def\@city{#1}}
\newcommand*{\country}[1]{\def\@country{#1}}
\def\@address{\@city, \@country}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\openPGPpublickeyurl}[1]{\def\@openPGPpublickeyurl{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\githubuser}[1]{\def\@githubuser{#1}}
\newcommand*{\linkedinuser}[1]{\def\@linkedinuser{#1}}
\newcommand*{\dateofbirth}[1]{\def\@dateofbirth{#1}}
\newcommand*{\interestsshort}[1]{\def\@interestsshort{#1}}
\newcommand*{\titlequote}[1]{\def\@titlequote{#1}}
\newcommand*{\photopath}[1]{\def\@photopath{#1}}

% Extra commands
\newcommand{\bulletsep}{\textbullet\space}
\newcommand{\vlinesep}{\space | \space}

% LaTeX symbols
\newcommand{\latex}{\LaTeX}
\newcommand{\tex}{\TeX}

% Custom vspaces
\newcommand{\sectionseppt}{12pt}
\newcommand{\subsectionseppt}{7pt}
\newcommand{\medseppt}{3pt}
\newcommand{\tightseppt}{2pt}

\newcommand{\sectionsep}{\vspace{\sectionseppt}}
\newcommand{\subsectionsep}{\vspace{\subsectionseppt}}
\newcommand{\medsep}{\vspace{\medseppt}}
\newcommand{\tightsep}{\vspace{\tightseppt}}

\newcommand{\negmedsep}{\vspace{-\medseppt}}
\newcommand{\negsubsectionsep}{\vspace{-\subsectionseppt}}

\newcommand{\hmedsep}{\hspace{6pt}}
%-----------------------------------------------------------
%------------------------ Title area
%-----------------------------------------------------------

% Title area commands & styles
\newcommand*{\titlepositionstyle}[1]{{\fontsize{10pt}{1em}\selectfont\color{coloraccent} #1}} %\scshape (smallcaps)
\newcommand*{\titleinterestsshortstyle}[1]{{\fontsize{8pt}{1em}\selectfont\color{coloraccent} #1}} %\scshape (smallcaps)
\newcommand*{\titleinfostyle}[1]{{\fontsize{8pt}{1em}\selectfont #1}} %\scshape (smallcaps)
\newcommand{\headermedsep}{6pt}

\newcommand{\emailwithicon}{\faEnvelope\space\href{mailto:\@email}{\@email}}
\newcommand{\mobilewithicon}{\faMobile*\space\@mobile}
\newcommand{\dateofbirthwithicon}{\faBirthdayCake\space\@dateofbirth}
\newcommand{\addresswithicon}{\faAddressCard\space\@address}
\newcommand{\openpgpwithicon}{\faKey\space\href{\@openPGPpublickeyurl}{key.pub}}
\newcommand{\homepagewithicon}{\faHome\space\href{https://theuermann.dev}{theuermann.dev}}
\newcommand{\githubwithicon}{\faGithub\space\href{https://github.com/\@githubuser}{\@githubuser}}
\newcommand{\linkedinwithicon}{\faLinkedin\space\href{https://linkedin.com/in/\@linkedinuser}{\@linkedinuser}}

% Make profile photo area 
% \newcommand{\makephotoarea}{
% 	\begin{minipage}[t]{0.1475\textwidth}
% 		\begin{adjustbox}{valign=c}
% 			\centering
% 			\noindent\includegraphics[width=3cm]{\@photopath}
% 		\end{adjustbox}
% 	\end{minipage}
% }
% Make profile photo area with TikZ and rounded corners
\usepackage{tikz}
\newcommand{\makephotoarea}{
    \begin{minipage}[t]{0.1475\textwidth}
        \begin{adjustbox}{valign=c}
            \centering
            \noindent
            \begin{tikzpicture}
                \clip[rounded corners=0.25cm] (0,0) rectangle (3cm,3cm);
                \node[anchor=south west, inner sep=0] at (0,0) {\includegraphics[width=3cm, height=3cm]{\@photopath}};
            \end{tikzpicture}
        \end{adjustbox}
    \end{minipage}
}

% Make title area with contact information
\newcommand{\maketitlecontactarea}{
	\begin{minipage}[t]{0.8525\textwidth}
		\centering{ % name
			\fontsize{40pt}{60pt}
			\fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont \@firstname
			\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont \@lastname
		} \\[\headermedsep] % probably '*2'? 
		\centering{ % contact data
			\color{headings}
			\fontspec[Path = fonts/raleway/]{Raleway-Medium}
			% \position (optional)
			% write position if defined; write linebreak if interestsshort is undefined
			\ifthenelse{\isundefined{\@position}}{}{\titlepositionstyle{\@position}\ifthenelse{\isundefined{\@interestsshort}}{\\[\headermedsep]}{}}
			% write separator '|' if position & interestsshort are bof defined
			\ifthenelse{\isundefined{\@interestsshort}}{}{\ifthenelse{\isundefined{\@position}}{}{\titlepositionstyle|}} %both defined
			% \interestsshort (optional)
			% write interestsshort if defined
			\ifthenelse{\isundefined{\@interestsshort}}{}{\titleinterestsshortstyle{\@interestsshort\\[\headermedsep]}}
			% add space if position & interestsshort undefined
			\ifthenelse{\isundefined{\@interestsshort}}{\ifthenelse{\isundefined{\@position}}{\vspace{\headermedsep}}{}}{} 
			% write contact info
			\titleinfostyle{
				% write email
				\emailwithicon
				% write openPGP (optional) and github
				\ifthenelse{\isundefined{\@openPGPpublickeyurl}}{}{\hmedsep\openpgpwithicon}
				% write Homepae
				\hmedsep\homepagewithicon
				% write Github
				\hmedsep\githubwithicon
				% write LinkedIn
				\hmedsep\linkedinwithicon
				\\[\headermedsep]
				% write mobile and address
				\mobilewithicon \vlinesep \addresswithicon
				% write dateofbirth if defined
				\ifthenelse{\isundefined{\@dateofbirth}}{}{\vlinesep\dateofbirthwithicon}
				\\[\headermedsep*2]
			}
			% write titlequote if defined 
			\ifthenelse{\equal{\@writequote}{Q}}{\@titlequote}{}
		}
		%\vspace{15pt}
	\end{minipage}\\[\headermedsep*2]
	% draw rule if \maketitlearea{-} defined
	\ifthenelse{\equal{\@makerule}{-}}{\noindent\makebox[\linewidth]{\rulestyle{\rule{\paperwidth}{0.4pt}}}}{}
	\vspace{-15pt}
}

% Make title area with contact information, including a photo area when a profile photo path is given
% Usage: \maketitlearea{-| }{Q| }
% '-' draws a line below the title area
% 'Q' includes the quote from contact-data_form
\newcommand{\maketitlearea}[2]{
	\def\@makerule{#1}
	\def\@writequote{#2}
	\ifx\@photopath\@undefined
		\vspace*{1mm}	
		\centering
		\maketitlecontactarea
	\else
		\ifx\@photopath\@empty
			\vspace*{1mm}
			\centering
			\maketitlecontactarea
		\else
			\makephotoarea%\quad % adjust space between photo and contact area
			\maketitlecontactarea	
		\fi
	\fi
}

%-----------------------------------------------------------
%------------------------ Section, heading & bullet list commands
%-----------------------------------------------------------
% styles
\newcommand*{\sectionstyle}[1]{{\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont\uppercase{#1}}}
\newcommand*{\subsectionstyle}[1]{{\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\uppercase{#1}}}
\newcommand*{\studyposstyle}[1]{{
	\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont\raggedright{#1}}}

\newcommand*{\onecolumnlocperstyle}[1]{{\color{headings}#1}}
% icons
\newcommand{\locationwithicon}[1]{\faMapMarker*\space#1}
\newcommand{\periodwithicon}[1]{\faCalendar*[regular]\space#1}
% left/right hrule
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Make section in one-column layout
% Usage: \onecolumnsection{Sectionname}{R| }; 'R' to right-align the section header
\newcommand{\onecolumnsectionheader}[2]{
	\sectionsep\medsep
	\color{headings}
	\ifthenelse{\equal{#2}{R}}{\rulestyle{\vhrulefill{0.4pt}}}{} % If 'R' draw rule left
	\sectionstyle{#1}
	\ifthenelse{\equal{#2}{R}}{}{\rulestyle{\vhrulefill{0.4pt}}}%\\[\somesep?] % If not 'R' draw rule right
	\par
	\sectionsep
}

% Make a new organisation/university title
% Usage: \org{Organisation/University-Name}{Organisation/University-Location}
\newcommand{\org}[2]{
	\subsectionstyle{#1}
	\hspace*{\fill}\onecolumnlocperstyle{\locationwithicon{#2}}
	\par
}

% Make a new study or work position 
% Usage: \studypos{Degree}{Field-of-Study/Work}{Period}
\newcommand{\studypos}[3]{
	\medsep\medsep
	\def\@fieldofstudy{#2}
	\ifx\@fieldofstudy\@empty
		\studyposstyle{#1}	
	\else
		\studyposstyle{#1 \@fieldofstudy}	
	\fi
	\hspace*{\fill}\onecolumnlocperstyle{\periodwithicon{#3}}%\\%[\somesep?]
	\par	
	\medsep
}

% Section command
\titleformat{\section}{
	\color{headings}
	\fontspec[Path = fonts/lato/]{Lato-Lig}
	\fontsize{16pt}{24pt}
	\selectfont\raggedright\uppercase
}{}{0em}{}

% Subsection command
\titleformat{\subsection}{
	\color{subheadings}
	\fontspec[Path = fonts/lato/]{Lato-Bol}
	\fontsize{12pt}{12pt}
	\selectfont\uppercase
}{}{0em}{}

% Runsubsection command
\newcommand{\runsubsection}[1]{
	\color{subheadings}
	\fontspec[Path = fonts/lato/]{Lato-Bol}
	\fontsize{12pt}{12pt}
	\selectfont\uppercase{#1}
	\normalfont
}

% Degreesubsection command
\newcommand{\degreesubsection}[1]{
	\color{subheadings}
	\fontspec[Path = fonts/raleway/]{Raleway-Medium}
	\fontsize{10pt}{11pt}
	\selectfont{#1\\}
	\normalfont
}

% Descript command
\newcommand{\descript}[1]{
	\color{subheadings}
	\raggedright
	\fontspec[Path = fonts/raleway/]{Raleway-Medium}
	\fontsize{11pt}{13pt}
	\selectfont{#1\\\medsep}
	\normalfont
}

% Sheader command
\newcommand{\sheader}[1]{
	\color{headings}
	\raggedright
	\fontspec[Path = fonts/raleway/]{Raleway-Medium}
	\fontsize{10pt}{12pt}\selectfont{#1\\\medsep}
	\normalfont
}	

% Runsheader command
\newcommand{\runsheader}[1]{
	\color{headings}
	\raggedright
	\fontspec[Path = fonts/raleway/]{Raleway-Medium}
	\fontsize{10pt}{12pt}\selectfont{#1}
	\normalfont
}	

% Sheader command
\newcommand{\sheaderperlocwithicons}[2]{
	\color{headings}
	\raggedright
	\fontspec[Path = fonts/raleway/]{Raleway-Medium}
	\fontsize{10pt}{12pt}\selectfont{\periodwithicon{#1}\space|\space\locationwithicon{#2}\\\medsep}
	\normalfont
}

% Redefine \tabularx for skills in one-column layout
% Todo: Use itemize?
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
  {%\sectionsep
   \oldtabularx{#1}{#2}}
  {\endoldtabularx}

% Custom bullet lists 
\newenvironment{tightemize}{
	\vspace{-\topsep}
	\begin{itemize}
		\itemsep \tightseppt
		\parskip 0pt
		\parsep 0pt
		\renewcommand{\labelitemi}{$\circ$}
}{
	\end{itemize}
	\vspace{-\topsep}
}

% Usage: Increase right margin in entries that look odd going to \textwidth
\newenvironment{onecolumncventry}[1][0.88]{%
\begin{minipage}[t]{#1\textwidth}
}{
\end{minipage}
\par\sectionsep
}