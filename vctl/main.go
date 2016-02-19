package main

import (
    log "github.com/Sirupsen/logrus"
	"github.com/vulcand/vulcand/vctl/command"
	"github.com/octoblu/vulcand-bundle/registry"
	"os"
)

func main() {
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
