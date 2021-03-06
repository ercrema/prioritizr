#' @include internal.R pproto.R ConservationProblem-proto.R
NULL

#' Add Relative Targets
#'
#' Set targets as a proportion (between 0 and 1) of the maximum level of
#' representation of features in the study area. The argument to \code{x}
#' should have a single value if all features have the same target. Otherwise,
#' the vector should have a value for each feature. In this case, targets are
#' assigned to features based on their position in the argument to \code{x}
#' and the \code{feature} when specifying the problem.
#'
#' Note that with the exception of the maximum cover problem, targets must
#' be added to a \code{\link{problem}} or solving will return an error.
#'
#' @param x \code{\link{ConservationProblem-class}} object.
#'
#' @param targets \code{numeric} targets for features. If all features should
#'   have the same target, \code{targets} can be a single number. Otherwise,
#'   \code{targets} should be a \code{numeric} \code{vector} specifying a
#'   target for each feature. Alternatively, if the features in
#'   \code{x} were specified using a \code{data.frame} object, then
#'   argument to \code{targets} may refer to a column name.
#'
#' @param ... not used.
#'
#' @details
#' Targets are used to specify the minimum amount or proportion of a feature's
#' distribution that needs to be protected. All conservation planning problems
#' require adding targets with the exception of the maximum cover problem
#' (see \code{\link{add_max_cover_objective}}), which maximizes all features
#' in the solution and therefore does not require targets.
#'
#' @return \code{\link{ConservationProblem-class}} object with the target added
#'   to it.
#'
#' @seealso \code{\link{targets}}.
#'
#' @examples
#' # load data
#' data(sim_pu_raster, sim_features)
#'
#' # create base problem
#' p <- problem(sim_pu_raster, sim_features) %>%
#'      add_min_set_objective() %>%
#'      add_binary_decisions()
#'
#' # create problem with 10 % targets
#' p1 <- p %>% add_relative_targets(0.1)
#'
#' # create problem with varying targets for each feature
#' targets <- c(0.1, 0.2, 0.3, 0.4, 0.5)
#' p2 <- p %>% add_relative_targets(targets)
#' \donttest{
#' # solve problem
#' s <- stack(solve(p1), solve(p2))
#'
#' # plot solution
#' plot(s, main = c("10 % targets", "varying targets"), axes = FALSE,
#'      box = FALSE)
#' }
#'
#' @aliases add_relative_targets-method add_relative_targets,ConservationProblem,numeric-method add_relative_targets,ConservationProblem,character-method
#'
#' @name add_relative_targets
#'
#' @docType methods
NULL

#' @name add_relative_targets
#' @rdname add_relative_targets
#' @exportMethod add_relative_targets
#' @export
methods::setGeneric(
  "add_relative_targets",
  signature = methods::signature("x", "targets"),
  function(x, targets, ...) standardGeneric("add_relative_targets"))

#' @name add_relative_targets
#' @rdname add_relative_targets
#' @usage \S4method{add_relative_targets}{ConservationProblem,numeric}(x, targets, ...)
methods::setMethod("add_relative_targets",
                   methods::signature("ConservationProblem", "numeric"),
                   function(x, targets, ...) {
                     # assert that arguments are valid
                     assertthat::assert_that(
                       inherits(x, "ConservationProblem"),
                       inherits(targets, "numeric"),
                       isTRUE(all(is.finite(targets))),
                       isTRUE(all(targets >= 0.0)),
                       isTRUE(all(targets <= 1.0)),
                       isTRUE(length(targets) > 0))
                     # assert that targets are compatible with problem
                     if (length(targets) != 1)
                       assertthat::assert_that(length(targets) ==
                                               x$number_of_features())
                     # create target parameters
                     if (length(targets) == 1) {
                       targets <- rep(targets, x$number_of_features())
                     }
                     targets <- proportion_parameter_array("targets", targets,
                                                           x$feature_names())
                     # add targets to problemcharacter
                     x$add_targets(pproto(
                       "RelativeTargets",
                       Target,
                       name = "Relative targets",
                       data = list(abundances =
                                     x$feature_abundances_in_planning_units()),
                       parameters = parameters(targets),
                       output = function(self) {
                         self$parameters$get("targets")[[1]] *
                         self$get_data("abundances")
                       }))
                   })

#' @name add_relative_targets
#' @rdname add_relative_targets
#' @usage \S4method{add_relative_targets}{ConservationProblem,character}(x, targets, ...)
methods::setMethod(
  "add_relative_targets",
  methods::signature("ConservationProblem", "character"),
  function(x, targets, ...) {
    # assert that arguments are valid
    assertthat::assert_that(inherits(x, "ConservationProblem"),
                            inherits(x$data$features, "data.frame"),
                            assertthat::has_name(x$data$features, targets))
    # add targets
    add_relative_targets(x, x$data$features[[targets]])
  })
