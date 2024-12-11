---
title: Julia Basics
description: From the video- [link](https://www.youtube.com/watch?v=M2i7sSRcSIw&list=PLCAl7tjCwWyGjdzOOnlbGnVNZk0kB8VSa&index=3)
author: Devansh Tripathi
date: 2024/10/13
draft: True
---

If size is small then time taken in allocation (O(n)) matter; but for large matrix sizes, it will not matter since matrix operations are O(n^3).  
Avoid heap allocations. They are slower as compared to stack allocations. But at the same time do not put large objects in stack that makes it more slower.  
Array are always allocated on heap. So avoid many array calls, try to fuse loops and use vectorisation for this.  

- Broadcast operations are faster. For e.g. `C .= A .+ B` will be faster and will take less memory if everything is passed to the function, nothing is being allocated inside the function. (ideal way of julia writing).
    - Under the hood, broadcast operation is using `for` loops.

- `@inbounds` macro: Removes checks for bounds in order to improve performance.
- `@boundscheck` macro: Checks for bounds.
- `@view` macro: Makes a view of the memory location passed to it (does not allocate new memory unlike slicing does). Basically, it creates a pointer pointing in the direction of original object (pointer will allocate some memory for it, but it will be constant and does not depend upon the array to which it is pointing).  
- `@code_llvm`: Gives compiler code for the function.  
- `@code_typed`: Gives compiler code with names of registers and their types (if available).  
- `@code_warntype`: Gives information of types considered by compiler.  
- `isbits()`: It check if the given value is of some amount of bits (32, 64, etc.). If given value is of type `Any` or `Number`, it return false since it does not have fixed bits.  
Compiler constant: Objects whose values are known at compile time.  

### What is inlining?

There is a cost model in compiler of the languages that checks for the cost of computation and check whether to make the function inline or not.  
Inlining means the compiler replace the function call with `llvm` (compiler) code of the function to avoid function calls.  
Small function are advised to be inlined using `@inline`. It also affects the size of the code hence not all functions need to be inlined.  

### What is branch prediction?

On the basis of some relational operation, compiler goes to every branch and check if this is the suitable branch or not.  
Cost of branch prediction is high since checking if a certain branch is correct is time taking and meanwhile cpu proceeds to do calculations for this branch so if later the branch is incorrect, it looses all those calculations and then starts from the beginning for other branches.  
