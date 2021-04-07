package main

import (
	"context"
	"flag"
	"fmt"
	"log"

	"github.com/jackc/pgx/v4"
)

var flagPGURL = flag.String(
	"pg_url",
	"postgresql://root@localhost:26257?sslmode=disable",
	"CRDB server",
)

func main() {
	flag.Parse()

	ctx := context.Background()

	conn, err := pgx.Connect(ctx, *flagPGURL)
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		_ = conn.Close(ctx)
	}()

	if _, err := conn.Prepare(ctx, "bob", "SELECT * FROM test WHERE $1::int = $1::int"); err != nil {
		log.Fatal(err)
	}

	for at := 0; at < 100000; at++ {
		row := conn.QueryRow(ctx, "bob", at)
		var i int
		if err := row.Scan(&i); err != nil {
			panic(err)
		}
		fmt.Printf("attempt %d ok\n", at+1)
	}
}
