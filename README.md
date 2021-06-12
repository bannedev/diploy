# DIPLOY

A utility to manage your linux deployments.

## How does it work

- You start a server using `diploy server`
- **diploy** exposes a http server for instructions [take care of *firewall* !!]
- You create a `diploy.yml` with below format file and run `diploy add` in the same directory.
- Now you get endpoits for each configuration you add with the below format.
- Use these as webhooks with Github... or just manually.
- Or just use the CLI for manual work.

## diploy.yml

```
name: <Application Name>    // These should be unique across installation
update:                     // Specify command to update
                            // codebase (optional [default `git pull`])
  command: git pull         // Command/Script to run to update
  type: command             // Whether a script (run using /bin/sh) or command
build:                      // To build stuff
  command: echo This is build
  type: command
run:                        // To start the application
  command: echo This is run
  type: command
```

## endpoints
All requests are POST requests.

For now there is no authentication in this. (See TODO)

#### Start processes
start:
  - update codebase: `/start/update/{name}`
  - build application: `/start/build/{name}`
  - run application: `/start/run/{name}`

#### Stop processes for a given application
stop:
    `/stop/{name}`


### CLI Usage

```
Usage:
  diploy [command]

Available Commands:
  add         add a configuration
  help        Help about any command
  remove      remove a configuaration by name
  server      Start diploy server
  start       start a service with name
  stop        stop a service with name

Flags:
  -h, --help     help for diploy
  -t, --toggle   Help message for toggle

Use "diploy [command] --help" for more information about a command.
```

**Extra:** Use `diploy server setup` to setup a systemd file.

### Caveats
- Processes started with **diploy** will also stop if diploy is stopped.

### Troubleshooting
- If there is an error `Environment variable `DIPLOY_LOG_PATH` not set`, set a temporary environment variable with value './' accroding to OS (if testing).
### Todo
See the dedicated [TODO](./TODO.md) file.

## Stuff Used

- gorm + sqlite
- gorilla/mux
- cobra
- go-yaml