% nsfgrfp.cls
% William B. Thompson <thompson@cs.utah.edu>
% Current version: 2014-09-17
%
% A simple class file for typesetting NSF proposals.
%
% Default fonts and margins are for NSF 14-590
% 12pt Computer Modern fonts and 1.0" margins.
%
% Class options:
%
%    paragraphspacing
%
%      Switch from the default of indenting the start of each new
%      paragraph to an alternate format in which a blank line is placed
%      between paragraphs and there is no indenting at the start of each
%      paragraph. The default style allows more text to fit within the
%      15 page NSF limit.
%
%    timesfont
%
%      This option switches from 12pt Computer Modern to 12pt Times
%      Roman.  Times Roman is a denser font than ComputerModern in both
%      the characters themselves and the character spacing.  More text
%      will fit within the page limit with Times Roman than with
%      ComputerModern.
%
%    mathtimesfont
%
%      As with the timesfont option, except that mathematics is also set
%      in the times font.  See documentation on the mathptmx package for
%      information on when this might not work.
%
%    runinheadings
%
%	Start text immediately to the right of headings, rather than
%	putting the heading on its own line.
%
%    crowdlines
%
%	Reduce the spacing between lines to get more text into a fixed
%	number of pages.  This will make the document harder to read.
%
%    crowdlinesmax
%
%	Reduce the spacing between lines by the maximum allowed by
%	NSF.  This will make the document VERY hard to read.  (Readability
%	is reduced to the MS Word level of typography!)
%
% The figure placement rules used by LaTeX are turned off to give more
% control to the user.
%
% One new envrionment is defined:
%
%   \begin{smallertext} ... \end{smallertext}
%
%	Typeset everthing in the environment in a 10pt. font, as for
%	references.
%
% One new command is defined:
%
%    \boxtext{text}
%                
%	Typeset the argument in a box prominently displayed on the page.
%	Useful for notes that need to be addressed before the document
%	is finalized.
%
\NeedsTeXFormat{LaTeX2e}[2001/06/01]
\ProvidesClass{nsfgrfp}[2014/09/17 v1.0b Document Class for NSF GRPF
	Applications]
%
\newcommand{\loadtimesfont}{}	% Start with loading of times font unset.
\newcommand{\loadmathtimesfont}{}% Start with loading of mathtimes font unset.
\newdimen\nsfmargin		% Allows quasi-metric or English margins.
\newcommand{\paragraphspacing}{}% Change default paragraph spacing
\newcommand{\runinheadings}{}	% Change to runin section headings
\newcommand{\crowdlines}{}	% Change line spacing
\newcommand{\crowdlinesmax}{}	% Change line spacing to maximum allowed
\setlength{\nsfmargin}{1.0in}	% Default margins (GPG09-1).
%
\DeclareOption{paragraphspacing}{ % Blank line between paragraphs, no indent
    \setlength{\parindent}{0em}\setlength{\parskip}{1.5ex}
    \renewcommand{\paragraphspacing}{%
        \setlength{\parindent}{0em}\setlength{\parskip}{1.5ex}%
      }
  }
\DeclareOption{timesfont}{	% Switch to Times Roman from default CM
    \renewcommand{\loadtimesfont}{\usepackage{times}}
  }
\DeclareOption{mathtimesfont}{	% Switch to Times Roman for both text and math.
    \renewcommand{\loadmathtimesfont}{\usepackage{mathptmx}}
  }
\DeclareOption{runinheadings}{
    \renewcommand{\runinheadings}{%
	\titleformat{\section}[runin]{\normalfont\bfseries}{\thesubsection}%
		{1em}{}
      }
  }
\DeclareOption{crowdlines}{	% Allow more lines/page
    \renewcommand{\crowdlines}{\renewcommand{\baselinestretch}{0.96}}
  }
\DeclareOption{crowdlinesmax}{	% Allow maximum allowed lines/page
    \renewcommand{\crowdlines}{\renewcommand{\baselinestretch}{0.92}}
  }
\ProcessOptions
%
\LoadClass[12pt]{article}	% Mostly, this is just the article class.
%
\usepackage[compact,tiny]{titlesec}
%
\loadtimesfont			% If requested (there MUST be a better way!)
\loadmathtimesfont		% If requested (there MUST be a better way!)
\paragraphspacing		% If requested (there MUST be a better way!)
\runinheadings			% If requested (there MUST be a better way!)
\crowdlines			% If requested (there MUST be a better way!)
%

%
\usepackage{vmargin}		% Set up page layout
\setpapersize{USletter}
\setmarginsrb{\nsfmargin}{\nsfmargin}{\nsfmargin}{0.55\nsfmargin}{0pt}{0pt}%
   {0pt}{0.45\nsfmargin}
%
%
% Use 10pt text, as for references.
%
\newenvironment{smallertext}{\footnotesize}{}
%
% Put text into a box centered on the page:
%
%	\boxtext{Some text...}
%
\RequirePackage{boxedminipage}
\newdimen\boxtextwidth
\newcommand{\boxtext}[1]{
        \setlength{\boxtextwidth}{0.9\textwidth}
	\begin{center}
	\begin{boxedminipage}{\boxtextwidth}
	#1
	\end{boxedminipage}
	\end{center}}
%
% Turn off efforts by LaTeX to layout figures sensibly.  Figure placement
% will more sensitive to where the figure declaration occurs in the
% source.  This should be invoked before the \begin{document}
%
\setcounter{topnumber}{20}
\setcounter{bottomnumber}{20}
\setcounter{totalnumber}{20}
\renewcommand{\topfraction}{1.0}
\renewcommand{\bottomfraction}{1.0}
\renewcommand{\textfraction}{0.1}
%