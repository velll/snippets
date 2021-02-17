---
title: 'Goroutines and waitgroups syntax'
---
Create a waitroup
```go
wg := new(sync.WaitGroup)
```

Add a number of tasks to waitgroup
```go
wg.Add(7)
```

Pass waitgroup to the goroutine
```go
func offloadWork(wg *sync.WaitGroup) {
  ...
}

...
  go offloadWork(wg)
...
```

Mark one (current) task as done
```go
wg.Done()
```

Wait for all tasks to finish
```go
wg.Wait()
```

## Example

```go
package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

func offload(wg *sync.WaitGroup) {
	fmt.Println("Doing heavy stuff")
	time.Sleep(1 * time.Second)

	wg.Done()
}

func main() {
	rand.Seed(time.Now().UnixNano())

	wg := new(sync.WaitGroup)
	tasks := rand.Intn(10)

	fmt.Println("Creating ", tasks, " tasks")

	wg.Add(tasks)
	for i := 0; i < tasks; i++ {
		go offload(wg)
	}

	wg.Wait()
	fmt.Println("We're done")

}
```
