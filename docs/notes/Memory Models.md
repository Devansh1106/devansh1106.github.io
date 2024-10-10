---
title: Memory Models
---
### Separate memory model
The entire RMA implementation is based on the concept of `public` and `private` memory.
Local `load` and `store` operations use `private` memory while the RMA operations uses `public` exposed memory.

`MPI_Win_fence` essentially makes the sure that whatever changes were made to `public` memory has been copied to `private` memory. Different values of `assert` parameter can be provided to avoid unnecessary copying.

The above reasoning also says that only `RMA` routines must be used to update memory location in `public` memory window object. This is called **separate memory** model.
![Separate memory model](Attachments/Separate_mem_model_.png)

### Unified memory model
In most of MPI implementations, the `public` and `private` memory are not different memory locations i.e. changes made to `private` memory location will **eventually** become visible to `public` memory but the keyword here is **eventually**.

Hence programmers need to make sure the visibility of changes by using synchronization routines such as `fence`,`unlock` or `MPI_Win_Sync`(it synchronizes )