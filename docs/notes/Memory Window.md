---
title: Memory Window
---
## Window
<small> *Code syntaxes are in `julia` or `C`* </small>  

- It is the memory region of a process that can be accessed by another process using RMA operations.  

- All or a group of processes can create a/many windows by contributing some part of their memory to the window.  
	- If every process in the group is calling the function `MPI.Win_create()` with same `win` object then this window object will get shared with all these processes that have called the function.
- `window object` refers the collection of windows defined by the collective call to a window creation function.

- `displacement` unit should be the multiple of `sizeof()` of simple type such as `int` etc. that create up the window object.
	- Creation of `disp` like above mentioned way instead pf `bytes` has a advantage in heterogeneous systems where one core has `int` of $4$ bytes and another core (say $3$) has `int` of $8$ bytes (different from core $1$).
	- For e.g. if `disp`is in bytes and we need to write data at a `offset` of $10$ integers at core $3$ from core $1$ then core $1$ will send `offset` of $4 \times 10 = 40$ bytes which will be $5$ integers at core $3$ but it need to be $10$ integers.
	- On the contrary, if `disp` is in `sizeof(int)` here then $10$ integers would have been sent to core $3$, which has a window divided in blocks of its own integers hence $10$ integers will corresponds to $80$ bytes.  
- Often is to declare a *array* as a window and size of *array* as window size. But if more than one array is needed to declare as a window then merging of both the arrays will be needed.

- `alloc_shared_noncontig`: If this key is `true` then window regions for each process will not be contiguous hence they can be extend to page boundaries and help in memory optimization.

- Use of `MPI_Win_allocate` is preferred as it allows MPI implementation to optimize the allocation of memory and communication of the information needed to create `MPI_Win`.
	- `MPI_Free_mem` must be used to free memory created from this routine.