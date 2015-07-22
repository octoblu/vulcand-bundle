package main

import (
    "github.com/mailgun/log"
	"github.com/mailgun/vulcand/vctl/command"
	"github.com/octoblu/vulcand-bundle/registry"
	"os"
)

var vulcanUrl string

func main() {
        console, _ := log.NewLogger(log.Config{"console", "info"})

        log.Init(console)
    r, err := registry.GetRegistry()
	if err != nil {
		log.Errorf("Error: %s\n", err)
        return
	}
	cmd := command.NewCommand(r)
	if err := cmd.Run(os.Args); err != nil {
		log.Errorf("Error: %s\n", err)
	}
}
