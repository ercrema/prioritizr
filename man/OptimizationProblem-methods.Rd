% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OptimizationProblem-methods.R
\name{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{nrow}
\alias{ncol}
\alias{ncell}
\alias{modelsense}
\alias{vtype}
\alias{obj}
\alias{A}
\alias{rhs}
\alias{sense}
\alias{lb}
\alias{ub}
\alias{number_of_features}
\alias{number_of_planning_units}
\alias{col_ids}
\alias{row_ids}
\alias{compressed_formulation}
\alias{ncell,OptimizationProblem-method}
\alias{A,OptimizationProblem-method}
\alias{col_ids,OptimizationProblem-method}
\alias{lb,OptimizationProblem-method}
\alias{modelsense,OptimizationProblem-method}
\alias{ncol,OptimizationProblem-method}
\alias{nrow,OptimizationProblem-method}
\alias{number_of_features,OptimizationProblem-method}
\alias{number_of_planning_units,OptimizationProblem-method}
\alias{obj,OptimizationProblem-method}
\alias{rhs,OptimizationProblem-method}
\alias{row_ids,OptimizationProblem-method}
\alias{sense,OptimizationProblem-method}
\alias{ub,OptimizationProblem-method}
\alias{vtype,OptimizationProblem-method}
\alias{compressed_formulation,OptimizationProblem-method}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\alias{OptimizationProblem-methods}
\title{Optimization problem methods}
\usage{
nrow(x)

ncol(x)

ncell(x)

modelsense(x)

vtype(x)

obj(x)

A(x)

rhs(x)

sense(x)

lb(x)

ub(x)

number_of_features(x)

number_of_planning_units(x)

col_ids(x)

row_ids(x)

compressed_formulation(x)
}
\arguments{
\item{x}{\code{\link{OptimizationProblem-class}} object.}
}
\value{
\code{\link[Matrix]{dgCMatrix-class}}, \code{numeric} vector,
  \code{numeric} vector, or scalar \code{integer} depending on the method
  used.
}
\description{
These functions are used to access data from an
\code{\link{OptimizationProblem-class}} object.
}
\details{
The functions return the following data:

\describe{

\item{nrow}{\code{integer} number of rows (constraints).}

\item{ncol}{\code{integer} number of columns (decision variables).}

\item{ncell}{\code{integer} number of cells.}

\item{modelsense}{\code{character} describing if the problem is to be
  maximized (\code{"max"}) or minimized (\code{"min"}).}

\item{vtype}{\code{character} describing the type of each decision variable:
  binary (\code{"B"}), semi-continuous (\code{"S"}), or continuous
  (\code{"C"})}

\item{obj}{\code{numeric} vector specifying the objective function.}

\item{A}{\code{\link[Matrix]{dgCMatrix-class}} matrix object defining the
  problem matrix.}

\item{rhs}{\code{numeric} vector with right-hand-side linear constraints}

\item{sense}{\code{character} vector with the senses of the linear
  constraints (\code{"<="}, \code{">="}, \code{"="}).}

\item{lb}{\code{numeric} lower bound for each decision variable. Missing data
  values (\code{NA}) indicate no lower bound for a given variable.}

\item{ub}{\code{numeric} upper bounds for each decision variable. Missing
  data values (\code{NA}) indicate no upper bound for a given variable.}

\item{number_of_planning_units}{\code{integer} number of planning units in
  the problem.}

\item{number_of_features}{\code{integer} number of features
  the problem.}

}
}
