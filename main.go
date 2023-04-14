package main

import (
	"fmt"

	"github.com/jamesruan/sodium"
)

func main() {
	var challenge sodium.Bytes = make([]byte, 32)

	keypair := sodium.MakeSignKP()
	signature := challenge.SignDetached(keypair.SecretKey)

	err := challenge.SignVerifyDetached(signature, keypair.PublicKey)
	fmt.Println(err)
}
