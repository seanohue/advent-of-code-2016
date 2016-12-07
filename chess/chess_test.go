package chess

import "testing"
func TestSanity(t *testing.T) {
  if true != false {
    t.Error("oh noes")
  }
}