
## Goose is a command which adds brackets for golang!

Golang is great! But its syntax doesn't fit me..  
I have no idea about changing it. Only to change the way I code it.  
Please help me if you are familiar with Golang.  
Indentation-sensitive syntax is more concise. Some people like it, some hate it.  
But there should always be an alternative solution for the minority.  
Hope you like it.

### Installation

By now it's a simple and fragile script adding brackets by counting.  
Installing it with npm, some of you may need to add `sudo`:

```
npm install -g goose
```

Use command to watch files in the background. It will write `.go` in the same path.  
There shouldn't be any output after running it. Note that I only tested on Linux.  
```
goose files.gos file2.gos more-file.gos &
pkill -f goose
```

### Usage

`-o` option to specify output directory.

### Considered:

It'll be much more complicated to make it compatible with the whole go syntax.   
Below is the parts covered in this script:

* `var const import` use parentheses
* force `case default` to use curly brackets
* `// comments` for comments, `/* cross line */` is also available
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

/* comment
comment
    comment
  comment
*/
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
    case nr < 0: {
      fmt.Fprintf(os.Stderr, "cat: error reading from %s: %s\n", f.String(), er.String())
      os.Exit(1)
    }
    case nr == 0:  // EOF {
      return
    }
    case nr > 0: {
      if nw, ew := file.Stdout.Write(buf[0:nr]); nw != nr {
        fmt.Fprintf(os.Stderr, "cat: error writing from %s: %s\n", f.String(), ew.String())
      }
    }
  }
}

Otto.Set("def", 11)
Otto.Run(`
  console.log("The value of def is " + def)
    // The value of def is 1

`)

/* comment
comment {
    comment
  }
  comment
}
*/
```

### Syntax highlight

You can use the Sublime package to highlight:  
https://github.com/jiyinyiyong/Goose.sublime

### License

MIT