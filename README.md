# goose-wrapper

This application adds output formatting options to [goose](https://github.com/pressly/goose).

## commands

```sh
Usage: goose DRIVER DBSTRING [OPTIONS] COMMAND                                                                                                                                                                                                                        or

Set environment key
GOOSE_DRIVER=DRIVER
GOOSE_DBSTRING=DBSTRING
GOOSE_MIGRATION_DIR=MIGRATION_DIR

Usage: goose [OPTIONS] COMMAND

Drivers:
    postgres
    mysql
    sqlite3
    spanner
    mssql
    redshift
    tidb
    clickhouse
    ydb
    starrocks
    turso

Examples:
    goose sqlite3 ./foo.db status
    goose sqlite3 ./foo.db create init sql
    goose sqlite3 ./foo.db create add_some_column sql
    goose sqlite3 ./foo.db create fetch_user_data go
    goose sqlite3 ./foo.db up

    goose postgres "user=postgres dbname=postgres sslmode=disable" status
    goose redshift "postgres://user:password@qwerty.us-east-1.redshift.amazonaws.com:5439/db" status
    goose tidb "user:password@/dbname?parseTime=true" status
    goose mssql "sqlserver://user:password@dbname:1433?database=master" status
    goose clickhouse "tcp://127.0.0.1:9000" status
    goose ydb "grpcs://localhost:2135/local?go_query_mode=scripting&go_fake_tx=scripting&go_query_bind=declare,numeric" status
    goose turso "libsql://dbname.turso.io?authToken=token" status

    GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./foo.db goose status
    GOOSE_DRIVER=sqlite3 GOOSE_DBSTRING=./foo.db goose create init sql
    GOOSE_DRIVER=postgres GOOSE_DBSTRING="user=postgres dbname=postgres sslmode=disable" goose status
    GOOSE_DRIVER=redshift GOOSE_DBSTRING="postgres://user:password@qwerty.us-east-1.redshift.amazonaws.com:5439/db" goose status
    GOOSE_DRIVER=turso GOOSE_DBSTRING="libsql://dbname.turso.io?authToken=token" goose status
    GOOSE_DRIVER=clickhouse GOOSE_DBSTRING="clickhouse://user:password@qwerty.clickhouse.cloud:9440/dbname?secure=true&skip_verify=false" goose status

Options:

  -allow-missing
        applies missing (out-of-order) migrations
  -dir string
        directory with migration files, (GOOSE_MIGRATION_DIR env variable supported) (default ".")
  -env string
        load environment variables from file (default .env)
  -h    print help
  -no-color
        disable color output (NO_COLOR env variable supported)
  -no-versioning
        apply migration commands with no versioning, in file order, from directory pointed to
  -output string
        output log format type: std/disable/slog/json (default "std")
  -s    use sequential numbering for new migrations
  -table string
        migrations table name
  -timeout duration
        maximum allowed duration for queries to run; e.g., 1h13m
  -v    enable verbose mode
  -version
        print version

Commands:
    up                   Migrate the DB to the most recent version available
    up-by-one            Migrate the DB up by 1
    up-to VERSION        Migrate the DB to a specific VERSION
    down                 Roll back the version by 1
    down-to VERSION      Roll back to a specific VERSION
    redo                 Re-run the latest migration
    reset                Roll back all migrations
    status               Dump the migration status for the current DB
    version              Print the current version of the database
    create NAME [sql|go] Creates new migration file with the current timestamp
    fix                  Apply sequential ordering to migrations
    validate             Check migration files without running them
```

## usage

```bash
goose [command] [arguments]

# example
goose -output=json up
```
