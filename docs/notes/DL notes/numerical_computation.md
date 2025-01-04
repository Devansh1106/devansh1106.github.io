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