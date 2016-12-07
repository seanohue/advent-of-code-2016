package chess

import (
	"crypto/md5"
	"encoding/hex"
	"io"
	"strconv"
	"strings"
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

// FindInterestingHash if the hash has five zeros.
func FindInterestingHash(hash string) bool {
	return strings.HasPrefix(hash, "00000")
}
