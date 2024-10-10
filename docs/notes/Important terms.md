---
title: Important terms
---
- `offset:` offset of **x** means after **x** many units operation (writing/reading) should start.
	- The location accessed by an RMA operation depends on combining the `offset` specified on `origin` process and the `displacement` unit that was specified on the `target` process.

- `Page` : Computer systems have virtual memory management techniques where physical memory has been divided into fixed-sized block called pages.

- `Cache lines`: Cache lines are unit of data stored within cache. Data that will be retrieved from main memory will be in this unit. Its size generally matched with the size of memory blocks (page) to avoid cache misses.

- `Padding`: This refers to the process of adding few extra bytes at the end of the data structure in order to extend it to page boundary/cache line for optimization purposes.
	- Some systems need data to be of multiple of their cache lines/page boundaries to better memory access and avoid frequent cache misses.

- `Low Contention`: When number of process are less then for acquiring a memory location there will be less threads hence low contention.

- `Data access patterns:`The way in which data is access from memory can be predicted using data access patterns. Some patterns include:
	- Sequential vs Random data access
	- Spatial and Temporal Locality: Spatial $\implies$ location in memory and Temporal $\implies$ frequency of using that data
	- Stride: Pattern in which data elements are access relative to each other e.g. every first, every fourth etc.
- `Atomic operation`: Operation that can be completed in a single instruction cycle hence can not be hindered in between. That's why these operation does not require any window synchronization routines. E.g. `Accumulate`.

- `load`: Operation for using a value in a variable. ^load
- `store`: Operation for assigning a value to a variable. 

- `Memory Coherency`: Data in the cache represents a copy of data in the memory and when data in cache is updated it may not update the data in the memory or in another cache (representing the same memory address) until the same memory address is referenced in some process. These type of systems does not have a coherent memory.