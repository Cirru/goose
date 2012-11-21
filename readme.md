
## Goose is a command which adds brackets for golang!

Golang is great! But its syntax doesn't fit me..  
I have no idea about changing it. Only to change the way I code it.  
Please help me if you are familiar with Golang.  
Indentation-sensitive syntax is more concise. Some people like it, some hate it.  
But there should always be an alternative solution for the minority.  
Hope you like it.

### Installation

By now it's a simple and fragile script adding brackets by counting.  
There shouldn't be any output after running it. Note that I only tested on Linux.  
Installing it with npm, some of you may need to add `sudo`:

```
npm install -g goose
```

### Considered:

It'll be much more complicated to make it compatible with the whole go syntax.   
Below is the parts covered in this script:

* `var const import` use parentheses
* `case` don't need brackets
* `// comments` for comments
* `backquote` represents cross line strings
* golang use `"\t"` to indent

### Examples:

This is only a demo in fake code:

```go

package main

import "fmt"

func main()
  fmt.Println("Hello, 世界")


var
  Stdin  = newFile (0, "/dev/stdin")
  Stdout = newFile (1, "/dev/stdout")
  Stderr = newFile (2, "/dev/stderr")

import
  "./file"
  "flag"
  "fmt"
  "os"

const
  red = iota   // red == 0
  blue         // blue == 1
  green        // green == 2

 
func cat(f *file.File)
  const NBUF = 512
  var buf [NBUF]byte
  for
    switch nr, er := f.Read(buf[:]); true
    case nr < 0:
      fmt.Fprintf(os.Stderr, "cat: error reading from %s: %s\n", f.String(), er.String())
      os.Exit(1)
    case nr == 0:  // EOF
      return
    case nr > 0:
      if nw, ew := file.Stdout.Write(buf[0:nr]); nw != nr
        fmt.Fprintf(os.Stderr, "cat: error writing from %s: %s\n", f.String(), ew.String())

Otto.Set("def", 11)
Otto.Run(`
  console.log("The value of def is " + def)
    // The value of def is 1

`)
```

Converts to:

```go

package main

import "fmt"

func main() {
  fmt.Println("Hello, 世界")
}


var (
  Stdin  = newFile (0, "/dev/stdin")
  Stdout = newFile (1, "/dev/stdout")
  Stderr = newFile (2, "/dev/stderr")
)

import (
  "./file"
  "flag"
  "fmt"
  "os"
)

const (
  red = iota   // red == 0
  blue         // blue == 1
  green        // green == 2
)


func cat(f *file.File) {
  const NBUF = 512
  var buf [NBUF]byte
  for {
    switch nr, er := f.Read(buf[:]); true
    case nr < 0:
      fmt.Fprintf(os.Stderr, "cat: error reading from %s: %s\n", f.String(), er.String())
      os.Exit(1)
    case nr == 0:  // EOF
      return
    case nr > 0:
      if nw, ew := file.Stdout.Write(buf[0:nr]); nw != nr {
        fmt.Fprintf(os.Stderr, "cat: error writing from %s: %s\n", f.String(), ew.String())
      }
  }
}

Otto.Set("def", 11)
Otto.Run(`
  console.log("The value of def is " + def)
    // The value of def is 1

`)
```

### License

MIT