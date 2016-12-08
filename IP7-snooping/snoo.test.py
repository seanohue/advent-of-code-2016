"These are unit tests."
import unittest
import snoo

class TestSnooper(unittest.TestCase):
    """Make sure the snooper be snooping properly."""

    def test_find_snoopable(self):
        """Test the ability to find a single snoopable IP."""
        self.assertEqual(snoo.find_snoopable("abba[mnop]qrst"), True)

    def test_find_unsnoopable_hypernet(self):
        """Test ability to find unsnoopable IP with hypernet [ABBA]."""
        self.assertEqual(snoo.find_snoopable("abcd[bddb]xyyx"), False)

    def test_find_unsnoopable_no_abba(self):
        """Test ability to find unsnoopable IP due to no ABBA."""
        self.assertEqual(snoo.find_snoopable("aaaa[qwer]tyui"), False)

    def test_find_snoopable_nested(self):
        """Test ability to find snoopable IP nested in larger string."""
        self.assertEqual(snoo.find_snoopable("abba[mnop]qrst"), True)

if __name__ == '__main__':
    unittest.main()
