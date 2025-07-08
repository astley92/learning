# What Is This?

Just a small project to explore reading MySQL's log files like redo (same concept as Postgres WAL) and binlog files. 
Maybe can do something cool with it.
Written in Zig, and released using GHA and github releases.

## Why?

- I've used tools that interact with the files and want to have a bit of a dig around deeper
- I want to learn Zig
- I've never used github releases

## Plan

1. [x] Understand what InnoDB is...
    - It's a storage engine. In fact it's MySQL's default storage engine
    - BLACKHOLE storage engine looks pretty interesting. At first I didn't know wtf it would be used for, but there's a bunch
        of interesting use cases documented on the interwebs (replication, dump validation and perf testing etc).
1. [x] Put together a script that makes some changes to a locally running MySQL service
1. [x] Just dump the contents of the files to look at.
    - `cat /opt/homebrew/var/mysql/binlog.* >> output/binlog_output.txt`
    - `cat /opt/homebrew/var/mysql/\#innodb_redo/\#ib_redo* >> output/redo_output.txt`
1. [ ] Make exe that waits for changes to redo files and simply outputs file content to the terminal
    - Parsing file data where necessary
1. [ ] Make exe that waits for changes to binlog files and simply outputs file content to the terminal
    - Parsing file data where necessary

## To run

Install MySQL

    brew services install mysql

Start MySQL

    brew services start mysql

Start listener script
    
    TODO

Make some modifications to your MySQL data

    mysql -u root < ./mysql_commands.txt

## Dependencies

- MySQL
