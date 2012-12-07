
func read_tail( in io.RuneScanner ) Object {
	token := next_token( in )

	result := Object(nil)

	if atom_equals( token, ")" ) {
		//pass
	}
	else if atom_equals( token, "(" ) {
		first := read_tail( in )
		second := read_tail( in )
		result = cons( first, second )
	}
	else {
		first := token
		second := read_tail( in )
		result = cons( first, second )
	}

	return result
}

func read( in io.RuneScanner ) Object {
	token := next_token( in )

	if atom_equals( token, "(" ) {
		token = read_tail( in )
	}

	return token
}


func main() {
	env := init_env()
	in := os.Stdin

	if len(os.Args) > 1 {
		in,_ = os.Open( os.Args[1] )
	}

	bufin := bufio.NewReader( in )

	for {
		fmt.Print("> ")
		readForm := read( bufin )
		result   := eval( readForm, env )
		print( result )
		fmt.Println()
	}
}
