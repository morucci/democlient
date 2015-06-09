import unittest
import mock

from democlient import democlient


class Demotest(unittest.TestCase):

    def test_get_local_factor(self):
        self.assertEqual(democlient.get_local_factor(), 10)

    def test_compute(self):
        if not democlient.demolib_available:
            democlient.demolib = mock.Mock()
            democlient.demolib.compute_demo = lambda x: x * 42
        self.assertEqual(democlient.compute(1), 420)
