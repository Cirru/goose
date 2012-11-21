
## Goose is a command which adds brackets for golang!

Golang is great! But its syntax don't fit me..  
I have no idea about changing it. So, change the way I code.  
Please help me if you are familiar with Golang, or if you like indentation-sensitive syntax.
Hope you like it.

### Installation

By now it's a simple and fragile script adding brackets by counting.  
Installing it with npm, you may need to add `sudo` in front:

```
npm install -g goose
```

### Consodered:

* `var const import` use parentheses
* `case` don't need brackets
* `// comments` for comments

### Examples:

This is only a demo in fake code. Things not listed haven't be consodered.

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
```

```
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
```

### License

MIT