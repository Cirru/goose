
package main

import "fmt"

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

Otto.Set("def", 11)
Otto.Run(`
	console.log("The value of def is " + def)
		// The value of def is 1

`)

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

func main() {
	fmt.Println("Hello, 世界")
}

/* comment
comment {
		comment
	}
	comment
}
*/
