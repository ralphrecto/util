\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rjjrpset}
\LoadClass[a4paper, 11pt]{article}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage[tmargin=1.25in,bmargin=1.25in,lmargin=1.25in,rmargin=1.25in]{geometry}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{rjjr}

% GENERAL %
\small
\theoremstyle{plain}
\newtheorem*{lemma*}{Lemma}
\newtheorem{lemma}{Lemma}
\newtheorem{claim}{Claim}
\newtheorem*{claim*}{Claim}


% DEFAULTS %
\def\@name{Ralph J. Recto}
\def\@class{}
\def\@pset{}
\newcommand{\setclass}[1]{\def\@class{#1}}
\newcommand{\setpset}[1]{\def\@pset{#1}}


% HEADER STUFF %
\setlength{\headheight}{15pt}
\pagestyle{fancy}
\lhead{\@name}
\rhead{\@class\;-\;\@pset}


% PSET SPECIFIC %
\newenvironment{problem}[1]{\subsection*{Problem #1}}{\vspace{0.35in}}
\newcommand{\subproblem}[1]{\paragraph{(#1)}}
