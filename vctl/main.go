package main

import (
	"os"

	log "github.com/Sirupsen/logrus"
	"github.com/octoblu/vulcand-bundle/registry"
	"github.com/vulcand/vulcand/vctl/command"
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
