package main

import (
	"context"
	"flag"
	"fmt"
	"math/rand"
	"strings"

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
		panic(err)
	}
	defer func() {
		_ = conn.Close(ctx)
	}()

	regions := []string{"us-west1", "us-east1", "europe-west1"}
	for _, stmt := range []string{
		"DROP DATABASE IF EXISTS d",
		`CREATE DATABASE d PRIMARY REGION "us-west1"`,
		`USE d`,
	} {
		_, err := conn.Exec(ctx, stmt)
		if err != nil {
			fmt.Printf("ERROR: %v\n", err)
		}
	}

	rng := rand.New(rand.NewSource(88199))

	randomCommands := []func() string{
		func() string {
			i := rng.Intn(len(regions))
			return fmt.Sprintf(`ALTER DATABASE d ADD REGION "%s"`, regions[i])
		},
		func() string {
			i := rng.Intn(len(regions))
			return fmt.Sprintf(`ALTER DATABASE d DROP REGION "%s"`, regions[i])
		},
		func() string {
			i := rng.Intn(len(regions))
			return fmt.Sprintf(`ALTER DATABASE d SET PRIMARY REGION "%s"`, regions[i])
		},
		func() string {
			return fmt.Sprintf(`ALTER DATABASE d SURVIVE ZONE FAILURE`)
		},
		func() string {
			return fmt.Sprintf(`ALTER DATABASE d SURVIVE REGION FAILURE`)
		},
		func() string {
			return fmt.Sprintf(`DROP DATABASE IF EXISTS d`)
		},
		func() string {
			return fmt.Sprintf(`DROP DATABASE IF EXISTS d CASCADE`)
		},
		func() string {
			return fmt.Sprintf(`SHOW TABLES`)
		},
		func() string {
			return fmt.Sprintf(`SHOW DATABASES`)
		},
		func() string {
			return fmt.Sprintf(`CREATE DATABASE IF NOT EXISTS d`)
		},
		func() string {
			return fmt.Sprintf(`CREATE TABLE IF NOT EXISTS t%d () LOCALITY REGIONAL BY TABLE`, rng.Intn(10))
		},
		func() string {
			return fmt.Sprintf(`CREATE TABLE IF NOT EXISTS t%d () LOCALITY REGIONAL BY ROW`, rng.Intn(10))
		},
		func() string {
			return fmt.Sprintf(`CREATE TABLE IF NOT EXISTS t%d () LOCALITY GLOBAL`, rng.Intn(10))
		},
		func() string {
			return fmt.Sprintf(`ALTER TABLE t%d SET LOCALITY REGIONAL BY ROW`, rng.Intn(10))
		},
		func() string {
			return fmt.Sprintf(`ALTER TABLE t%d SET LOCALITY GLOBAL`, rng.Intn(10))
		},
		func() string {
			return fmt.Sprintf(`ALTER TABLE t%d SET LOCALITY REGIONAL BY TABLE`, rng.Intn(10))
		},
		func() string {
			i := rng.Intn(len(regions))
			return fmt.Sprintf(`ALTER TABLE t%d SET LOCALITY REGIONAL BY TABLE IN "%s"`, rng.Intn(10), regions[i])
		},
	}

	for {
		i := rng.Intn(len(randomCommands))
		cmd := randomCommands[i]()
		fmt.Printf("command: %s\n", cmd)
		_, err := conn.Exec(ctx, cmd)
		if err != nil {
			fmt.Printf("ERROR: %v\n", err)
			if strings.Contains(err.Error(), "primary region unset on a multi-region db") {
				break
			}
		}

	}
}
