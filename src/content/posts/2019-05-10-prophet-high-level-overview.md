
Sean J. Taylor
https://twitter.com/seanjtaylor/status/1123278380369973248

80% of forecasting tasks at companies can be handled by a relatively simple model.

Prophet approaches time series forecasting as a "curve fitting problem".

Benefits of this approach:
- curves are easy to relate to and you can decompose them
- fitted parameters have straightforward interpretations
- curve fitting is fast, so you can iterate quickly

First attempt at curve fitting might be a polynomial. Adding more terms means you can "interpolate" better, but the "extrapolation" is very poor, because the local trend the curve is estimating is usually very wrong.

![Polynomial Curve Fitting](polynomial-curve-fitting.mp4)

Many of the weaknesses of polynomial models can be improved by using splines. Here we use a similar number of parameters to the above polynomial model, but using a natural spline fit for the same data results in a much better local trend. Prophet borrows and builds upon this concept.

![Polynomial Curve Fitting With Splines](polynomial-splines.mp4)

Prophet decomposes the time series down into piecewise linear components to make up the curve. That is accomplished by how the knots are selected, i.e. where the curve is allowed to change.
- knots are introduced where they are needed
- the extrapolation is table as the knots vary

![Piecewise 'linear' curve](piecewise-linear.mp4)

These knots are called "changepoints". A grid of them is generated, then an L1 regression penalty is applied to select a small number of non-zero changepoints. As the penalty is changed, the number of changepoints change.

![Changepoint Prior Scale L1 Penalty](changepoint-prior-scale.mp4)

To generalise the model, other components are added to reflect seasonality and holiday impact.

Really, Prophet is just a specific type of GAM with i.i.d. (independent and identically distributed) noise. In Prophet there is no focus on modelling the residual error, but an ARMA process could be added to the errors.

![Prophet Components](prophet-formula-components.jpg)

To estimate seasonality, Prophet generates a partial Fourier sum to approximate an arbitrary periodic signal over standard periods, such as daily / weekly / yearly.

![Seasonality Fourier Sum](seasonality-fourier-sum.png)

![Seasonality Fourier Plot](seasonality-fourier-plot.png)

There are three main sources of uncertainty in Prophet forecasts:
- irreducible noise
- parameter uncertainty
- trend forecast uncertainty

Anything Prophet cannot fit with a curve is modelled as mean-zero i.i.d. (independent and identically distributed) random noise. This creates tube shaped uncertainty in the forecast, and large uncertainty indicates a poor historical fit by the model.

![Forecast Tube Shaped Uncertainty](tube-shaped-uncertainty.mp4)

Every parameter fit in the Prophet model has sampling variance. This includes all seasonalities, trends and changepoints. There is also the option available to use STAN's built in HMC (Hamilton Monte Carlo?) implementation to sample draws from a posterior.

Prophet handles trend uncertainty by performing a simulation of trend change.

At each date in the forecast the trend is allowed to change, with the rate of change based on how many changepoints were selected. The distribution is selected based on the magnitude of change.

![Simulating Trend Change Uncertainty](simulating-trend-change.mp4)

There is an interplay between interpolating well by selecting a large number of changepoints, 

Selecting a large number of changepoints will cause the model to fit (interpolate) well, but also result in a lot of trend uncertainty by making the trend more cone-shaped. Underfitting the historical time series will cause a lot of this cone-shaped uncertainty.

![Cone-shaped Trend Uncertainty](cone-shaped-trend-uncertainty.mp4)

Two main tuning parameters:
- Seasonality Prior Scale (SPS)
- Capacities

Seasonality Prior Scale controls how flexibly the different seasonalities are fit. Note that seasonalities can also be turned off if you have a prior where they don't exist.

![Seasonality Prior Scale](seasonality-prior-scale.mp4)

Capacities can be useful for injecting domain knowledge about growth into the model.
- Piecewise logistic growth have a manual specified capacity parameter that isn't fit from data
- Obvious constraints can be set for upper and lower bounds on forecasts
- Capacity can be specified as a constant or as a time series

![Specifying Capacities](specifying-capacities.mp4)

In conclusion, Prophet is a simple model but can cover many use-cases. Simple is good, Prophet has demonstrated robustness and fails in understandable ways.

Using the approach of curve-fitting with interpretable parameters also allows domain knowledge to be input into the forecasts.