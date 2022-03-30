%% -*- mode: LaTeX; compile-command: "./Shake.hs" -*-

\documentclass[xcolor=svgnames,12pt]{beamer}

%include polycode.fmt

\usepackage{xspace}
\usepackage{ulem}
\usepackage{graphicx}
\graphicspath{{images}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\etc}{\textit{etc.}}
\newcommand{\eg}{\textit{e.g.}\xspace}
\newcommand{\ie}{\textit{i.e.}\xspace}

\newcommand{\theschool}{Hendrix College}
\newcommand{\thedate}{March 31, 2022}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamertemplate{items}[circle]

\mode<presentation>
{
  \usetheme{default}                          % use a default (plain) theme

  \setbeamertemplate{navigation symbols}{}    % don't show navigation
                                              % buttons along the
                                              % bottom
  \setbeamerfont{normal text}{family=\sffamily}

  % XX remove this before giving actual talk!
  % \setbeamertemplate{footline}[frame number]
  % {%
  %   \begin{beamercolorbox}{section in head/foot}
  %     \vskip2pt
  %     \hfill \insertframenumber
  %     \vskip2pt
  %   \end{beamercolorbox}
  % }

  \AtBeginSection[]
  {
    \begin{frame}<beamer>
      \frametitle{}

      \begin{center}
        \includegraphics[width=3in]{\sectionimg}
        \bigskip

        {\Huge \usebeamercolor[fg]{title}\insertsectionhead}
      \end{center}
    \end{frame}
  }
}

\newcommand{\sectionimg}{}

\defbeamertemplate*{title page}{customized}[1][]
{
  \vbox{}
  \vfill
  \begin{centering}
    \begin{beamercolorbox}[sep=8pt,center,#1]{title}
      \usebeamerfont{title}\inserttitle\par%
      \ifx\insertsubtitle\@@empty%
      \else%
        \vskip0.25em%
        {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
      \fi%
    \end{beamercolorbox}%
    \vskip1em\par
    {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
    \vskip1em\par
    \begin{beamercolorbox}[sep=8pt,center,#1]{author}
      \usebeamerfont{author}\insertauthor
    \end{beamercolorbox}
    \begin{beamercolorbox}[sep=8pt,center,#1]{institute}
      \usebeamerfont{institute}\insertinstitute
    \end{beamercolorbox}
    \begin{beamercolorbox}[sep=8pt,center,#1]{date}
      \usebeamerfont{date}\insertdate
    \end{beamercolorbox}
  \end{centering}
  \vfill
}

\newenvironment{xframe}[1][]
  {\begin{frame}[fragile,environment=xframe,#1]}
  {\end{frame}}

% uncomment me to get 4 slides per page for printing
% \usepackage{pgfpages}
% \pgfpagesuselayout{4 on 1}[uspaper, border shrink=5mm]

% \setbeameroption{show only notes}

\renewcommand{\emph}{\textbf}

\title{What I Did On My \sout{Summer Vacation} Sabbatical}
\date{\theschool \\ \thedate}
\author{Brent Yorgey}
% \titlegraphic{\includegraphics[width=1in]{tree}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{document}

\begin{xframe}{}
   \titlepage
\end{xframe}

\begin{xframe}{}
  \begin{center}
    \includegraphics[width=3in, angle=90]{Ruth}
  \end{center}
\end{xframe}

\begin{xframe}{}
  \begin{center}
    \includegraphics[width=4in]{books}
  \end{center}
\end{xframe}

\begin{xframe}{}
  \begin{center}
    \includegraphics[width=4in]{bach}
  \end{center}
\end{xframe}

\begin{xframe}{}
  \hfill
  \begin{minipage}{0.4\linewidth}
    \begin{center}
      Disco \bigskip

      \includegraphics[width=\linewidth]{disco-zorder.png}
    \end{center}
  \end{minipage}
  \hfill
  \begin{minipage}{0.4\linewidth}
    \begin{center}
      Swarm \bigskip

      \includegraphics[width=\linewidth]{swarm-log.png}
    \end{center}
  \end{minipage}
  \hfill
\end{xframe}

\renewcommand{\sectionimg}{disco-zorder}
\section{Disco}

\begin{xframe}{What is it?}
  \begin{itemize}
  \item Functional programming language for teaching Discrete Math
  \item Mathematical syntax
  \item Implemented in Haskell
  \item Goals:
    \begin{itemize}
    \item Expose students to a little bit of functional programming
    \item Provide a computational platform for playing with
      mathematical concepts
    \end{itemize}
  \end{itemize}
\end{xframe}

\begin{xframe}{What did I work on?}
  \begin{itemize}
  \item Rewriting the codebase to use a modern effects framework
  \item Rewriting the evaluation engine to use a CESK machine
  \item Implementing a generic message framework
  \end{itemize}
\end{xframe}

\begin{xframe}{}
  \begin{center}
    \Huge{Demo}
  \end{center}
\end{xframe}

\renewcommand{\sectionimg}{swarm-log.png}
\section{Swarm}

\begin{xframe}{What is it?}
  \begin{itemize}
  \item 2D programming and resource-gathering game
  \item Just for fun!
  \end{itemize}
\end{xframe}

\begin{xframe}{What did I work on?}
  \begin{itemize}
  \item Language design as game design
  \item Building an open-source community
  \end{itemize}
\end{xframe}

\begin{xframe}{}
  \begin{center}
    \Huge{Demo}
  \end{center}
\end{xframe}

\begin{xframe}{What do Disco and Swarm have in common?}
  \begin{itemize}
  \item Both are custom programming languages (I can't resist)
  \item CE(S)K machines!
  \end{itemize}
  \begin{center}
    \includegraphics[width=1in]{PFPL}
  \end{center}
\end{xframe}

% \renewcommand{\sectionimg}{???}
\section{Section Title??}

%if False
\begin{code}
{-# LANGUAGE GADTs #-}
\end{code}
%endif

%format eval = "\Funid{eval}"
%format Int  = "\Typeid{Int}"
%format Expr = "\Typeid{Expr}"

\let\oldConid\Conid
\renewcommand{\Conid}[1]{\textcolor{Green}{\oldConid{#1}}}
\newcommand{\Funid}[1]{\textcolor{Blue}{#1}}
\newcommand{\Typeid}[1]{\textcolor{Purple}{#1}}

\begin{xframe}{}

\begin{code}
data Expr where
  Lit  ::  Int -> Expr
  Add  ::  Expr -> Expr -> Expr
\end{code}

Illustrate expression as tree and as Haskell code

\end{xframe}

\begin{xframe}
\begin{code}
eval :: Expr      ->  Int
eval (Lit x)      =   x
eval (Add e1 e2)  =   eval e1 + eval e2
\end{code}

\end{xframe}

\end{document}
