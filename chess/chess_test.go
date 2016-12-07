package chess

import "testing"

func TestPasswordChess(t *testing.T) {
	if Decode("abc") != "18f47a30" {
		t.Error("Failed to decode.")
	}
}
