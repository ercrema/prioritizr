% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_semicontinuous_decisions.R
\name{add_semicontinuous_decisions}
\alias{add_semicontinuous_decisions}
\alias{add_semicontinuous_decisions}
\title{Add semi-continuous decisions}
\usage{
add_semicontinuous_decisions(x, upper_limit)
}
\arguments{
\item{x}{\code{\link{ConservationProblem-class}} object.}

\item{upper_limit}{\code{numeric} value specifying the maximum proportion
of a planning unit that can be reserved (e.g. set to 0.8 for 80 \%).}
}
\value{
\code{\link{Decision-class}} object.
}
\description{
Add a semi-continuous decision to a conservation planning
\code{\link{problem}}. This is a relaxed decision where a part of a planning
unit can be prioritized, as opposed to the entire planning unit, which is
the default function (see \code{\link{add_binary_decisions}}).
This decision is similar to the \code{\link{add_proportion_decisions}}
function except that it has an upper bound parameter. By default, the
decision can range from prioritizing none (0 \%) to all (100 \%) of a
planning unit. However, a upper bound can be specified to ensure that at most
only a fraction (e.g. 80 \%) of a planning unit can be preserved. This type
of decision may be useful when it is not practical to conserve the entire
planning unit.
}
\details{
Conservation planning problems involve making decisions on planning units.
These decisions are then associated with actions (e.g. turning a planning
unit into a protected area). If no decision is explicitly added to a problem,
then the binary decision class will be used by default.Only a single decision
should be added to a
\code{ConservationProblem} object. \strong{If multiple decisions are added
to a problem object, then the last one to be added will be used.}
}
\examples{
# create problem with semicontinuous decisions that have an upper bound of
# 50 \% of the planning unit
p <- problem(sim_pu_raster, sim_features) \%>\%
     add_min_set_objective() \%>\%
     add_relative_targets(0.1) \%>\%
     add_semicontinuous_decisions(upper_limit = 0.5)
\donttest{
# solve problem
s <- solve(p)

# plot solutions
plot(s, main = "solution", axes = FALSE, box = FALSE)
}

}
\seealso{
\code{\link{decisions}}.
}
