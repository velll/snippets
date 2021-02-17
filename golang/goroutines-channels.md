---
title: 'Goroutines and channels syntax'
---

```go
func offloadWork() {
  ...
}
```

Start a goroutine
```go
go offload()
```

Create and pass a channel
```go
reports := make(chan bool)
go offload(report)
```

Write to channel
```go
channel <- true
```

Read from channel
```go
done := <-channel
```

## Example
```go
package main

import (
	"fmt"
	"math/rand"
	"time"
)

func doWork() {
	fmt.Println("Doing heavy stuff")

	random := rand.Intn(10)

	if random > 5 {
		panic("Something utterly unexpected")
	} else {
		time.Sleep(1 * time.Second)
	}
}

func offload(ch chan bool) {
	rand.Seed(time.Now().UnixNano())

	defer func() {
		if e := recover(); e != nil {
			fmt.Println("Recovering")
			ch <- false // Write TO channel
		}
	}()

	doWork()

	ch <- true // Write TO channel
}

func main() {
	report := make(chan bool)
	go offload(report)

	done := <-report // Reading FROM channel
	fmt.Println("Are we done? ", done)
}
```
