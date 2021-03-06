% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interface.R
\name{plot-mfbvar}
\alias{plot-mfbvar}
\alias{plot.mfbvar_ss}
\alias{plot.mfbvar_ssng}
\alias{plot.mfbvar_minn}
\alias{varplot}
\title{Plotting methods for posterior mfbvar objects}
\usage{
\method{plot}{mfbvar_ss}(
  x,
  aggregate_fcst = TRUE,
  plot_start = NULL,
  pred_bands = 0.8,
  nrow_facet = NULL,
  ss_bands = 0.95,
  ...
)

\method{plot}{mfbvar_ssng}(
  x,
  aggregate_fcst = TRUE,
  plot_start = NULL,
  pred_bands = 0.8,
  nrow_facet = NULL,
  ss_bands = 0.95,
  ...
)

\method{plot}{mfbvar_minn}(
  x,
  aggregate_fcst = TRUE,
  plot_start = NULL,
  pred_bands = 0.8,
  nrow_facet = NULL,
  ...
)

varplot(x, variables = colnames(x$Y), var_bands = 0.95, nrow_facet = NULL, ...)
}
\arguments{
\item{x}{object of class \code{mfbvar_minn} or \code{mfbvar_ss}}

\item{aggregate_fcst}{Boolean indicating whether forecasts of the latent monthly series should be aggregated to the quarterly frequency.}

\item{plot_start}{Time period (date or number) to start plotting from. Default is to to use \code{5*n_fcst} time periods if \code{n_fcst} exists, otherwise the entire sample.}

\item{pred_bands}{Single number (between \code{0.0} and \code{1.0}) giving the coverage level of forecast intervals.}

\item{nrow_facet}{an integer giving the number of rows to use in the facet}

\item{ss_bands}{(Steady-state prior only) Single number (between \code{0.0} and \code{1.0}) giving the coverage level of posterior steady-state intervals.}

\item{...}{Currently not in use.}

\item{variables}{Vector of names or positions of variables to include in the plot of variances}

\item{var_bands}{(\code{varplot} only) Single number (between \code{0.0} and \code{1.0}) giving the coverage level of posterior intervals for the error standard deviations.}
}
\description{
Methods for plotting posterior mfbvar objects.
}
\examples{
prior_obj <- set_prior(Y = mf_usa, d = "intercept",
                       n_lags = 4, n_reps = 20,
                       n_fcst = 4, n_fac = 1)

prior_intervals <- matrix(c(1, 3,
                            4, 8,
                            1, 3), ncol = 2, byrow = TRUE)
psi_moments <- interval_to_moments(prior_intervals)
prior_psi_mean <- psi_moments$prior_psi_mean
prior_psi_Omega <- psi_moments$prior_psi_Omega
prior_obj <- update_prior(prior_obj,
                          prior_psi_mean = prior_psi_mean,
                          prior_psi_Omega = prior_psi_Omega)

mod_ss <- estimate_mfbvar(prior_obj, prior = "ss", variance = "fsv")
plot(mod_ss)
varplot(mod_ss)
}
