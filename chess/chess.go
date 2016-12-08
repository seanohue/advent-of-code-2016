package chess

import (
	"crypto/md5"
	"encoding/hex"
	"io"
	"strconv"
	"strings"
	"unicode/utf8"
)

// Decode stuff.
func Decode(password string) string {
	secret := ""
	for i := 0; utf8.RuneCountInString(secret) < 8; i++ {
		hash := Hash(password, i)
		if IsInterestingHash(hash) {
			secret += string([]rune(hash)[5])
		}
	}
	return secret
}

// SmarterDecode for more complex stuff.
func SmarterDecode(password string) string {
	secretMap := make(map[int]string)

	for i := 0; len(secretMap) < 8; i++ {
		hash := Hash(password, i)

		if IsInterestingHash(hash) {
			position, error := strconv.Atoi(string([]rune(hash)[5]))

			if error == nil && position < 8 {
				if secretMap[position] == "" {
					secretMap[position] = string([]rune(hash)[6])
				}
			}
		}
	}

	secret := ""
	for j := 0; j < 8; j++ {
		secret += secretMap[j]
	}

	return secret
}

// Hash a thing
func Hash(password string, index int) string {
	hash := md5.New()
	io.WriteString(hash, password)
	io.WriteString(hash, strconv.Itoa(index))
	return hex.EncodeToString(hash.Sum(nil))
}

// IsInterestingHash if the hash has five zeros.
func IsInterestingHash(hash string) bool {
	return strings.HasPrefix(hash, "00000")
}
