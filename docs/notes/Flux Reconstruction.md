---
tags:
  - cfd
title: Flux Reconstruction
---
Content taken from the paper: [[Flux_Reconstruction_ Original_paper.pdf]]

For the case of 1D spatial dimension, in a high-order [[Definition of common terms in semi discretization of conservation laws, the solution can be approximated in each cell (interval) by the data at $K(\in I^+)$ points called solution points. These $K$ points will define a polynomial of degree $K - 1$, called *solution  polynomial*.

In *Finite Element method*, this solution polynomial interpolates the data *within* the cells.

In *Finite Volume method*, this interpolation will happen across several cells. The *solution polynomials* collectively form a function that can be discontinuous across cell interfaces. At each interface, a common flux is defined from the values on the left or right of the interfaces, usually it is a upwind flux. This interaction of adjacent cells due to a common flux leads to a conservative scheme.

Flux reconstruction schemes can **solve conservation laws in differential form** and involve **only one grid** as contrast to staggered-grid schemes which needs **a primary grid** for scalar quantities and additional grids for **each vector quantity staggered appropriately.** FR schemes are conservative.

---
#### FR approach for 1D case
Flux values at $K$ solution points defines a solution polynomial of degree $K - 1$. These polynomials, for each cell collectively forms up a function which is discontinuous at cell interfaces.
We can not approximate the derivative of flux with this discontinuous function as it does not provide the interaction across cell interfaces with the neighbouring data.

To account for interaction, we need to construct a *continuous* flux function which approximates the discontinuous flux function in some sense. 

##### Requirements of *continuous* flux function
1. At each interface, it should take up the value of *upwind* flux to ensure the continuity across interfaces.
2. In each cell, *continuous* flux function should be a polynomial of degree $K$ so that it's (spatial) derivative will be of degree $K - 1$ which is consistent with the solution polynomial.

Since there are differences in continuous and discontinuous flux functions, it is sufficient to define a **correction function** $(g)$ which approximates the zero function. We want to use this correction function with discontinuous flux function in order to make it continuous.
If we assume that cell is the interval $I = [-1,1]$, the main thing now is to define a polynomial $g$ of degree $K$ such that $g(-1) = 1$, $g(1) = 0$ (If we focus on the correction due to jump only at the left boundary) and $g$ approximates $0$ in some sense (least square sense).

The condition $g(-1) = 1$ deals with the jump at left interface and $g(1) = 0$ leaves the right boundary unchanged. Now, two conditions are set and $g$ now get determined by the $K - 1$ additional conditions. At each solution point, the derivative of $g$ is then employed to correct the *discontinuous* flux function.

**Correction due to the jump at right boundary follows by symmetry** since we have separated correction for left and right boundary.
##### Difference between FR and staggered grid approach
1. Use of *discontinuous* flux function.
2. Separation of the correction at left interface from that of right interface.
3. Use of correction function $g$.
4. Use of only $1$ grid.

##### Replication of simplified DG schemes through flux reconstruction
Denote $P_m$ be the space of polynomials of degree $m$ or less on $I = [-1,1]$ with the integral inner product defined. If $K - 1$ additional conditions (since two conditions are already satisfied; one on each boundary) are that the projection of $g$ onto $P_{k-2}$ is $0$ (i.e. $g$ approximates $0$ in a least square sense) then $g$ is the *right Radau* polynomial and resulting scheme is simplified DG method.

Note that the correction for the *left* boundary is *right* Radau polynomial because the condition (for left boundary) $g(-1) = 1$ and $g(1)=0$ can not be met simultaneously. Hence the highest accuracy possible (via least squares) is requirement that the projection of $g$ on $P_{k-2}$ is $0$. %%Reference Page no. in paper: 10%%

There is a difference of test function between DG and FR: For DG, the space is $P_{K- 1}$, which is of dimension $K$. For schemes defined by correction function $g$, this space is also of dimension $K$, but consists of polynomials $\phi$ of degree $K$ such that ${d\phi}/{dx}$ (which is of degree $K - 1$) is perpendicular to $g$. 
If $g$ is Radau polynomial, the scheme reduces to DG and this space reduces to $P_{K-1}$.
##### Replication of staggered-grid scheme through flux reconstruction
When $g$ already satisfying the two conditions;  $g(-1) = 1$ and  $g(1) = 0$ and rest $K - 1$ additional conditions are that $g$ vanishes at the $K - 1$ interior Chebyshev-Lobatto (flux) points; i.e. $g$ is defined by interpolation rather than projection (then make least square error to be minimum between $g(x)$ and $0$). We can get staggered-grid scheme.

The original staggered-grid scheme is mildly unstable but the scheme obtained from FR (in which $g$ is defined through interpolation not projection) is stable and $2K - 2$ order accurate (which is lower than DG schemes which are $2K - 1$ order accurate but *cfl* condition becomes roughly $3/2$ times larger than DG).

##### Continuous flux function
The continuous flux function $F(x)$ is required to take the upwind flux values at cell interfaces. In each cell $E_j$, it is polynomial of degree $K$ denoted by $F_j(x)$ and it approximates the discontinuous flux function $f_j(x)$. 

Instead of defining $F_j(x)$, we define $F_j(x) - f_j(x)$ which approximates the $0$ function in some sense. In terms of local coordinate $\xi$ on $I = [-1,1]$, at the two interfaces $\xi=\pm1$, the function  $F_j(\xi) - f_j(\xi)$ takes the following values which maybe called jumps at the interfaces:
$$ F_j(-1) - f_j(-1) = f_{j-1/2, upw} - f_j(-1)$$ and $$F_j(1) - f_j(1) = f_{j+1/2, upw} - f_j(1) $$ therefore $F_j(\xi) - f_j(\xi)$ is a polynomial of degree $K$ with above left and right interface values.

##### Separation of correction function at left and right boundaries
For left boundary: $$ g_{LB}(-1)=1, \hspace{10pt} g_{LB}(1)=0 $$
where $g_{LB}$ is polynomial of degree $K$ approximating the constant function $0$ in some sense. Similarly, for right boundary:
$$ g_{RB}(-1)=0, \hspace{10pt} g_{RB}(1)=1 $$where $g_{RB}$ is also a polynomial of degree $K$ approximating the constant function $0$ in some sense. 
Now, we can combine both the above equations to generate a function $F_j(\xi)$ which will take:

1. upwind flux values at the boundaries.
2. Will be of degree $K$.
3. And approximate the $f_j(\xi)$ in some sense.

The form of $F_j(\xi)$ will look like:
$$ F_j(\xi) = f_j(\xi) + [f_{j-1/2, upw} - f_j(-1)]g_{LB}(\xi) + [f_{j+1/2, upw} - f_j(1)]g_{RB}(\xi) $$
It can be easily verify that $F_j(\xi)$ take upwind flux values at interfaces i.e. $\xi = \pm 1$.

The derivative of $F_j(\xi)$ at the solution points, will look like: 
$$ 
(F_{\xi})_{j,k} = (f_{\xi})_{j,k} + [f_{j-1/2, upw} - f_j(-1)]g_{LB}^{\prime}(\xi_k) + [f_{j+1/2, upw} - f_j(1)]g_{RB}^{\prime}(\xi_k)
$$
The above equation is of the form: *continuous flux = discontinuous flux + correction function*.  
In global coordinate, at the solution point $x_{j,k}$:  
$$ 
(F_x)_{j,k} = \frac{2}{h_j}(F_{\xi})_{j,k} 
$$
Above expression results from the linear mapping relation that maps the global coordinates to local interval $[-1,1]$.
The quantity $(F_x)_{j,k}$ can be used to approximate the flux $f_x$ at solution points $x_{j,k}$:
$$ 
\frac{du_{j,k}(t)}{dt} = \left[\frac{du_{j,k}(t)}{dt}\right]_{t=t^n} = -(F_x)_{j,k} 
$$
The solution $u_{j,k}$ can then be updated via an explicit Runge-Kutta method.

---
