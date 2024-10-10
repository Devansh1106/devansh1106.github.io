---
title: Projects
description: Personal and academic projects
tags: 
    - project
---

Projects that I have done so far and enjoyed:  

- MPI-based Finite Difference Method for Parallel Numerical Simulation of Linear ODEs in C++
    - Applied master-worker parallel algorithm in solving linear boundary value problems with Dirichlet, Neumann, and mixed boundary conditions.
    - Code for parallel implementation of ordinary differential equation solver can be accessed [here](https://github.com/Devansh1106/ODE-Solver-Parallel).
- Serial Numerical Simulation of Linear ODEs using Finite Difference Method in C++
    - Studied Finite difference method, derivative approximations for boundary value problems with Dirichlet, Neumann and mixed boundary conditions.
    - Code for serial implementation of ordinary differential equation solver can be accessed [here](https://github.com/Devansh1106/ODE-Solver-Serial).
- Reading Project on Advance C++ and Message Passing Interface (MPI)
    - Studied point-to-point and collective communication as well as blocking and non-blocking communication routines in MPI.
    - Reading includes the book "Guide to Scientific Computing in C++" by Dr. Joe Pitt-Francis and Prof. Jonathan Whiteley and some online mpi-tutorial websites.
    - A parallel and serial implementation of Gauss Elimination using MPI can be found [here](https://github.com/Devansh1106/Parallel-Gauss-Elimination) and few other related codes can be found [here](https://github.com/Devansh1106/Sample-MPI-Programs).

## Open source contributions  

- [Distributed memory parallelization of Lax-Wendroff Flux Reconstruction](https://github.com/Arpit-Babbar/TrixiLW.jl/issues/33)
    - Performed parallelisation of the code for Lax-Wendroff Flux Reconstruction method for solving hyperbolic conservation laws for 1D and 2D cases using Message Passing Interface (MPI).
    - Improved execution time of code by 13 times on a multicore architecture with efficiency of 82% on cartesian and curvilinear meshes

## Some Other Codes  

- This repository [here](https://github.com/Devansh1106/Sample-MPI-Julia), contains code for Message Passing Interface (MPI) in Julia.
    - From simple implementations of MPI routines to code for Linear-advection equation in serial and parallel (MPI) are there.
    - Codes for parallelization using Remote Memory Access (RMA), which is included in MPI 3.0, are also there for Linear Advection equation (1D and 2D). 