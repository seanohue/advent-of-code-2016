"These are unit tests."
import unittest
import snoo

class TestSnooper(unittest.TestCase):
    """Make sure the snooper be snooping properly."""

    def test_find_snoopable(self):
        """Test the ability to find a single snoopable IP."""
        self.assertTrue(snoo.find_snoopable("abba[mnop]qrst"))

    def test_find_unsnoopable_hypernet(self):
        """Test ability to find unsnoopable IP with hypernet [ABBA]."""
        self.assertFalse(snoo.find_snoopable("abcd[bddb]xyyx"))

    def test_find_unsnoopable_no_abba(self):
        """Test ability to find unsnoopable IP due to no ABBA."""
        self.assertFalse(snoo.find_snoopable("aaaa[qwer]tyui"))

    def test_find_snoopable_nested(self):
        """Test ability to find snoopable IP nested in larger string."""
        self.assertTrue(snoo.find_snoopable("abba[mnop]qrst"))

    def test_find_any_abba(self):
        """Test ability to find an ABBA"""
        self.assertTrue(snoo.find_abba("ABBAYTG"))

    def test_find_not_abba(self):
        """Finds non-ABBA False"""
        print snoo.sum_snoopables()
        self.assertFalse(snoo.find_abba("HATS32FGGGGGGGG1"))

if __name__ == '__main__':
    unittest.main()

