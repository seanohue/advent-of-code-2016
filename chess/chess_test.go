package chess

import (
	"fmt"
	"testing"
)

func TestPasswordChess(t *testing.T) {
	decoded := Decode("abc")
	if decoded != "18f47a30" {
		fmt.Println("Got: ")
		fmt.Println(decoded)
		t.Error("Failed to decode: ")
	}
}

func TestHasher(t *testing.T) {
	interestingHash := Hash("abc", 3231929)
	if interestingHash != "00000155f8105dff7f56ee10fa9b9abd" {
		t.Error("Hashing is borked.")
	}
}

func TestInterestingHashFinder(t *testing.T) {
	if IsInterestingHash(Hash("abc", 3231929)) != true {
		t.Error("Did not catch the interesting hash")
	}
}
