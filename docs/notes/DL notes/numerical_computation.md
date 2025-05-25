---
title: Numerical Computation
author: Devansh
date: 2025-01-04
description: Notes from "Deep Learning" by Ian Goodfellow
---

# Overflow and Underflow

### Underflow
- It is the one form of rounding error.
- It occurs when numbers near zero are rounded to zero. 
- Many function can blow up at $0$ but they maybe defined at some small positive number.

### Overflow
- It occure when very large number are rounded off as $\infty$ or $-\infty$ and for further arithmatic will treat them as $NaN$.

### Avoiding underflow and overflow
We should use some trick that stabilize the functions that are present in our algorithm. For example- if we have $softmax$ function, 

$$ \text{softmax}(\bf{x})_i = \frac{\exp(x_i)}{\sum_{j=1}^n \exp(x_j)}$$

then we can use shifting to avoid the any number being too small or too large. With simple manipulation, it can shown that $\text{softmax}(\bf{x}) = \text{softmax}(\bf{x} - c)$ where $c$ is $\max_i x_i$.

Problem will arise when all the entries in the $\bf x$ are either too small or too large. But then shifting will make sure at least one element becomes $0$ while subtracting the $\max_ix_i$ namely the maximum term itself. Then $\exp{(0)} = 1$ will avoid the underflow and subtractng $\max_ix_i$ will make sure all the terms become small to avoid overflow.

# Gradient Descent
For $f(x - \epsilon \text{ sign}(f'(x)))$ is less than $f(x)$ for small enough $\epsilon$. We can thus reduce $f(x)$ by moving $x$ in small steps in the direction opposite to the derivative. This technique is called ${\it gradient~descent}$. (Cauchy, 1847).

For $f: {\mathbb R}^n \to {\mathbb R}$, ${\it directional~derivative}$ in the direction ${\bf u}$ (a unit vector) is the slope of $f$ in the direction $u$.

To minimize $f$, we need to find the direction in which $f$ decreases fastest. So we want the change to be maximum. Since final value will be less than the initial, the change is negative.

$$ {\bf x}' - {\bf x} = - \epsilon\nabla_{{\bf x}} f({\bf x}) $$
where ${\bf x}'$ is the final value and ${\bf x}$ is the initial value. In order to maximize RHS, we need to minimize $\nabla_{{\bf x}}f({\bf x})$ since $\epsilon$ is constant (learning rate).

$$
\begin{alignat*}{2}
    =& \min\limits_{u, u^\top u=1} \nabla_xf(x) \cdot u \quad \text{(directional derivative)} \\
    =& \min\limits_{u, u^\top u=1} \| u\|_2 \|\nabla_x f(x)\|_2 \cos \theta
\end{alignat*}
$$
where $\theta$ is the angle between $u$ and the gradient. For minimizing this, we need minimal value of $\cos\theta$ which is $-1$. Hence, the direction just opposite of gradient is the steepest descent direction. This method is called ${ \it method~of~steepest~descent}$ or ${\it gradient~descent}$.

**NOTE:** Gradient descent is limited to optimization in continuous spaces. But general concept of making small moves (that are approximately the best small move) towards better confiurations can be generalized towards discrete spaces. TODO: Prove/how this can be generalized.

**NOTE**: Ascending an objective function of discrete parameters is called ${\it hill~climbing}$. (Russel and Norvig, 2003)

### Line search
TODO

# Shallow Neural Networks

Consider the case with $D$ hidden units where the $d$ th hidden unit is:
$$ h_d = a[\theta_{d0} + \theta_{d1}x],$$
where $a[\cdot]$ is the *activation function* and these are combined linearly to create the output:
$$ y = \phi_0 + \sum\limits_{d=1}^{D} \phi_dh_d.$$

The hidden layer has just $x$ because there is only one input. In case of multivariate input, hidden layer will be function of each of the components of the input.

![Neural nets](/home/devansh/Documents/my_website/docs/assets/dl/neural_net.png){width=300px}

> ${\bf Network Capacity:}$ The number of hidden units in shallow network is a measure of network capacity.  

With ReLU activation functions, the output of a network with $D$ hidden units has atmost $D$ joints and it is a piecewise linear function with $D+1$ linear regions.  

> ${\bf Universal Approximation Theorem:}$ This theorem says that for any continuous function, there exists a shallow network that can approximate this function to any specified precision.

## Multivariate inputs and outputs

### Multivariate Outputs

To extend the network to multivariate outputs ${\bf y}$, we use different linear function of the hidden layer for each output. For example: A network with a scalar input $x$ and $4$ hidden layers and a $2D$ output ${\bf y} = [y_1, y_2]^\top$ would defined as
$$
\begin{alignat*}{4}
    h_1 &= a[\theta_{10} + \theta_{11}x]\\
    h_2 &= a[\theta_{20} + \theta_{21}x]\\
    h_3 &= a[\theta_{30} + \theta_{31}x]\\
    h_4 &= a[\theta_{40} + \theta_{41}x]  
\end{alignat*}
$$

![Neural nets](/home/devansh/Documents/my_website/docs/assets/dl/nn2output.png){width=300px}


The outputs may look like
$$
\begin{alignat*}{2}
    y_1 &= \phi_{10} + \phi_{11}h_1 + \phi_{12}h_2 + \phi_{13}h_3 + \phi_{14}h_4 \\
    y_2 &= \phi_{20} + \phi_{21}h_1 + \phi_{22}h_2 + \phi_{23}h_3 + \phi_{24}h_4 
\end{alignat*}
$$

Since we are taking the combination of linear functions, the slope of the linear regions can change according to the value $\phi$'s but the location of joints will be same in both outputs because of no translation in $x$ axis. $\phi_0$ can cause translation in $y$ axis.

### Multivariate Inputs
In the case of multivariate input ${\bf x}=[x_1, x_2]^\top$, the hidden will be defined as 
$$ h_d = a[\theta_{d0} + \theta_{d1}x_1 + \theta_{d2}x_2]$$
Then these hidden layers are combined in the usual way of linear combination.  
  
![Image title](/home/devansh/Documents/my_website/docs/assets/dl/nn2input.png){width=300px}