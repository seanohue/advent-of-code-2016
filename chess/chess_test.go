package chess

import "testing"

func TestPasswordChess(t *testing.T) {
	if Decode("abc") != "18f47a30" {
		t.Error("Failed to decode.")
	}
}

func TestHasher(t *testing.T) {
	interestingHash := Hash("abc", 3231929)
	if interestingHash != "00000155f8105dff7f56ee10fa9b9abd" {
		t.Error("Hashing is borked.")
	}
}

func TestInterestingHashFinder(t *testing.T) {
	if FindInterestingHash(Hash("abc", 3231929)) != true {
		t.Error("Did not catch the interesting hash")
	}
}
