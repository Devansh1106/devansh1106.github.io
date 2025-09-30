---
title: Projects
description: Personal and academic projects
tags: 
    - project
---

Projects that I have done so far and enjoyed:  

## 2025

- **Universal Approximation Theorem for Geometry Aware Operator Transformer (GAOT)**
    - Proved Universal Approximation property (UAP) for Geometry Aware Operator Transformer (GAOT). UAP is the density result that says: GAOT can approximate any continuous solution operator between $L^p$ spaces with arbitrary accuracy.
    - GAOT is the deep learning-based PDE solver that uses operator learning and transformers to numerically solve PDEs.
    - GAOT learns the solution operators of PDEs on arbitrary domains accurately and efficiently for CFD simulations. Hence theoretical foundations for GAOT are of great importance.
    - I learned classical PDE analysis, measure theory, functional and Fourier analysis and applied techniques from these areas to prove universal approximation property.

## 2024

- [Distributed memory parallelization of Lax-Wendroff Flux Reconstruction](https://github.com/Arpit-Babbar/TrixiLW.jl/issues/33)
    - Performed parallelisation of the code for Lax-Wendroff Flux Reconstruction method for solving hyperbolic conservation laws for 1D and 2D cases using Message Passing Interface (MPI).
    - Improved execution time of code by 13 times on a multicore architecture with efficiency of 82% on cartesian and curvilinear meshes
    - The project report can be accessed [here](https://github.com/Devansh1106/internship_tifr_cam2024).

## 2023

- [MPI-based Finite Difference Method for Parallel Numerical Simulation of Linear ODEs in C++](https://github.com/Devansh1106/ODE-Solver-Parallel)
    - Applied master-worker parallel algorithm in solving linear boundary value problems with Dirichlet, Neumann, and mixed boundary conditions.
    - Code for parallel implementation of ordinary differential equation solver can be accessed [here](https://github.com/Devansh1106/ODE-Solver-Parallel).
- [Serial Numerical Simulation of Linear ODEs using Finite Difference Method in C++](https://github.com/Devansh1106/ODE-Solver-Serial)
    - Studied Finite difference method, derivative approximations for boundary value problems with Dirichlet, Neumann and mixed boundary conditions.
    - Code for serial implementation of ordinary differential equation solver can be accessed [here](https://github.com/Devansh1106/ODE-Solver-Serial).
- [Reading Project on Advance C++ and Message Passing Interface (MPI)](https://github.com/Devansh1106/Parallel-Gauss-Elimination)
    - Studied point-to-point and collective communication as well as blocking and non-blocking communication routines in MPI.
    - Reading includes the book "Guide to Scientific Computing in C++" by Dr. Joe Pitt-Francis and Prof. Jonathan Whiteley and some online mpi-tutorial websites.
    - A parallel and serial implementation of Gauss Elimination using MPI can be found [here](https://github.com/Devansh1106/Parallel-Gauss-Elimination) and few other related codes can be found [here](https://github.com/Devansh1106/Sample-MPI-Programs).

## Some Other Codes (2024)

- This repository [here](https://github.com/Devansh1106/Sample-MPI-Julia), contains code for Message Passing Interface (MPI) in Julia.
    - From simple implementations of MPI routines to code for Linear-advection equation in serial and parallel (MPI) are there.
    - Codes for parallelization using Remote Memory Access (RMA), which is included in MPI 3.0, are also there for Linear Advection equation (1D and 2D). 