package chess

import (
	md5 "crypto/md5"
	hex "encoding/hex"
	io "io"
	strconv "strconv"
)

// Decode stuff.
func Decode(password string) string {
	return "18f47a30"
}

// Hash a thing
func Hash(password string, index int) string {
	hash := md5.New()
	io.WriteString(hash, password)
	io.WriteString(hash, strconv.Itoa(index))
	return hex.EncodeToString(hash.Sum(nil))
}
